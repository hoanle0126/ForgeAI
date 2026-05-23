import csv
import json
from dataclasses import asdict, dataclass, field
from functools import lru_cache
from pathlib import Path

import numpy as np
from sklearn.ensemble import RandomForestRegressor
from sklearn.multioutput import MultiOutputRegressor


ACTIVITY_FACTORS = {
    "sedentary": 1.2,
    "light": 1.375,
    "active": 1.55,
    "very_active": 1.725,
}

GOAL_ADJUSTMENTS = {
    "lose_fat": -385,
    "build_muscle": 250,
    "get_stronger": 150,
    "stay_active": 0,
    "mobility": 0,
}

GOAL_ALIASES = {
    "lose fat": "lose_fat",
    "lose_fat": "lose_fat",
    "fat loss": "lose_fat",
    "fat_loss": "lose_fat",
    "build muscle": "build_muscle",
    "build_muscle": "build_muscle",
    "muscle gain": "build_muscle",
    "muscle_gain": "build_muscle",
    "get stronger": "get_stronger",
    "get_stronger": "get_stronger",
    "strength": "get_stronger",
    "stay active": "stay_active",
    "stay_active": "stay_active",
    "general fitness": "stay_active",
    "general_fitness": "stay_active",
    "mobility": "mobility",
}

INJURY_BLOCKLIST = {
    "lower_back": ["deadlift", "good morning", "hyperextension", "back extension", "stiff-legged"],
    "knee": ["jump", "lunge", "squat", "leg press"],
    "shoulder": ["overhead", "shoulder press", "upright row", "snatch"],
}

GOAL_FOOD_TARGETS = {
    "lose_fat": ["egg", "banana", "greek yogurt"],
    "build_muscle": ["chicken breast", "egg", "greek yogurt"],
    "get_stronger": ["salmon", "white rice", "egg"],
    "stay_active": ["oats", "banana", "milk"],
    "mobility": ["greek yogurt", "banana", "salmon"],
}

GOAL_BODY_PARTS = {
    "lose_fat": ["Quadriceps", "Abdominals", "Shoulders", "Chest", "Hamstrings"],
    "build_muscle": ["Chest", "Lats", "Quadriceps", "Shoulders", "Biceps"],
    "get_stronger": ["Quadriceps", "Lower Back", "Chest", "Hamstrings", "Shoulders"],
    "stay_active": ["Abdominals", "Quadriceps", "Shoulders", "Hamstrings", "Chest"],
    "mobility": ["Shoulders", "Hamstrings", "Quadriceps", "Lower Back", "Abdominals"],
}

GOAL_MACRO_RATIOS = {
    "lose_fat": {"protein": 0.35, "carbs": 0.35, "fat": 0.30},
    "build_muscle": {"protein": 0.30, "carbs": 0.45, "fat": 0.25},
    "get_stronger": {"protein": 0.28, "carbs": 0.47, "fat": 0.25},
    "stay_active": {"protein": 0.25, "carbs": 0.45, "fat": 0.30},
    "mobility": {"protein": 0.25, "carbs": 0.40, "fat": 0.35},
}

PORTION_GRAMS_BY_KEYWORD = {
    "egg": 100,
    "banana": 120,
    "greek yogurt": 200,
    "chicken breast": 160,
    "salmon": 150,
    "white rice": 180,
    "brown rice": 180,
    "oats": 60,
    "milk": 240,
    "almonds": 30,
    "peanut butter": 32,
    "broccoli": 120,
    "spinach": 100,
    "carrot": 100,
    "sweet potato": 180,
    "potato": 180,
    "tofu": 160,
    "beef": 150,
}

EQUIPMENT_ALIASES = {
    "bodyweight": "Body Only",
    "Bodyweight": "Body Only",
    "Bodyweight Only": "Body Only",
    "body only": "Body Only",
    "Body Only": "Body Only",
    "Dumbbells": "Dumbbell",
    "Dumbbell": "Dumbbell",
    "dumbbell": "Dumbbell",
    "Bench": "Other",
    "bench": "Other",
    "Yoga Mat": "Body Only",
    "yoga mat": "Body Only",
    "Resistance Bands": "Bands",
    "resistance bands": "Bands",
    "band": "Bands",
    "bands": "Bands",
    "Bands": "Bands",
    "Pull-up Bar": "Body Only",
    "pull-up bar": "Body Only",
    "Kettlebell": "Kettlebells",
    "kettlebell": "Kettlebells",
    "Kettlebells": "Kettlebells",
    "Jump Rope": "Body Only",
    "jump rope": "Body Only",
    "None": "Body Only",
    "none": "Body Only",
    "barbell": "Barbell",
    "Barbell": "Barbell",
    "machine": "Machine",
    "Machine": "Machine",
    "cable": "Cable",
    "Cable": "Cable",
    "other": "Other",
    "Other": "Other",
}

MOBILITY_KEYWORDS = [
    "mobility",
    "stretch",
    "flexibility",
    "range of motion",
    "warm-up",
    "warm up",
    "yoga",
    "stability",
    "activation",
]

FEATURE_NAMES = [
    "rating",
    "beginner_flag",
    "intermediate_flag",
    "expert_flag",
    "strength_flag",
    "body_only_flag",
    "dumbbell_flag",
    "goal_body_match",
    "equipment_match",
]


@dataclass
class OnboardingProfile:
    goal: str
    equipment: list[str]
    height_cm: int
    weight_kg: int
    age: int
    activity_level: str
    injuries: list[str] = field(default_factory=list)
    training_days_per_week: int = 4
    session_minutes: int = 45
    experience_level: str = "beginner"


@dataclass
class PlanFeedback:
    missed_workouts: int = 0
    fatigue_level: str = "normal"
    soreness_areas: list[str] = field(default_factory=list)
    completed_workouts: int = 0


@dataclass
class WorkoutRecord:
    title: str
    body_part: str
    equipment: str
    level: str
    type: str
    desc: str
    score: float


@dataclass
class FoodRecord:
    keyword: str
    fdc_id: str
    description: str
    food_category: str
    serving_size: float
    serving_unit: str
    calories: float
    protein_g: float
    carbs_g: float
    fat_g: float
    fiber_g: float
    sugar_g: float
    sodium_mg: float
    diet_tags: str
    meal_type: str
    allergens: str
    price_level: str
    vietnamese_name: str


@dataclass
class RecommenderArtifacts:
    workouts: list[dict]
    foods: list[dict]
    equipment_aliases: dict
    goal_food_targets: dict
    goal_body_parts: dict
    workout_model: dict
    nutrition_model: dict

    def save(self, path: Path) -> None:
        path.write_text(json.dumps(asdict(self), ensure_ascii=False, indent=2), encoding="utf-8")

    @classmethod
    def load(cls, path: Path) -> "RecommenderArtifacts":
        payload = json.loads(path.read_text(encoding="utf-8"))
        payload["equipment_aliases"] = {
            **EQUIPMENT_ALIASES,
            **payload.get("equipment_aliases", {}),
        }
        payload["goal_food_targets"] = {
            **GOAL_FOOD_TARGETS,
            **payload.get("goal_food_targets", {}),
        }
        payload["goal_body_parts"] = {
            **GOAL_BODY_PARTS,
            **payload.get("goal_body_parts", {}),
        }
        nutrition_model = payload.get("nutrition_model", {})
        macro_targets = nutrition_model.get("macro_targets", {})
        nutrition_model["macro_targets"] = {
            **{
                goal_slug: _macro_targets(goal_slug, 2400, 75)
                for goal_slug in GOAL_MACRO_RATIOS
            },
            **macro_targets,
        }
        payload["nutrition_model"] = nutrition_model
        return cls(**payload)


def normalize_goal(goal: str) -> str:
    slug = goal.strip().lower().replace("-", " ")
    return GOAL_ALIASES.get(slug.replace(" ", "_"), GOAL_ALIASES.get(slug, ""))


def normalize_activity(activity_level: str) -> str:
    return activity_level.strip().lower().replace(" ", "_")


def _to_float(value: str) -> float:
    try:
        return float(value)
    except (TypeError, ValueError):
        return 0.0


def _level_flags(level: str) -> tuple[float, float, float]:
    return (
        1.0 if level == "Beginner" else 0.0,
        1.0 if level == "Intermediate" else 0.0,
        1.0 if level == "Expert" else 0.0,
    )


def _base_workout_score(row: dict) -> float:
    rating = _to_float(row.get("Rating"))
    level = (row.get("Level") or "").strip()
    level_bonus = 1.0 if level == "Beginner" else 0.4
    return rating + level_bonus


def _workout_feature_vector(row: dict, goal_slug: str, equipment_pool: set[str]) -> list[float]:
    level = (row.get("Level") or "").strip()
    equipment = (row.get("Equipment") or "").strip()
    exercise_type = (row.get("Type") or "").strip()
    body_part = (row.get("BodyPart") or "").strip()
    beginner_flag, intermediate_flag, expert_flag = _level_flags(level)
    return [
        _to_float(row.get("Rating")),
        beginner_flag,
        intermediate_flag,
        expert_flag,
        1.0 if exercise_type == "Strength" else 0.0,
        1.0 if equipment == "Body Only" else 0.0,
        1.0 if equipment == "Dumbbell" else 0.0,
        1.0 if body_part in GOAL_BODY_PARTS[goal_slug] else 0.0,
        1.0 if equipment in equipment_pool else 0.0,
    ]


def _macro_targets(goal_slug: str, daily_calories: int, weight_kg: int) -> dict:
    ratios = GOAL_MACRO_RATIOS[goal_slug]
    protein_floor = weight_kg * (2.0 if goal_slug == "lose_fat" else 1.8)
    protein_from_ratio = (daily_calories * ratios["protein"]) / 4
    protein_target = max(round(protein_floor), round(protein_from_ratio))
    carb_target = round((daily_calories * ratios["carbs"]) / 4)
    fat_target = round((daily_calories * ratios["fat"]) / 9)
    return {
        "protein_target_g": protein_target,
        "carb_target_g": carb_target,
        "fat_target_g": fat_target,
    }


def _profile_feature_vector(goal_slug: str, height_cm: int, weight_kg: int, age: int, activity_level: str) -> list[float]:
    goal_order = ["lose_fat", "build_muscle", "get_stronger", "stay_active"]
    activity_order = ["sedentary", "light", "active", "very_active"]
    return [
        height_cm / 200,
        weight_kg / 120,
        age / 80,
        *[1.0 if goal_slug == goal else 0.0 for goal in goal_order],
        *[1.0 if normalize_activity(activity_level) == activity else 0.0 for activity in activity_order],
    ]


def _train_nutrition_model() -> MultiOutputRegressor:
    train_X = []
    train_y = []
    for goal_slug in GOAL_MACRO_RATIOS:
        for height_cm in [160, 175, 190]:
            for weight_kg in [55, 70, 85, 100]:
                for age in [20, 35, 50]:
                    for activity_level in ACTIVITY_FACTORS:
                        daily_calories = _daily_calories(
                            OnboardingProfile(goal_slug.replace("_", " "), [], height_cm, weight_kg, age, activity_level),
                            goal_slug,
                        )
                        targets = _macro_targets(goal_slug, daily_calories, weight_kg)
                        train_X.append(_profile_feature_vector(goal_slug, height_cm, weight_kg, age, activity_level))
                        train_y.append([
                            targets["protein_target_g"],
                            targets["carb_target_g"],
                            targets["fat_target_g"],
                        ])
    model = MultiOutputRegressor(
        RandomForestRegressor(n_estimators=80, random_state=7, min_samples_leaf=2)
    )
    model.fit(np.array(train_X), np.array(train_y))
    return model


def _food_macro_fit(food: dict, targets: dict) -> float:
    protein_gap = abs(food["protein_g"] - targets["protein_target_g"] / 3)
    carb_gap = abs(food["carbs_g"] - targets["carb_target_g"] / 3)
    fat_gap = abs(food["fat_g"] - targets["fat_target_g"] / 3)
    calories_gap = abs(food["calories"] - ((targets["protein_target_g"] * 4 + targets["carb_target_g"] * 4 + targets["fat_target_g"] * 9) / 3))
    return protein_gap * 1.6 + carb_gap * 0.8 + fat_gap * 1.1 + calories_gap * 0.02


@lru_cache(maxsize=4)
def _load_model(model_path: str):
    import joblib

    return joblib.load(model_path)


def train_artifacts(gym_csv: Path, food_csv: Path, model_dir: Path | None = None) -> RecommenderArtifacts:
    workouts = []
    raw_rows = []
    with gym_csv.open(encoding="utf-8-sig", newline="") as handle:
        reader = csv.DictReader(handle)
        for row in reader:
            raw_rows.append(row)
            workouts.append(
                asdict(
                    WorkoutRecord(
                        title=(row.get("Title") or "").strip(),
                        body_part=(row.get("BodyPart") or "").strip(),
                        equipment=(row.get("Equipment") or "").strip(),
                        level=(row.get("Level") or "").strip(),
                        type=(row.get("Type") or "").strip(),
                        desc=(row.get("Desc") or "").strip(),
                        score=_base_workout_score(row),
                    )
                )
            )

    train_X = []
    train_y = []
    for goal_slug, body_parts in GOAL_BODY_PARTS.items():
        goal_pool = {"Body Only", "Dumbbell", "Bands", "Other", "Kettlebells"}
        for row in raw_rows:
            features = _workout_feature_vector(row, goal_slug, goal_pool)
            target = _base_workout_score(row)
            if (row.get("BodyPart") or "").strip() in body_parts:
                target += 1.5
            if (row.get("Equipment") or "").strip() in goal_pool:
                target += 0.8
            if (row.get("Type") or "").strip() == "Strength":
                target += 0.5
            train_X.append(features)
            train_y.append(target)
    workout_regressor = RandomForestRegressor(
        n_estimators=120,
        random_state=42,
        min_samples_leaf=2,
        n_jobs=-1,
    )
    workout_regressor.fit(np.array(train_X), np.array(train_y))
    workout_model_path = None

    foods = []
    with food_csv.open(encoding="utf-8-sig", newline="") as handle:
        reader = csv.DictReader(handle)
        for row in reader:
            foods.append(
                asdict(
                    FoodRecord(
                        keyword=(row.get("keyword") or "").strip(),
                        fdc_id=(row.get("fdc_id") or "").strip(),
                        description=(row.get("description") or "").strip(),
                        food_category=(row.get("food_category") or "").strip(),
                        serving_size=_to_float(row.get("serving_size")),
                        serving_unit=(row.get("serving_unit") or "").strip(),
                        calories=_to_float(row.get("calories")),
                        protein_g=_to_float(row.get("protein_g")),
                        carbs_g=_to_float(row.get("carbs_g")),
                        fat_g=_to_float(row.get("fat_g")),
                        fiber_g=_to_float(row.get("fiber_g")),
                        sugar_g=_to_float(row.get("sugar_g")),
                        sodium_mg=_to_float(row.get("sodium_mg")),
                        diet_tags=(row.get("diet_tags") or "").strip(),
                        meal_type=(row.get("meal_type") or "").strip(),
                        allergens=(row.get("allergens") or "").strip(),
                        price_level=(row.get("price_level") or "").strip(),
                        vietnamese_name=(row.get("vietnamese_name") or "").strip(),
                    )
                )
            )

    nutrition_regressor = _train_nutrition_model()
    nutrition_model_path = None
    if model_dir is not None:
        import joblib

        model_dir.mkdir(parents=True, exist_ok=True)
        workout_model_path = model_dir / "workout_regressor.joblib"
        nutrition_model_path = model_dir / "nutrition_regressor.joblib"
        joblib.dump(workout_regressor, workout_model_path)
        joblib.dump(nutrition_regressor, nutrition_model_path)
    macro_targets = {}
    for goal_slug in GOAL_BODY_PARTS:
        sample_targets = _macro_targets(goal_slug, 2400, 75)
        macro_targets[goal_slug] = sample_targets

    return RecommenderArtifacts(
        workouts=workouts,
        foods=foods,
        equipment_aliases=EQUIPMENT_ALIASES,
        goal_food_targets=GOAL_FOOD_TARGETS,
        goal_body_parts=GOAL_BODY_PARTS,
        workout_model={
            "model_type": "sklearn-random-forest-regressor",
            "feature_names": FEATURE_NAMES,
            "n_estimators": 120,
            "model_path": str(workout_model_path) if workout_model_path else None,
            "feature_importances": [float(x) for x in workout_regressor.feature_importances_.tolist()],
            "train_feature_matrix_shape": [len(train_X), len(FEATURE_NAMES)],
        },
        nutrition_model={
            "model_type": "sklearn-random-forest-multioutput-regressor",
            "target_names": ["protein_target_g", "carb_target_g", "fat_target_g"],
            "macro_targets": macro_targets,
            "n_estimators": 80,
            "model_path": str(nutrition_model_path) if nutrition_model_path else None,
            "train_feature_matrix_shape": [576, 11],
            "feature_importances": [
                [float(x) for x in estimator.feature_importances_.tolist()]
                for estimator in nutrition_regressor.estimators_
            ],
        },
    )


def _daily_calories(profile: OnboardingProfile, goal_slug: str) -> int:
    height = profile.height_cm
    weight = profile.weight_kg
    age = profile.age
    bmr = 10 * weight + 6.25 * height - 5 * age + 5
    activity_factor = ACTIVITY_FACTORS.get(normalize_activity(profile.activity_level), 1.2)
    return round(bmr * activity_factor + GOAL_ADJUSTMENTS[goal_slug])


def _equipment_pool(profile: OnboardingProfile, artifacts: RecommenderArtifacts) -> set[str]:
    aliases = artifacts.equipment_aliases
    pool = {aliases.get(item, item) for item in profile.equipment}
    pool.add("Body Only")
    return pool


def _predict_workout_score(feature_vector: list[float], workout_model: dict) -> float:
    model_path = workout_model.get("model_path")
    if model_path and Path(model_path).exists():
        model = _load_model(model_path)
        return float(model.predict(np.array([feature_vector]))[0])
    importances = workout_model["feature_importances"]
    weighted_signal = sum(value * importance for value, importance in zip(feature_vector, importances))
    return float(10 + weighted_signal * 10)


def _predict_workout_scores(feature_rows: list[list[float]], workout_model: dict) -> list[float]:
    model_path = workout_model.get("model_path")
    if model_path and Path(model_path).exists():
        model = _load_model(model_path)
        return [float(value) for value in model.predict(np.array(feature_rows)).tolist()]
    return [_predict_workout_score(feature_vector, workout_model) for feature_vector in feature_rows]


def _predict_macro_targets(profile: OnboardingProfile, artifacts: RecommenderArtifacts, goal_slug: str, daily_calories: int) -> dict:
    if goal_slug == "mobility":
        return _macro_targets(goal_slug, daily_calories, profile.weight_kg)
    model_path = artifacts.nutrition_model.get("model_path")
    if model_path and Path(model_path).exists():
        model = _load_model(model_path)
        prediction = model.predict(np.array([_profile_feature_vector(goal_slug, profile.height_cm, profile.weight_kg, profile.age, profile.activity_level)]))[0]
        return {
            "protein_target_g": max(0, round(float(prediction[0]))),
            "carb_target_g": max(0, round(float(prediction[1]))),
            "fat_target_g": max(0, round(float(prediction[2]))),
        }
    return _macro_targets(goal_slug, daily_calories, profile.weight_kg)


def _mobility_signal(item: dict) -> int:
    text = f"{item.get('title') or ''} {item.get('desc') or ''}".lower()
    signal = sum(term in text for term in MOBILITY_KEYWORDS)
    if item.get("type") in {"Stretching", "Plyometrics"}:
        signal += 2
    if item.get("equipment") == "Body Only":
        signal += 1
    return signal


def _workout_prescription(item: dict, goal_slug: str) -> dict:
    beginner = item["level"] == "Beginner"
    if goal_slug == "mobility" or _mobility_signal(item) >= 2:
        reps = "30-45 seconds per side"
    elif item["type"] == "Cardio":
        reps = "8-12 minutes"
    elif item["body_part"] == "Abdominals":
        reps = "10-15 controlled reps"
    else:
        reps = "8-12 reps"
    return {
        "sets": 2 if beginner else 3,
        "reps": reps,
        "rest_seconds": 45 if goal_slug == "mobility" else (75 if beginner else 60),
        "confidence": round(min(1.0, max(0.0, item["model_score"] / 12)), 4),
        "rationale": f"Matches your {item['body_part'].lower()} focus with {item['equipment'].lower()} availability.",
    }


def _session_exercise_count(session_minutes: int) -> int:
    if session_minutes <= 30:
        return 3
    if session_minutes <= 45:
        return 4
    return 5


def _blocked_injury_terms(injuries: list[str]) -> list[str]:
    terms = []
    for injury in injuries:
        terms.extend(INJURY_BLOCKLIST.get(injury.strip().lower(), []))
    return terms


def _is_workout_allowed_for_profile(item: dict, profile: OnboardingProfile, feedback: PlanFeedback | None = None) -> bool:
    text = f"{item.get('title') or ''} {item.get('desc') or ''}".lower()
    blocked_terms = _blocked_injury_terms(profile.injuries)
    if feedback is not None:
        blocked_terms.extend(_blocked_injury_terms(feedback.soreness_areas))
    if any(term in text for term in blocked_terms):
        return False
    return True


def _rank_workouts(profile: OnboardingProfile, artifacts: RecommenderArtifacts, goal_slug: str, feedback: PlanFeedback | None = None) -> list[dict]:
    pool = _equipment_pool(profile, artifacts)
    scored = []
    feature_rows = []
    prepared_rows = []
    for row in artifacts.workouts:
        raw_row = {
            "Rating": row["score"],
            "Level": row["level"],
            "Type": row["type"],
            "Equipment": row["equipment"],
            "BodyPart": row["body_part"],
        }
        feature_rows.append(_workout_feature_vector(raw_row, goal_slug, pool))
        prepared_rows.append(row)
    model_scores = _predict_workout_scores(feature_rows, artifacts.workout_model)
    for row, model_score in zip(prepared_rows, model_scores):
        item = dict(row)
        if not _is_workout_allowed_for_profile(item, profile, feedback):
            continue
        item["model_score"] = round(model_score, 4)
        item.update(_workout_prescription(item, goal_slug))
        scored.append(item)
    ranked = sorted(
        scored,
        key=lambda item: (
            _mobility_signal(item) if goal_slug == "mobility" else 0,
            item["equipment"] in pool,
            item["body_part"] in artifacts.goal_body_parts[goal_slug],
            bool(item["desc"].strip()),
            item["model_score"],
        ),
        reverse=True,
    )
    return ranked


def _pick_workouts(profile: OnboardingProfile, artifacts: RecommenderArtifacts, goal_slug: str, feedback: PlanFeedback | None = None) -> list[dict]:
    ranked = _rank_workouts(profile, artifacts, goal_slug, feedback)
    used_titles = set()
    selected = []
    for item in ranked:
        if item["title"] in used_titles:
            continue
        if len(selected) < 5:
            selected.append(item)
            used_titles.add(item["title"])
    _attach_substitutions(selected, ranked)
    return selected


def _attach_substitutions(selected: list[dict], ranked: list[dict]) -> None:
    for workout in selected:
        substitutions = []
        for candidate in ranked:
            if candidate["title"] == workout["title"]:
                continue
            if candidate["body_part"] != workout["body_part"] and candidate["equipment"] != "Body Only":
                continue
            substitutions.append({
                "title": candidate["title"],
                "equipment": candidate["equipment"],
                "level": candidate["level"],
                "reason": "Keeps the same focus or uses a bodyweight fallback.",
            })
            if len(substitutions) == 2:
                break
        workout["substitutions"] = substitutions


def _template_label(index: int) -> str:
    return chr(ord("A") + index)


def _template_title(goal_slug: str, focus: str, index: int) -> str:
    label = _template_label(index)
    if goal_slug == "mobility":
        return f"Session {label}: {focus} Mobility"
    return f"Session {label}: {focus} Focus"


def _template_exercises(
    ranked: list[dict],
    goal_slug: str,
    target_focus: str,
    count: int,
    used_titles: set[str],
) -> list[dict]:
    selected = []
    focus_pool = artifacts_focus_pool = GOAL_BODY_PARTS[goal_slug]
    sources = [
        [
            item
            for item in ranked
            if item["title"] not in used_titles and item["body_part"] == target_focus
        ],
        [
            item
            for item in ranked
            if item["title"] not in used_titles
            and item["body_part"] in focus_pool
            and item["body_part"] != target_focus
        ],
        [item for item in ranked if item["title"] not in used_titles],
    ]

    for source in sources:
        for item in source:
            if item["title"] in {exercise["title"] for exercise in selected}:
                continue
            selected.append(dict(item))
            used_titles.add(item["title"])
            if len(selected) == count:
                _attach_substitutions(selected, ranked)
                return selected

    if len(selected) < count:
        for item in ranked:
            if item["title"] in used_titles:
                continue
            if item["title"] in {exercise["title"] for exercise in selected}:
                continue
            selected.append(dict(item))
            used_titles.add(item["title"])
            if len(selected) == count:
                break

    _attach_substitutions(selected, ranked)
    return selected


def _build_monthly_templates(
    profile: OnboardingProfile,
    artifacts: RecommenderArtifacts,
    goal_slug: str,
    feedback: PlanFeedback | None = None,
) -> list[dict]:
    ranked = _rank_workouts(profile, artifacts, goal_slug, feedback)
    template_count = min(max(profile.training_days_per_week, 1), 4)
    exercise_count = _session_exercise_count(profile.session_minutes)
    focus_sequence = GOAL_BODY_PARTS[goal_slug][:template_count]
    if len(focus_sequence) < template_count:
        focus_sequence.extend(
            GOAL_BODY_PARTS[goal_slug][
                : template_count - len(focus_sequence)
            ]
        )
    used_titles: set[str] = set()
    templates = []
    for index, focus in enumerate(focus_sequence):
        exercises = _template_exercises(
            ranked,
            goal_slug,
            focus,
            exercise_count,
            used_titles,
        )
        templates.append(
            {
                "template_id": f"session_{index + 1}",
                "title": _template_title(goal_slug, focus, index),
                "focus": focus,
                "estimated_minutes": min(
                    profile.session_minutes,
                    8 + len(exercises) * 9,
                ),
                "warm_up": "5 minutes easy cardio plus dynamic mobility",
                "cooldown": "3-5 minutes light stretching and breathing",
                "exercises": exercises,
            }
        )
    return templates


def _training_day_indexes(training_days_per_week: int) -> set[int]:
    options = {
        1: {0},
        2: {0, 3},
        3: {0, 2, 4},
        4: {0, 1, 3, 5},
        5: {0, 1, 2, 4, 5},
        6: {0, 1, 2, 3, 4, 5},
    }
    return options[training_days_per_week]


def _weekly_schedule(profile: OnboardingProfile, workouts: list[dict], feedback: PlanFeedback | None = None) -> list[dict]:
    training_indexes = _training_day_indexes(profile.training_days_per_week)
    if feedback and (feedback.missed_workouts >= 2 or feedback.fatigue_level == "high"):
        training_indexes = set(sorted(training_indexes)[1:])
    day_names = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    schedule = []
    workout_cursor = 0
    for index, day_name in enumerate(day_names):
        if index in training_indexes:
            day_exercises = [workouts[(workout_cursor + offset) % len(workouts)] for offset in range(min(3, len(workouts)))] if workouts else []
            exercise = day_exercises[0] if day_exercises else None
            focus = exercise["body_part"] if exercise else "Full body"
            estimated_minutes = min(profile.session_minutes, 8 + len(day_exercises) * 8)
            schedule.append({
                "day": day_name,
                "type": "training",
                "focus": focus,
                "warm_up": "5 minutes easy cardio plus dynamic mobility",
                "main_exercise": exercise["title"] if exercise else "Bodyweight circuit",
                "exercises": [item["title"] for item in day_exercises],
                "estimated_minutes": estimated_minutes,
                "cooldown": "3-5 minutes light stretching and breathing",
            })
            workout_cursor += max(1, len(day_exercises) - 1)
        else:
            schedule.append({
                "day": day_name,
                "type": "recovery",
                "focus": "Recovery and walking",
                "mobility": "10 minutes easy mobility if you feel stiff",
            })
    return schedule


def _progression_plan(goal_slug: str, profile: OnboardingProfile, feedback: PlanFeedback | None = None) -> list[dict]:
    base_sets = 2 if profile.experience_level == "beginner" else 3
    fatigue_modifier = 0.9 if feedback and feedback.fatigue_level == "high" else 1.0
    multipliers = [1.0, 1.08, 1.15, 0.85]
    return [
        {
            "week": index + 1,
            "load_multiplier": round(multiplier * fatigue_modifier, 2),
            "target_sets": max(1, round(base_sets * multiplier)),
            "is_deload": index == 3,
            "progression_rule": "Add 1-2 reps before increasing load; deload in week 4 to consolidate recovery.",
            "focus": goal_slug.replace("_", " "),
        }
        for index, multiplier in enumerate(multipliers)
    ]


def _readiness_adjustment(feedback: PlanFeedback | None) -> dict:
    if feedback is None:
        return {"intensity_modifier": "maintain", "reason": "No recovery issues reported."}
    if feedback.fatigue_level == "high" or feedback.missed_workouts >= 2:
        return {"intensity_modifier": "reduce", "reason": "Recent fatigue or missed workouts indicate recovery should lead."}
    if feedback.completed_workouts >= 3 and feedback.fatigue_level == "low":
        return {"intensity_modifier": "increase", "reason": "Consistency and low fatigue support a small progression."}
    return {"intensity_modifier": "maintain", "reason": "Keep progression steady."}


def _coach_notes(feedback: PlanFeedback | None) -> list[str]:
    notes = []
    if feedback is None:
        return notes
    if feedback.missed_workouts:
        notes.append(f"You missed {feedback.missed_workouts} workout(s); this plan protects consistency by reducing near-term pressure.")
    if feedback.fatigue_level == "high":
        notes.append("High fatigue reported; intensity is reduced and recovery is prioritized.")
    if feedback.soreness_areas:
        notes.append(f"Soreness areas considered: {', '.join(feedback.soreness_areas)}.")
    return notes


def _food_clean_bonus(food: dict) -> float:
    keyword = str(food.get("keyword") or "").lower()
    description = str(food.get("description") or "").lower()
    category = str(food.get("food_category") or "").lower()
    bonus = 0.0
    clean_terms = ["raw", "cooked", "baked", "broiled", "grilled", "plain", "nonfat", "low fat", "skin not eaten"]
    best_terms = ["banana, raw", "bananas, raw", "yogurt, greek, plain", "rice, white, cooked", "chicken breast, baked"]
    blocked_terms = [
        "chips", "taquito", "burrito", "sandwich", "chocolate", "sweetened", "breaded", "coated",
        "stuffed", "babyfood", "snack", "dehydrated", "powder", "strawberry", "blueberry",
        "raspberry", "peach", "apricot", "lemon", "coconut", "vanilla", "goose", "duck", "quail",
        "dry", "dried", "uncooked", "raw rice", "with fat", "made with oil", "made with butter",
        "made with margarine", "evaporated", "sweet roll", "roll, sweet", "frosted", "pasta",
        "noodles", "bacon", "cheese", "dressing", "casserole", "quiche", "dip", "soup",
    ]
    keyword_best_terms = {
        "egg": ["egg, whole", "eggs, whole", "egg white", "egg, raw", "egg, cooked"],
        "milk": ["milk, fluid", "milk, whole", "milk, lowfat", "milk, reduced fat", "milk, nonfat", "milk, skim"],
        "white rice": ["rice, white, cooked"],
        "brown rice": ["rice, brown, cooked"],
        "broccoli": ["broccoli, frozen, cooked, no added fat", "broccoli, frozen, chopped, cooked", "broccoli raab, cooked", "broccoli raab, raw"],
        "spinach": ["spinach, frozen, cooked, no added fat", "spinach, raw", "spinach, cooked"],
        "sweet potato": ["sweet potato, cooked, baked in skin", "sweet potato, raw", "sweet potatoes, orange flesh"],
        "potato": ["potato, baked", "potato, boiled", "potato, raw"],
    }
    keyword_blocked_terms = {
        "egg": ["yolk", "goose", "duck", "quail"],
        "milk": ["evaporated", "dry", "dried", "powder", "cheese"],
        "white rice": ["with fat", "made with oil", "made with butter", "made with margarine", "uncooked", "raw"],
        "broccoli": ["cheese", "bacon", "dressing", "casserole", "soup", "excluding", "with oil", "fat added"],
        "spinach": ["pasta", "noodle", "spaghetti", "quiche", "tortellini", "ravioli", "cheese", "dip", "with oil", "with butter"],
        "sweet potato": ["roll", "frosted", "shrimp", "leaves", "candied", "sweetened"],
    }
    if any(term in description for term in clean_terms):
        bonus += 25
    if any(term in description for term in best_terms):
        bonus += 45
    if any(term in description for term in keyword_best_terms.get(keyword, [])):
        bonus += 80
    if any(term in description for term in blocked_terms):
        bonus -= 100
    if any(term in description for term in keyword_blocked_terms.get(keyword, [])):
        bonus -= 180
    if any(term in category for term in ["fast foods", "sweets", "snacks", "baby foods", "restaurant"]):
        bonus -= 80
    return bonus


def _score_food_candidate(food: dict, targets: dict) -> float:
    return 100 - _food_macro_fit(food, targets) + _food_clean_bonus(food)


def _best_food_for_keyword(keyword: str, foods: list[dict], targets: dict) -> dict | None:
    candidates = [food for food in foods if food["keyword"] == keyword]
    if not candidates:
        return None
    ranked = sorted(candidates, key=lambda food: _score_food_candidate(food, targets), reverse=True)
    return ranked[0]


def _is_food_allowed_for_profile(food: dict, profile: OnboardingProfile) -> bool:
    allergens = str(food.get("allergens") or "").lower().split("|")
    allergy_set = {item.strip().lower() for item in profile.allergies}
    if allergy_set and allergy_set.intersection(allergens):
        return False
    diet_tags = str(food.get("diet_tags") or "").lower().split("|")
    preference_set = {item.strip().lower() for item in profile.dietary_preferences}
    if "plant_forward" in preference_set and "plant_forward" not in diet_tags:
        return False
    return True


def _with_portion(food: dict, targets: dict) -> dict:
    target_meal_calories = (targets["protein_target_g"] * 4 + targets["carb_target_g"] * 4 + targets["fat_target_g"] * 9) / 3
    calories_per_100g = max(float(food.get("calories") or 0), 1)
    keyword = str(food.get("keyword") or "").lower()
    portion_grams = PORTION_GRAMS_BY_KEYWORD.get(
        keyword,
        round(max(50, min(250, (target_meal_calories / calories_per_100g) * 100))),
    )
    item = dict(food)
    item["portion_grams"] = portion_grams
    item["portion_calories"] = round(item["calories"] * portion_grams / 100)
    item["portion_protein_g"] = round(item["protein_g"] * portion_grams / 100, 1)
    item["portion_carbs_g"] = round(item["carbs_g"] * portion_grams / 100, 1)
    item["portion_fat_g"] = round(item["fat_g"] * portion_grams / 100, 1)
    return item


def _pick_foods(profile: OnboardingProfile, artifacts: RecommenderArtifacts, goal_slug: str, daily_calories: int) -> tuple[list[dict], dict]:
    targets = _predict_macro_targets(profile, artifacts, goal_slug, daily_calories)
    keyword_priority = artifacts.goal_food_targets[goal_slug]
    picks = []
    seen_keywords = set()
    allowed_foods = [food for food in artifacts.foods if _is_food_allowed_for_profile(food, profile)]
    for keyword in keyword_priority:
        food = _best_food_for_keyword(keyword, allowed_foods, targets)
        if food is None:
            continue
        item = _with_portion(food, targets)
        item["macro_model_score"] = round(_score_food_candidate(food, targets), 4)
        item["rationale"] = f"Supports {goal_slug.replace('_', ' ')} with a simple {item.get('meal_type') or 'meal'} option."
        picks.append(item)
        seen_keywords.add(keyword)
    if len(picks) < 3:
        fallback = []
        for food in allowed_foods:
            if food["keyword"] in seen_keywords:
                continue
            item = _with_portion(food, targets)
            item["macro_model_score"] = round(_score_food_candidate(food, targets), 4)
            item["rationale"] = f"Adds macro coverage with {item.get('price_level') or 'unknown'} price level food."
            fallback.append(item)
        fallback.sort(key=lambda item: item["macro_model_score"], reverse=True)
        used_keywords = {item["keyword"] for item in picks}
        for item in fallback:
            if item["keyword"] in used_keywords:
                continue
            picks.append(item)
            used_keywords.add(item["keyword"])
            if len(picks) == 3:
                break
    return picks[:3], targets


def _daily_macro_coverage(meals: list[dict], targets: dict) -> dict:
    if meals and "items" in meals[0]:
        items = [item for meal in meals for item in meal["items"]]
    else:
        items = meals
    protein = sum(float(meal.get("portion_protein_g") or 0) for meal in items)
    carbs = sum(float(meal.get("portion_carbs_g") or 0) for meal in items)
    fat = sum(float(meal.get("portion_fat_g") or 0) for meal in items)
    return {
        "protein_ratio": round(protein / max(targets["protein_target_g"], 1), 3),
        "carb_ratio": round(carbs / max(targets["carb_target_g"], 1), 3),
        "fat_ratio": round(fat / max(targets["fat_target_g"], 1), 3),
    }


def _meal_totals(items: list[dict]) -> dict:
    return {
        "total_calories": round(sum(float(item.get("portion_calories") or 0) for item in items)),
        "total_protein_g": round(sum(float(item.get("portion_protein_g") or 0) for item in items), 1),
        "total_carbs_g": round(sum(float(item.get("portion_carbs_g") or 0) for item in items), 1),
        "total_fat_g": round(sum(float(item.get("portion_fat_g") or 0) for item in items), 1),
    }


def _build_meal_plan(profile: OnboardingProfile, artifacts: RecommenderArtifacts, goal_slug: str, targets: dict) -> list[dict]:
    allowed_foods = [food for food in artifacts.foods if _is_food_allowed_for_profile(food, profile)]
    templates = {
        "lose_fat": [
            ("Breakfast", ["oats", "egg", "banana"]),
            ("Lunch", ["chicken breast", "white rice", "broccoli"]),
            ("Dinner", ["salmon", "sweet potato", "spinach"]),
        ],
        "build_muscle": [
            ("Breakfast", ["oats", "greek yogurt", "banana"]),
            ("Lunch", ["chicken breast", "white rice", "broccoli"]),
            ("Dinner", ["beef", "brown rice", "spinach"]),
        ],
        "get_stronger": [
            ("Breakfast", ["egg", "oats", "milk"]),
            ("Lunch", ["chicken breast", "white rice", "carrot"]),
            ("Dinner", ["salmon", "potato", "spinach"]),
        ],
        "stay_active": [
            ("Breakfast", ["oats", "milk", "banana"]),
            ("Lunch", ["tofu", "brown rice", "broccoli"]),
            ("Dinner", ["chicken breast", "sweet potato", "spinach"]),
        ],
        "mobility": [
            ("Breakfast", ["greek yogurt", "banana", "oats"]),
            ("Lunch", ["salmon", "brown rice", "spinach"]),
            ("Dinner", ["tofu", "sweet potato", "broccoli"]),
        ],
    }
    plan = []
    for meal_name, keywords in templates[goal_slug]:
        items = []
        for keyword in keywords:
            food = _best_food_for_keyword(keyword, allowed_foods, targets)
            if food is not None:
                items.append(_with_portion(food, targets))
        if len(items) < 2:
            fallback = sorted(
                allowed_foods,
                key=lambda food: _score_food_candidate(food, targets),
                reverse=True,
            )
            used_keywords = {item["keyword"] for item in items}
            for food in fallback:
                if food["keyword"] in used_keywords:
                    continue
                items.append(_with_portion(food, targets))
                used_keywords.add(food["keyword"])
                if len(items) >= 2:
                    break
        totals = _meal_totals(items)
        plan.append({
            "name": meal_name,
            "items": items,
            "rationale": f"Balanced {meal_name.lower()} for {goal_slug.replace('_', ' ')} using available diet constraints.",
            **totals,
        })
    return plan


def _validate_profile(profile: OnboardingProfile) -> None:
    if not normalize_goal(profile.goal):
        raise ValueError("goal must be one of lose fat, build muscle, get stronger, or stay active")
    if normalize_activity(profile.activity_level) not in ACTIVITY_FACTORS:
        raise ValueError("activity_level must be one of sedentary, light, active, or very active")
    if not 1 <= profile.training_days_per_week <= 6:
        raise ValueError("training_days_per_week must be between 1 and 6")
    if not 15 <= profile.session_minutes <= 120:
        raise ValueError("session_minutes must be between 15 and 120")
    if profile.experience_level not in {"beginner", "intermediate", "advanced"}:
        raise ValueError("experience_level must be beginner, intermediate, or advanced")
    if not 16 <= profile.age <= 80:
        raise ValueError("age must be between 16 and 80 for safe coach recommendations")
    if not 120 <= profile.height_cm <= 230:
        raise ValueError("height_cm must be between 120 and 230")
    if not 35 <= profile.weight_kg <= 250:
        raise ValueError("weight_kg must be between 35 and 250")


def _safety_notes(profile: OnboardingProfile) -> list[str]:
    notes = [
        "Start conservatively and stop if you feel sharp pain, dizziness, or unusual shortness of breath.",
        "Use this as general fitness guidance, not medical advice.",
    ]
    if not profile.equipment or "None" in profile.equipment:
        notes.append("Plan uses bodyweight-friendly movements because no equipment was selected.")
    for injury in profile.injuries:
        injury_slug = injury.strip().lower()
        if injury_slug in INJURY_BLOCKLIST:
            notes.append(f"Filtered exercises that can aggravate {injury_slug}; stay pain-free and use professional guidance if symptoms persist.")
    return notes


def evaluate_recommender(artifacts: RecommenderArtifacts) -> dict:
    scenarios = [
        OnboardingProfile("lose fat", ["None"], 175, 70, 25, "active"),
        OnboardingProfile("build muscle", ["Dumbbells", "Bench"], 180, 82, 29, "very active"),
        OnboardingProfile("get stronger", ["Resistance Bands"], 178, 78, 31, "active"),
        OnboardingProfile("stay active", ["Yoga Mat"], 165, 58, 34, "light"),
    ]
    workout_count = 0
    equipment_matches = 0
    coachable_descriptions = 0
    beginner_safe = 0
    for profile in scenarios:
        plan = recommend_plan(profile, artifacts)
        pool = _equipment_pool(profile, artifacts)
        for workout in plan["workouts"]:
            workout_count += 1
            if workout["equipment"] in pool:
                equipment_matches += 1
            if workout["desc"].strip():
                coachable_descriptions += 1
            if workout["level"] in {"Beginner", "Intermediate"}:
                beginner_safe += 1
    adaptation_plan = recommend_plan(
        OnboardingProfile("get stronger", ["Dumbbells"], 178, 78, 31, "active"),
        artifacts,
        feedback=PlanFeedback(missed_workouts=2, fatigue_level="high", soreness_areas=["shoulder"]),
    )
    contract_checks = [
        "weekly_schedule" in adaptation_plan,
        "progression_plan" in adaptation_plan,
        "coach_summary" in adaptation_plan,
        all("substitutions" in workout for workout in adaptation_plan["workouts"]),
    ]
    adaptation_checks = [
        adaptation_plan["readiness_adjustment"]["intensity_modifier"] == "reduce",
        bool(adaptation_plan["coach_notes"]),
        len(adaptation_plan["progression_plan"]) == 4,
        adaptation_plan["progression_plan"][3]["is_deload"],
        any(day["type"] == "recovery" for day in adaptation_plan["weekly_schedule"][:3]),
    ]
    coach_contract_score = sum(contract_checks) / len(contract_checks)
    adaptation_score = sum(adaptation_checks) / len(adaptation_checks)
    equipment_match_rate = equipment_matches / max(workout_count, 1)
    coachable_description_rate = coachable_descriptions / max(workout_count, 1)
    beginner_safe_rate = beginner_safe / max(workout_count, 1)
    overall = (equipment_match_rate + coachable_description_rate + beginner_safe_rate + coach_contract_score + adaptation_score) / 5
    return {
        "scenario_count": len(scenarios),
        "workout_count": workout_count,
        "equipment_match_rate": round(equipment_match_rate, 3),
        "coachable_description_rate": round(coachable_description_rate, 3),
        "beginner_safe_rate": round(beginner_safe_rate, 3),
        "coach_contract_score": round(coach_contract_score, 3),
        "adaptation_score": round(adaptation_score, 3),
        "overall_readiness_score": round(overall, 3),
    }


def _coach_summary(goal_slug: str, profile: OnboardingProfile, workouts: list[dict]) -> str:
    body_parts = ", ".join(dict.fromkeys(workout["body_part"] for workout in workouts))
    return (
        f"Weekly focus: {goal_slug.replace('_', ' ')} with {profile.training_days_per_week} training days, "
        f"about {profile.session_minutes} minutes per session, covering {body_parts}."
    )


def _coach_monthly_summary(goal_slug: str, profile: OnboardingProfile, templates: list[dict]) -> str:
    focuses = ", ".join(dict.fromkeys(template["focus"] for template in templates))
    return (
        f"4-week block for {goal_slug.replace('_', ' ')} with {profile.training_days_per_week} training days per week, "
        f"about {profile.session_minutes} minutes per session, rotating through {focuses}."
    )


def _reassessment_questions(goal_slug: str) -> list[str]:
    base_questions = [
        "Which sessions felt most manageable and which felt too demanding?",
        "Did you complete most of the planned four training days each week?",
        "Did any exercise cause pain, excessive soreness, or awkward setup issues?",
        "Has your available equipment or schedule changed since this plan started?",
    ]
    goal_specific = {
        "lose_fat": "Do you want the next block to push harder on conditioning or keep recovery easier?",
        "build_muscle": "Which body areas do you want more volume or emphasis on next month?",
        "get_stronger": "Which lifts felt ready for progression and which need steadier loading?",
        "stay_active": "Do you want more variety next month or a steadier repeatable rhythm?",
        "mobility": "Did range of motion improve enough to move toward more loaded work next month?",
    }
    return [*base_questions, goal_specific[goal_slug]]


def _month_end_reassessment(goal_slug: str) -> dict:
    return {
        "due_after_days": 28,
        "prompt_title": "Month-end training check-in",
        "summary": "Before month 2, ForgeAI should re-check adherence, recovery, and equipment reality.",
        "questions": _reassessment_questions(goal_slug),
    }


def recommend_plan(profile: OnboardingProfile, artifacts: RecommenderArtifacts, feedback: PlanFeedback | None = None) -> dict:
    _validate_profile(profile)
    goal_slug = normalize_goal(profile.goal)
    workouts = _pick_workouts(profile, artifacts, goal_slug, feedback)
    return {
        "schema_version": "coach-plan-v1",
        "model_version": artifacts.workout_model.get("model_type", "unknown"),
        "goal_slug": goal_slug,
        "safety_notes": _safety_notes(profile),
        "coach_summary": _coach_summary(goal_slug, profile, workouts),
        "coach_notes": _coach_notes(feedback),
        "readiness_adjustment": _readiness_adjustment(feedback),
        "progression_plan": _progression_plan(goal_slug, profile, feedback),
        "weekly_schedule": _weekly_schedule(profile, workouts, feedback),
        "workouts": workouts,
    }


def recommend_monthly_plan(profile: OnboardingProfile, artifacts: RecommenderArtifacts, feedback: PlanFeedback | None = None) -> dict:
    _validate_profile(profile)
    goal_slug = normalize_goal(profile.goal)
    templates = _build_monthly_templates(profile, artifacts, goal_slug, feedback)
    return {
        "schema_version": "coach-month-plan-v1",
        "model_version": artifacts.workout_model.get("model_type", "unknown"),
        "goal_slug": goal_slug,
        "block_length_weeks": 4,
        "training_days_per_week": profile.training_days_per_week,
        "safety_notes": _safety_notes(profile),
        "coach_summary": _coach_monthly_summary(goal_slug, profile, templates),
        "coach_notes": _coach_notes(feedback),
        "readiness_adjustment": _readiness_adjustment(feedback),
        "progression_plan": _progression_plan(goal_slug, profile, feedback),
        "workout_templates": templates,
        "reassessment": _month_end_reassessment(goal_slug),
    }
