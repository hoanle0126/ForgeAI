// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_home_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardHomeSummaryImpl _$$DashboardHomeSummaryImplFromJson(
  Map<String, dynamic> json,
) => _$DashboardHomeSummaryImpl(
  greetingLine: json['greetingLine'] as String,
  athleteAlias: json['athleteAlias'] as String,
  readinessScore: (json['readinessScore'] as num).toInt(),
  readinessMessage: json['readinessMessage'] as String,
  volumeValue: json['volumeValue'] as String,
  volumeUnit: json['volumeUnit'] as String,
  streakDays: (json['streakDays'] as num).toInt(),
);

Map<String, dynamic> _$$DashboardHomeSummaryImplToJson(
  _$DashboardHomeSummaryImpl instance,
) => <String, dynamic>{
  'greetingLine': instance.greetingLine,
  'athleteAlias': instance.athleteAlias,
  'readinessScore': instance.readinessScore,
  'readinessMessage': instance.readinessMessage,
  'volumeValue': instance.volumeValue,
  'volumeUnit': instance.volumeUnit,
  'streakDays': instance.streakDays,
};
