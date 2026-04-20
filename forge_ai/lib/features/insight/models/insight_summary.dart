import 'package:freezed_annotation/freezed_annotation.dart';
import 'muscle_status.dart';

part 'insight_summary.freezed.dart';
part 'insight_summary.g.dart';

@freezed
class InsightSummary with _$InsightSummary {
  const factory InsightSummary({
    required double totalVolume,
    required int workoutsThisWeek,
    required double caloriesBurned,
    @Default([]) List<MuscleStatus> muscleStatuses,
  }) = _InsightSummary;

  factory InsightSummary.fromJson(Map<String, dynamic> json) => _$InsightSummaryFromJson(json);
}
