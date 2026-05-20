import 'package:freezed_annotation/freezed_annotation.dart';

part 'insight_models.freezed.dart';
part 'insight_models.g.dart';

enum AtlasSide { front, back }

enum MuscleTrainingStatus { recovered, moderate, overloaded, neutral }

@freezed
class ChartPoint with _$ChartPoint {
  const factory ChartPoint({required String label, required double value}) =
      _ChartPoint;

  factory ChartPoint.fromJson(Map<String, dynamic> json) =>
      _$ChartPointFromJson(json);
}

@freezed
class ExerciseContribution with _$ExerciseContribution {
  const factory ExerciseContribution({
    required String exerciseName,
    required double volume,
  }) = _ExerciseContribution;

  factory ExerciseContribution.fromJson(Map<String, dynamic> json) =>
      _$ExerciseContributionFromJson(json);
}

@freezed
class MuscleData with _$MuscleData {
  const factory MuscleData({
    required String id, // corresponds to flutter_body_atlas IDs
    required double volume,
    required double rpe,
    @Default(MuscleTrainingStatus.neutral) MuscleTrainingStatus status,
  }) = _MuscleData;

  factory MuscleData.fromJson(Map<String, dynamic> json) =>
      _$MuscleDataFromJson(json);
}

@freezed
class MuscleAnalysis with _$MuscleAnalysis {
  const factory MuscleAnalysis({
    required String muscleId,
    required String displayName,
    required MuscleTrainingStatus status,
    required double volume,
    required double rpe,
    required double trendPercent,
    required int fatigueScore,
    required String recommendation,
    @Default(<ChartPoint>[]) List<ChartPoint> loadTrend,
    @Default(<ExerciseContribution>[])
    List<ExerciseContribution> exerciseContributions,
    @Default(<ChartPoint>[]) List<ChartPoint> recoveryBalance,
  }) = _MuscleAnalysis;

  factory MuscleAnalysis.fromJson(Map<String, dynamic> json) =>
      _$MuscleAnalysisFromJson(json);
}

@freezed
class InsightMessage with _$InsightMessage {
  const factory InsightMessage({
    required String id,
    required String content,
    required bool isUser,
    @Default(false) bool hasChart,
  }) = _InsightMessage;

  factory InsightMessage.fromJson(Map<String, dynamic> json) =>
      _$InsightMessageFromJson(json);
}
