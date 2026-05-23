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

INSIGHT_CHAT_MODEL_VERSION = "forgeai-insight-chat-v1"


def build_insight_chat_reply(payload: dict) -> dict:
    prompt = str(payload.get("prompt", "")).strip()
    if not prompt:
        raise ValueError("prompt is required for insight_chat")

    muscle_name = str(payload.get("selected_muscle_name", "")).strip() or "selected muscle"
    status = str(payload.get("selected_status", "neutral")).strip().lower()
    trend_percent = _safe_number(payload.get("selected_trend_percent", 0))
    fatigue_score = _safe_number(payload.get("selected_fatigue_score", 0))
    recommendation = str(payload.get("selected_recommendation", "")).strip()
    top_exercises = _as_clean_list(payload.get("selected_top_exercises"))[:3]
    high_load_muscles = _as_clean_list(payload.get("high_load_muscles"))[:3]
    recovered_muscles = _as_clean_list(payload.get("recovered_muscles"))[:3]

    if status == "overloaded":
        status_line = "high load"
        action_line = (
            "Reduce intensity for this muscle by around 20% and prioritize form quality."
        )
    elif status == "moderate":
        status_line = "a productive zone"
        action_line = "Keep volume stable and add progression only if reps stay clean."
    elif status == "recovered":
        status_line = "well recovered"
        action_line = "You can add one quality set or a small load increase this session."
    else:
        status_line = "a low-signal state"
        action_line = "Run one focused session first, then reassess trend and fatigue."

    recovery_line = ""
    if high_load_muscles:
        recovery_line = f"Limit overlap with high-load muscles: {', '.join(high_load_muscles)}."
    elif recovered_muscles:
        recovery_line = (
            f"If you want extra volume, prioritize recovered groups: {', '.join(recovered_muscles)}."
        )

    exercise_line = ""
    if top_exercises:
        exercise_line = f"Start with: {', '.join(top_exercises)}."

    recommendation_line = (
        recommendation
        if recommendation
        else "Use controlled tempo, full range of motion, and stop before technique breakdown."
    )

    content = " ".join(
        [
            f'You asked: "{prompt}".',
            f"{muscle_name} is in {status_line} (trend {trend_percent:+.0f}%, fatigue {fatigue_score:.0f}/100).",
            recommendation_line,
            action_line,
            recovery_line,
            exercise_line,
        ]
    ).strip()

    return {
        "content": content,
        "has_chart": True,
        "model_version": INSIGHT_CHAT_MODEL_VERSION,
        "suggested_exercises": top_exercises,
    }


def _as_clean_list(value: object) -> list[str]:
    if not isinstance(value, list):
        return []

    cleaned: list[str] = []
    for item in value:
        text = str(item).strip()
        if text:
            cleaned.append(text)
    return cleaned


def _safe_number(value: object) -> float:
    try:
        return float(value)
    except (TypeError, ValueError):
        return 0.0


def main() -> int:
    if len(sys.argv) != 2:
        print(json.dumps({"error": "Expected exactly one base64 payload argument"}))
        return 1

    try:
        payload = json.loads(base64.b64decode(sys.argv[1]).decode("utf-8"))
        plan_type = payload.get("plan_type", "preview")

        if plan_type == "insight_chat":
            reply = build_insight_chat_reply(payload)
            print(json.dumps(reply))
            return 0

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
