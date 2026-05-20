import json
import sys
import tempfile
import unittest
from pathlib import Path

sys.path.append(str(Path(__file__).parent))

from recommender import (
    OnboardingProfile,
    PlanFeedback,
    RecommenderArtifacts,
    evaluate_recommender,
    recommend_plan,
    train_artifacts,
)


class RecommenderTest(unittest.TestCase):
    def setUp(self):
        self.base_dir = Path(__file__).parent
        self.gym_csv = self.base_dir / "megaGymDataset.csv"
        self.food_csv = self.base_dir / "foods_usda.csv"

    def test_train_artifacts_builds_ensemble_workout_and_nutrition_models(self):
        artifacts = train_artifacts(self.gym_csv, self.food_csv)

        self.assertGreater(len(artifacts.workouts), 100)
        self.assertGreater(len(artifacts.foods), 10)
        self.assertIn("Dumbbell", artifacts.equipment_aliases)
        self.assertIn("lose_fat", artifacts.goal_food_targets)
        self.assertEqual(artifacts.workout_model["model_type"], "sklearn-random-forest-regressor")
        self.assertEqual(artifacts.workout_model["n_estimators"], 120)
        self.assertIn("feature_importances", artifacts.workout_model)
        self.assertEqual(len(artifacts.workout_model["feature_importances"]), len(artifacts.workout_model["feature_names"]))
        self.assertEqual(artifacts.nutrition_model["model_type"], "sklearn-random-forest-multioutput-regressor")
        self.assertIn("target_names", artifacts.nutrition_model)
        self.assertEqual(artifacts.nutrition_model["target_names"], ["protein_target_g", "carb_target_g", "fat_target_g"])

    def test_recommend_plan_returns_model_scores_and_predicted_macro_targets(self):
        artifacts = train_artifacts(self.gym_csv, self.food_csv)
        profile = OnboardingProfile(
            goal="build muscle",
            equipment=["Dumbbells", "Bench"],
            height_cm=180,
            weight_kg=82,
            age=29,
            activity_level="very active",
        )

        plan = recommend_plan(profile, artifacts)

        self.assertEqual(len(plan["workouts"]), 5)
        self.assertTrue(all("model_score" in item for item in plan["workouts"]))
        self.assertTrue(all(isinstance(item["model_score"], float) for item in plan["workouts"]))
        self.assertGreater(plan["protein_target_g"], 0)
        self.assertGreater(plan["carb_target_g"], 0)
        self.assertGreater(plan["fat_target_g"], 0)
        self.assertTrue(all("macro_model_score" in item for item in plan["meals"]))
        self.assertTrue(any(item["equipment"] == "Dumbbell" for item in plan["workouts"]))

    def test_artifacts_save_writes_model_metadata(self):
        artifacts = train_artifacts(self.gym_csv, self.food_csv)

        with tempfile.TemporaryDirectory() as tmp_dir:
            path = Path(tmp_dir) / "artifacts.json"
            artifacts.save(path)
            payload = json.loads(path.read_text(encoding="utf-8"))

        self.assertEqual(payload["workout_model"]["model_type"], "sklearn-random-forest-regressor")
        self.assertIn("feature_names", payload["workout_model"])
        self.assertIn("feature_importances", payload["workout_model"])
        self.assertEqual(payload["nutrition_model"]["model_type"], "sklearn-random-forest-multioutput-regressor")
        self.assertIn("target_names", payload["nutrition_model"])

    def test_recommend_plan_prefers_available_equipment_and_returns_meals(self):
        artifacts = train_artifacts(self.gym_csv, self.food_csv)
        profile = OnboardingProfile(
            goal="lose fat",
            equipment=["Dumbbells", "Bench", "Yoga Mat"],
            height_cm=175,
            weight_kg=70,
            age=25,
            activity_level="active",
        )

        plan = recommend_plan(profile, artifacts)

        self.assertEqual(plan["goal_slug"], "lose_fat")
        self.assertEqual(plan["daily_calorie_target"], 2209)
        self.assertEqual(len(plan["workouts"]), 5)
        self.assertEqual(len(plan["meals"]), 3)
        self.assertTrue(any(item["equipment"] == "Dumbbell" for item in plan["workouts"]))
        self.assertTrue(all(item["keyword"] for item in plan["meals"]))

    def test_recommend_plan_prefers_clean_plain_foods_for_nutrition(self):
        artifacts = train_artifacts(self.gym_csv, self.food_csv)
        profiles = [
            OnboardingProfile("build muscle", ["Dumbbells", "Bench"], 180, 82, 29, "very active"),
            OnboardingProfile("stay active", ["Yoga Mat"], 165, 58, 34, "light"),
            OnboardingProfile("get stronger", ["Dumbbells"], 178, 78, 31, "active"),
        ]
        blocked_terms_by_keyword = {
            "egg": ["yolk", "goose", "duck", "quail"],
            "milk": ["evaporated", "dry", "dried", "powder"],
            "white rice": ["with fat", "made with oil", "made with butter", "made with margarine", "uncooked", "raw"],
        }

        meals = [meal for profile in profiles for meal in recommend_plan(profile, artifacts)["meals"]]

        for meal in meals:
            blocked_terms = blocked_terms_by_keyword.get(meal["keyword"], [])
            description = meal["description"].lower()
            self.assertFalse(
                any(term in description for term in blocked_terms),
                f"{meal['keyword']} picked low-quality food: {meal['description']}",
            )

    def test_artifacts_can_be_saved_and_loaded(self):
        artifacts = train_artifacts(self.gym_csv, self.food_csv)

        with tempfile.TemporaryDirectory() as tmp_dir:
            path = Path(tmp_dir) / "artifacts.json"
            artifacts.save(path)
            loaded = RecommenderArtifacts.load(path)

        self.assertEqual(len(loaded.workouts), len(artifacts.workouts))
        self.assertEqual(loaded.goal_food_targets, artifacts.goal_food_targets)
        self.assertEqual(loaded.workout_model["model_type"], artifacts.workout_model["model_type"])
        self.assertEqual(loaded.nutrition_model["target_names"], artifacts.nutrition_model["target_names"])

    def test_loaded_artifacts_use_persisted_estimators_for_inference(self):
        profile = OnboardingProfile(
            goal="build muscle",
            equipment=["Dumbbells", "Bench"],
            height_cm=180,
            weight_kg=82,
            age=29,
            activity_level="very active",
        )

        with tempfile.TemporaryDirectory() as tmp_dir:
            model_dir = Path(tmp_dir) / "models"
            artifacts = train_artifacts(self.gym_csv, self.food_csv, model_dir=model_dir)
            path = Path(tmp_dir) / "artifacts.json"
            artifacts.save(path)
            loaded = RecommenderArtifacts.load(path)

            self.assertTrue(Path(loaded.workout_model["model_path"]).exists())
            self.assertTrue(Path(loaded.nutrition_model["model_path"]).exists())
            fresh_plan = recommend_plan(profile, artifacts)
            loaded_plan = recommend_plan(profile, loaded)

        self.assertEqual(
            [item["model_score"] for item in loaded_plan["workouts"]],
            [item["model_score"] for item in fresh_plan["workouts"]],
        )
        self.assertTrue(all(score <= 15 for score in [item["model_score"] for item in loaded_plan["workouts"]]))

    def test_food_artifacts_preserve_metadata_needed_for_safe_meal_plans(self):
        artifacts = train_artifacts(self.gym_csv, self.food_csv)
        food = artifacts.foods[0]

        self.assertIn("fdc_id", food)
        self.assertIn("food_category", food)
        self.assertIn("serving_size", food)
        self.assertIn("serving_unit", food)
        self.assertIn("allergens", food)
        self.assertIn("diet_tags", food)

    def test_recommend_plan_returns_coach_contract_and_safety_notes(self):
        artifacts = train_artifacts(self.gym_csv, self.food_csv)
        profile = OnboardingProfile(
            goal="lose fat",
            equipment=["None"],
            height_cm=175,
            weight_kg=70,
            age=25,
            activity_level="active",
        )

        plan = recommend_plan(profile, artifacts)

        self.assertEqual(plan["schema_version"], "coach-plan-v1")
        self.assertTrue(plan["safety_notes"])
        for workout in plan["workouts"]:
            self.assertIn("sets", workout)
            self.assertIn("reps", workout)
            self.assertIn("rest_seconds", workout)
            self.assertIn("rationale", workout)
            self.assertIn(workout["equipment"], ["Body Only"])
        for meal in plan["meals"]:
            self.assertIn("serving_size", meal)
            self.assertIn("serving_unit", meal)
            self.assertIn("rationale", meal)

    def test_recommend_plan_rejects_unsafe_biometrics(self):
        artifacts = train_artifacts(self.gym_csv, self.food_csv)
        profile = OnboardingProfile(
            goal="lose fat",
            equipment=["None"],
            height_cm=80,
            weight_kg=30,
            age=12,
            activity_level="active",
        )

        with self.assertRaises(ValueError):
            recommend_plan(profile, artifacts)

    def test_recommend_plan_filters_allergens_and_reports_macro_coverage(self):
        artifacts = train_artifacts(self.gym_csv, self.food_csv)
        profile = OnboardingProfile(
            goal="build muscle",
            equipment=["Dumbbells", "Bench"],
            height_cm=180,
            weight_kg=82,
            age=29,
            activity_level="very active",
            allergies=["milk", "egg"],
        )

        plan = recommend_plan(profile, artifacts)

        self.assertIn("daily_macro_coverage", plan)
        self.assertTrue(all("portion_grams" in meal for meal in plan["meals"]))
        self.assertTrue(all(meal["portion_grams"] > 0 for meal in plan["meals"]))
        self.assertFalse(any("milk" in meal["allergens"] or "egg" in meal["allergens"] for meal in plan["meals"]))

    def test_recommend_plan_uses_realistic_single_food_portions(self):
        artifacts = train_artifacts(self.gym_csv, self.food_csv)
        profile = OnboardingProfile("lose fat", ["None"], 175, 70, 25, "active")

        plan = recommend_plan(profile, artifacts)

        for meal in plan["meals"]:
            self.assertLessEqual(meal["portion_grams"], 250)
        egg = next(meal for meal in plan["meals"] if meal["keyword"] == "egg")
        banana = next(meal for meal in plan["meals"] if meal["keyword"] == "banana")
        self.assertLessEqual(egg["portion_grams"], 120)
        self.assertLessEqual(banana["portion_grams"], 150)

    def test_recommend_plan_prefers_exercises_with_coachable_descriptions(self):
        artifacts = train_artifacts(self.gym_csv, self.food_csv)
        profile = OnboardingProfile(
            goal="lose fat",
            equipment=["Dumbbells", "Bench", "Yoga Mat"],
            height_cm=175,
            weight_kg=70,
            age=25,
            activity_level="active",
        )

        plan = recommend_plan(profile, artifacts)

        self.assertTrue(all(item["desc"].strip() for item in plan["workouts"]))
        self.assertTrue(all(0 <= item["confidence"] <= 1 for item in plan["workouts"]))

    def test_recommend_plan_returns_weekly_coach_schedule(self):
        artifacts = train_artifacts(self.gym_csv, self.food_csv)
        profile = OnboardingProfile(
            goal="build muscle",
            equipment=["Dumbbells", "Bench"],
            height_cm=180,
            weight_kg=82,
            age=29,
            activity_level="very active",
        )

        plan = recommend_plan(profile, artifacts)

        self.assertEqual(len(plan["weekly_schedule"]), 7)
        training_days = [day for day in plan["weekly_schedule"] if day["type"] == "training"]
        rest_days = [day for day in plan["weekly_schedule"] if day["type"] == "recovery"]
        self.assertGreaterEqual(len(training_days), 3)
        self.assertGreaterEqual(len(rest_days), 1)
        self.assertTrue(all(day["focus"] for day in plan["weekly_schedule"]))
        self.assertTrue(all("warm_up" in day for day in training_days))
        self.assertTrue(all("cooldown" in day for day in training_days))

    def test_recommend_plan_respects_injury_constraints(self):
        artifacts = train_artifacts(self.gym_csv, self.food_csv)
        profile = OnboardingProfile(
            goal="lose fat",
            equipment=["Dumbbells", "Bench"],
            height_cm=175,
            weight_kg=70,
            age=25,
            activity_level="active",
            injuries=["lower_back"],
        )

        plan = recommend_plan(profile, artifacts)

        blocked_terms = ["deadlift", "good morning", "hyperextension"]
        titles = " ".join(workout["title"].lower() for workout in plan["workouts"])
        self.assertFalse(any(term in titles for term in blocked_terms))
        self.assertTrue(any("lower_back" in note for note in plan["safety_notes"]))

    def test_recommend_plan_rejects_unknown_goal_and_activity(self):
        artifacts = train_artifacts(self.gym_csv, self.food_csv)

        with self.assertRaises(ValueError):
            recommend_plan(OnboardingProfile("bulk fast", ["None"], 175, 70, 25, "active"), artifacts)
        with self.assertRaises(ValueError):
            recommend_plan(OnboardingProfile("lose fat", ["None"], 175, 70, 25, "sometimes"), artifacts)

    def test_evaluate_recommender_reports_quality_thresholds(self):
        artifacts = train_artifacts(self.gym_csv, self.food_csv)

        report = evaluate_recommender(artifacts)

        self.assertGreaterEqual(report["equipment_match_rate"], 0.8)
        self.assertGreaterEqual(report["coachable_description_rate"], 0.95)
        self.assertGreaterEqual(report["beginner_safe_rate"], 0.8)
        self.assertEqual(report["scenario_count"], 4)

    def test_recommend_plan_returns_multi_item_meal_plan_with_usable_coverage(self):
        artifacts = train_artifacts(self.gym_csv, self.food_csv)
        profile = OnboardingProfile("lose fat", ["Dumbbells"], 175, 70, 25, "active")

        plan = recommend_plan(profile, artifacts)

        self.assertEqual(len(plan["meal_plan"]), 3)
        self.assertTrue(all(len(meal["items"]) >= 2 for meal in plan["meal_plan"]))
        self.assertTrue(all(meal["total_calories"] > 150 for meal in plan["meal_plan"]))
        self.assertGreaterEqual(plan["daily_macro_coverage"]["protein_ratio"], 0.5)
        self.assertGreaterEqual(plan["daily_macro_coverage"]["carb_ratio"], 0.5)
        self.assertGreaterEqual(plan["daily_macro_coverage"]["fat_ratio"], 0.5)
        self.assertLessEqual(plan["daily_macro_coverage"]["carb_ratio"], 1.3)
        self.assertLessEqual(plan["daily_macro_coverage"]["fat_ratio"], 1.3)

    def test_meal_plan_avoids_processed_food_false_keyword_matches(self):
        artifacts = train_artifacts(self.gym_csv, self.food_csv)
        profile = OnboardingProfile("lose fat", ["Dumbbells"], 175, 70, 25, "active")

        plan = recommend_plan(profile, artifacts)
        descriptions = " ".join(
            item["description"].lower()
            for meal in plan["meal_plan"]
            for item in meal["items"]
        )

        blocked_terms = ["sweet roll", "frosted", "pasta", "bacon", "cheese", "dressing"]
        self.assertFalse(any(term in descriptions for term in blocked_terms))

    def test_weekly_schedule_respects_requested_training_days_and_session_minutes(self):
        artifacts = train_artifacts(self.gym_csv, self.food_csv)
        profile = OnboardingProfile(
            "build muscle",
            ["Dumbbells", "Bench"],
            180,
            82,
            29,
            "very active",
            training_days_per_week=3,
            session_minutes=35,
        )

        plan = recommend_plan(profile, artifacts)
        training_days = [day for day in plan["weekly_schedule"] if day["type"] == "training"]

        self.assertEqual(len(training_days), 3)
        self.assertTrue(all(day["estimated_minutes"] <= 35 for day in training_days))
        self.assertTrue(all(len(day["exercises"]) >= 2 for day in training_days))

    def test_workouts_include_safe_substitutions_and_plan_summary(self):
        artifacts = train_artifacts(self.gym_csv, self.food_csv)
        profile = OnboardingProfile("lose fat", ["Dumbbells", "Bench"], 175, 70, 25, "active")

        plan = recommend_plan(profile, artifacts)

        self.assertIn("coach_summary", plan)
        self.assertIn("weekly focus", plan["coach_summary"].lower())
        self.assertTrue(all("substitutions" in workout for workout in plan["workouts"]))
        self.assertTrue(all(len(workout["substitutions"]) >= 1 for workout in plan["workouts"]))

    def test_recommend_plan_keeps_workout_body_part_diversity(self):
        artifacts = train_artifacts(self.gym_csv, self.food_csv)
        profile = OnboardingProfile("lose fat", ["Dumbbells", "Bench", "Yoga Mat"], 175, 70, 25, "active")

        plan = recommend_plan(profile, artifacts)
        unique_body_parts = {workout["body_part"] for workout in plan["workouts"]}

        self.assertGreaterEqual(len(unique_body_parts), 4)

    def test_recommend_plan_returns_four_week_progression_with_deload(self):
        artifacts = train_artifacts(self.gym_csv, self.food_csv)
        profile = OnboardingProfile("build muscle", ["Dumbbells", "Bench"], 180, 82, 29, "very active")

        plan = recommend_plan(profile, artifacts)

        self.assertEqual(len(plan["progression_plan"]), 4)
        week_loads = [week["load_multiplier"] for week in plan["progression_plan"]]
        self.assertLess(week_loads[0], week_loads[1])
        self.assertLess(week_loads[1], week_loads[2])
        self.assertLess(week_loads[3], week_loads[2])
        self.assertTrue(plan["progression_plan"][3]["is_deload"])
        self.assertTrue(all("progression_rule" in week for week in plan["progression_plan"]))

    def test_recommend_plan_adapts_when_user_misses_workouts_or_reports_fatigue(self):
        artifacts = train_artifacts(self.gym_csv, self.food_csv)
        profile = OnboardingProfile("get stronger", ["Dumbbells"], 178, 78, 31, "active")
        feedback = PlanFeedback(missed_workouts=2, fatigue_level="high", soreness_areas=["shoulder"])

        plan = recommend_plan(profile, artifacts, feedback=feedback)

        self.assertEqual(plan["readiness_adjustment"]["intensity_modifier"], "reduce")
        self.assertTrue(any(day["type"] == "recovery" for day in plan["weekly_schedule"][:3]))
        self.assertTrue(any("missed" in note.lower() for note in plan["coach_notes"]))
        self.assertTrue(any("fatigue" in note.lower() for note in plan["coach_notes"]))

    def test_recommend_plan_filters_sore_area_risky_movements_from_feedback(self):
        artifacts = train_artifacts(self.gym_csv, self.food_csv)
        profile = OnboardingProfile("build muscle", ["Dumbbells", "Bench"], 180, 82, 29, "active")
        feedback = PlanFeedback(soreness_areas=["shoulder"])

        plan = recommend_plan(profile, artifacts, feedback=feedback)
        titles = " ".join(workout["title"].lower() for workout in plan["workouts"])

        self.assertFalse(any(term in titles for term in ["shoulder press", "overhead", "upright row", "snatch"]))

    def test_evaluate_recommender_reports_ai_coach_readiness_score(self):
        artifacts = train_artifacts(self.gym_csv, self.food_csv)

        report = evaluate_recommender(artifacts)

        self.assertGreaterEqual(report["coach_contract_score"], 0.8)
        self.assertGreaterEqual(report["adaptation_score"], 0.8)
        self.assertGreaterEqual(report["overall_readiness_score"], 0.8)


if __name__ == "__main__":
    unittest.main()
