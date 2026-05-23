import json
from pathlib import Path

from recommender import OnboardingProfile, RecommenderArtifacts, recommend_plan


BASE_DIR = Path(__file__).parent
ARTIFACT_PATH = BASE_DIR / "recommender_artifacts.json"


def main() -> None:
    artifacts = RecommenderArtifacts.load(ARTIFACT_PATH)

    sample_profile = OnboardingProfile(
        goal="lose fat",
        equipment=["Dumbbells", "Bench", "Yoga Mat"],
        height_cm=175,
        weight_kg=70,
        age=25,
        activity_level="active",
    )
    recommendation = recommend_plan(sample_profile, artifacts)

    print(f"Loaded artifacts from {ARTIFACT_PATH}")
    print(json.dumps(recommendation, ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main()
