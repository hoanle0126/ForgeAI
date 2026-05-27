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
        status_line = "high load / fatigued"
        action_line = (
            "Reduce intensity for this muscle by around 20% and prioritize form quality."
        )
    elif status == "moderate":
        status_line = "a productive, balanced zone"
        action_line = "Keep volume stable and add progression only if reps stay clean."
    elif status == "recovered":
        status_line = "well recovered and responsive"
        action_line = "You can add one quality set or a small load increase this session."
    else:
        status_line = "a low-signal / neutral state"
        action_line = "Run one focused session first, then reassess trend and fatigue."

    recovery_line = ""
    if high_load_muscles:
        recovery_line = f"Limit overlap with high-load groups like: {', '.join(high_load_muscles)}."
    elif recovered_muscles:
        recovery_line = (
            f"If you want to add extra training volume, prioritize highly recovered groups: {', '.join(recovered_muscles)}."
        )

    exercise_line = ""
    if top_exercises:
        exercise_line = f"Key exercises to focus on: {', '.join(top_exercises)}."

    recommendation_line = (
        recommendation
        if recommendation
        else "Use controlled tempo, full range of motion, and stop before technique breakdown."
    )

    # Intent detection and natural language generation
    prompt_lower = prompt.lower()
    
    is_greeting = any(k in prompt_lower for k in ["hello", "hi", "hey", "who are you", "what is your name", "how are you", "coach", "help"])
    is_progression = any(k in prompt_lower for k in ["progress", "trend", "streak", "gain", "improve", "how is my", "result", "volume", "muscle"])
    is_exercise = any(k in prompt_lower for k in ["exercise", "train", "workout", "do", "routine", "movement", "lift", "what should i", "suggest"])
    is_adjust = any(k in prompt_lower for k in ["adjust", "change", "modify", "pain", "sore", "hurt", "substitute", "alternative", "discomfort", "tweak", "replace"])
    is_recovery = any(k in prompt_lower for k in ["recover", "fatigue", "rest", "tired", "sleep", "stiff", "soreness"])

    if is_greeting:
        content = (
            f"Hello! I am your ForgeAI Coach. I analyze your training volume, fatigue, and recovery patterns to help you "
            f"optimize your workouts, program progressive overload, and prevent injuries. "
            f"Currently, looking at your **{muscle_name}**, it is in {status_line} (fatigue {fatigue_score:.0f}/100, trend {trend_percent:+.0f}%). "
            f"How can I help you adjust or advance your training plan today?"
        )
    elif is_progression:
        trend_verb = "increased" if trend_percent >= 0 else "decreased"
        if status == "overloaded":
            prog_advice = (
                f"Since your {muscle_name} is carrying high mechanical load, your progress is currently capped by fatigue. "
                f"Adding more volume right now will likely lead to overtraining or joint strain. Focus on active recovery."
            )
        elif status == "recovered":
            prog_advice = (
                f"Your {muscle_name} is in an optimal supercompensation phase. This is the perfect window to apply progressive "
                f"overload: consider adding a small weight increment (+1-2kg) or aiming for 1-2 extra reps on your final work set."
            )
        elif status == "moderate":
            prog_advice = (
                f"Your volume trend is stable. Keep training load constant for 1 more block before pushing progression "
                f"to let your connective tissue adapt fully."
            )
        else:
            prog_advice = "We need at least 1-2 consistent sessions to establish a baseline trend and map your rate of progress."

        content = (
            f"Let's review your training progress: **{muscle_name}** volume has {trend_verb} by {abs(trend_percent):.0f}% "
            f"compared to last week, with a current fatigue score of {fatigue_score:.0f}/100. "
            f"{prog_advice} {recovery_line}"
        )
    elif is_exercise:
        if status == "overloaded":
            ex_advice = f"Since your {muscle_name} is overloaded, let's scale back to low-impact, multi-joint variations or light bodyweight movements."
        elif status == "recovered":
            ex_advice = f"With your {muscle_name} fully recovered, you can target it with heavy compound lifts followed by isolated mechanical tension."
        else:
            ex_advice = f"Focus on maintaining solid technique and a moderate volume threshold."

        content = (
            f"To optimize stimulus for your **{muscle_name}** (currently in {status_line}): "
            f"{ex_advice} {exercise_line} "
            f"Make sure to execute the eccentric (lowering) phase under strict control (3 seconds) to maximize mechanical tension."
        )
    elif is_adjust:
        content = (
            f"Understood. If you are experiencing stiffness, joint discomfort, or want to modify your routine for **{muscle_name}**, "
            f"we should make key training adjustments: \n"
            f"1. **Scale Intensity:** Reduce working weight by 20-30% or switch to bodyweight variations.\n"
            f"2. **Modify Range of Motion:** Train in a pain-free range. If full bench presses irritate your shoulders, swap to a floor press or incline press.\n"
            f"3. **Change Exercise:** {exercise_line or 'Focus on alternative bodyweight stretching or mobility movements.'}\n"
            f"4. **Tempo Focus:** Focus on a slow 3-second eccentric phase and a 1-second pause at the bottom to build structural strength without heavy joint compression."
        )
    elif is_recovery:
        content = (
            f"Regarding recovery for **{muscle_name}** (Fatigue: {fatigue_score:.0f}/100): "
            f"The muscle is currently {status_line}. {action_line} "
            f"For optimal recovery, support muscle protein synthesis with 1.6-2.0g of protein per kg of bodyweight, "
            f"ensure you get 7-8 hours of high-quality sleep, and hydrate properly post-workout. {recovery_line}"
        )
    else:
        # Default smart summary response
        content = (
            f"As your ForgeAI Coach, I've analyzed your stats for **{muscle_name}**: "
            f"It is currently in {status_line} (trend {trend_percent:+.0f}%, fatigue {fatigue_score:.0f}/100). "
            f"{recommendation_line} {action_line} {exercise_line} {recovery_line}"
        )
    final_content = f'You asked: "{prompt}". {content}'

    has_chart = True
    if is_greeting or is_adjust:
        has_chart = False

    return {
        "content": final_content,
        "has_chart": has_chart,
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
