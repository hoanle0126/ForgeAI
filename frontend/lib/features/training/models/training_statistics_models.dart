import 'package:freezed_annotation/freezed_annotation.dart';

part 'training_statistics_models.freezed.dart';

@freezed
class TrainingStatisticsPoint with _$TrainingStatisticsPoint {
  const factory TrainingStatisticsPoint({
    required String label,
    required double value,
  }) = _TrainingStatisticsPoint;
}

@freezed
class TrainingStatisticsSegment with _$TrainingStatisticsSegment {
  const factory TrainingStatisticsSegment({
    required String label,
    required int count,
    required double ratio,
  }) = _TrainingStatisticsSegment;
}

@freezed
class TrainingExerciseSpotlight with _$TrainingExerciseSpotlight {
  const factory TrainingExerciseSpotlight({
    required String name,
    required int workoutCount,
    required int setCount,
    required int totalReps,
  }) = _TrainingExerciseSpotlight;
}

@freezed
class TrainingStatisticsData with _$TrainingStatisticsData {
  const factory TrainingStatisticsData({
    required int trackedWorkouts,
    required int completedWorkouts,
    required int plannedMinutes,
    required int averageSessionMinutes,
    required int totalSetBlocks,
    required double completionRate,
    required String focusGoalLabel,
    required String busiestDayLabel,
    required String insightText,
    @Default(<TrainingStatisticsPoint>[])
    List<TrainingStatisticsPoint> weeklyLoad,
    @Default(<TrainingStatisticsSegment>[])
    List<TrainingStatisticsSegment> statusSegments,
    @Default(<TrainingStatisticsSegment>[])
    List<TrainingStatisticsSegment> goalSegments,
    @Default(<TrainingExerciseSpotlight>[])
    List<TrainingExerciseSpotlight> topExercises,
  }) = _TrainingStatisticsData;
}

extension TrainingStatisticsDataX on TrainingStatisticsData {
  bool get hasTrackedWorkouts => trackedWorkouts > 0;

  bool get hasWeeklyLoad => weeklyLoad.any((point) => point.value > 0);

  String get completionRateLabel => '${(completionRate * 100).round()}%';

  String get heroTitle => hasWeeklyLoad
      ? 'Load peaks on $busiestDayLabel'
      : 'Shape the week with cleaner dates';

  String get heroSummary {
    return 'ForgeAI mapped $trackedWorkouts active workouts, '
        '$totalSetBlocks set blocks, and $plannedMinutes planned minutes '
        'from your current training library.';
  }
}
