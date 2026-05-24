import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_summary.freezed.dart';
part 'profile_summary.g.dart';

@freezed
class ProfileSummary with _$ProfileSummary {
  const factory ProfileSummary({
    required String id,
    required String fullName,
    required String email,
    required String gender,
    required String dateOfBirth,
    required String createdAt,
    required String athleteAlias,
    required String athleteTitle,
    required int completionCount,
    required int streakDays,
    ProfileLatestMetric? latestMetric,
    required ProfileTrainingSnapshotSummary trainingSnapshot,
  }) = _ProfileSummary;

  factory ProfileSummary.fromJson(Map<String, dynamic> json) =>
      _$ProfileSummaryFromJson(json);
}

@freezed
class ProfileLatestMetric with _$ProfileLatestMetric {
  const factory ProfileLatestMetric({
    required String recordedAt,
    double? weightKg,
    double? heightCm,
    double? bodyFatPct,
    double? muscleMass,
  }) = _ProfileLatestMetric;

  factory ProfileLatestMetric.fromJson(Map<String, dynamic> json) =>
      _$ProfileLatestMetricFromJson(json);
}

@freezed
class ProfileTrainingSnapshotSummary with _$ProfileTrainingSnapshotSummary {
  const factory ProfileTrainingSnapshotSummary({
    required List<String> preferredDays,
    int? preferredDurationMinutes,
    String? primaryGoal,
  }) = _ProfileTrainingSnapshotSummary;

  factory ProfileTrainingSnapshotSummary.fromJson(Map<String, dynamic> json) =>
      _$ProfileTrainingSnapshotSummaryFromJson(json);
}
