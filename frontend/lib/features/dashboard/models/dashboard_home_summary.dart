import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_home_summary.freezed.dart';
part 'dashboard_home_summary.g.dart';

@freezed
class DashboardHomeSummary with _$DashboardHomeSummary {
  const factory DashboardHomeSummary({
    required String greetingLine,
    required String athleteAlias,
    required int readinessScore,
    required String readinessMessage,
    required String volumeValue,
    required String volumeUnit,
    required int streakDays,
  }) = _DashboardHomeSummary;

  factory DashboardHomeSummary.fromJson(Map<String, dynamic> json) =>
      _$DashboardHomeSummaryFromJson(json);

  static const fallback = DashboardHomeSummary(
    greetingLine: 'Good morning',
    athleteAlias: 'Champ',
    readinessScore: 72,
    readinessMessage:
        'Slept 6h — today\'s session is dynamically lightened for optimal recovery.',
    volumeValue: '12.4k',
    volumeUnit: 'lbs lifted',
    streakDays: 12,
  );
}
