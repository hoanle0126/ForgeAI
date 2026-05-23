import base64
import json
import sys
from pathlib import Path

from recommender import (
    OnboardingProfile,
    PlanFeedback,
    RecommenderArtifacts,
    recommend_monthly_plan,
    recommend_plan,
)


def main() -> int:
    if len(sys.argv) != 2:
        print(json.dumps({"error": "Expected exactly one base64 payload argument"}))
        return 1

    try:
        payload = json.loads(base64.b64decode(sys.argv[1]).decode("utf-8"))
        profile = OnboardingProfile(
            goal=payload["goal"],
            equipment=payload["equipment"],
            height_cm=int(payload["height_cm"]),
            weight_kg=int(payload["weight_kg"]),
            age=int(payload["age"]),
            activity_level=payload["activity_level"],
            training_days_per_week=int(payload["training_days_per_week"]),
            session_minutes=int(payload["session_minutes"]),
            experience_level=payload.get("experience_level", "beginner"),
            injuries=payload.get("injuries", []),
        )
        feedback_payload = payload.get("feedback")
        feedback = (
            PlanFeedback(
                missed_workouts=int(feedback_payload.get("missed_workouts", 0)),
                fatigue_level=feedback_payload.get("fatigue_level", "normal"),
                soreness_areas=feedback_payload.get("soreness_areas", []),
                completed_workouts=int(
                    feedback_payload.get("completed_workouts", 0)
                ),
            )
            if feedback_payload
            else None
        )
        artifacts = RecommenderArtifacts.load(
            Path(__file__).with_name("recommender_artifacts.json")
        )
        plan_type = payload.get("plan_type", "preview")
        if plan_type == "monthly":
            plan = recommend_monthly_plan(profile, artifacts, feedback=feedback)
        else:
            plan = recommend_plan(profile, artifacts, feedback=feedback)
        print(json.dumps(plan))
        return 0
    except Exception as error:  # noqa: BLE001
        print(json.dumps({"error": str(error)}))
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
