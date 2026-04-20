// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insight_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InsightSummaryImpl _$$InsightSummaryImplFromJson(Map<String, dynamic> json) =>
    _$InsightSummaryImpl(
      totalVolume: (json['totalVolume'] as num).toDouble(),
      workoutsThisWeek: (json['workoutsThisWeek'] as num).toInt(),
      caloriesBurned: (json['caloriesBurned'] as num).toDouble(),
      muscleStatuses: (json['muscleStatuses'] as List<dynamic>?)
              ?.map((e) => MuscleStatus.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$InsightSummaryImplToJson(
        _$InsightSummaryImpl instance) =>
    <String, dynamic>{
      'totalVolume': instance.totalVolume,
      'workoutsThisWeek': instance.workoutsThisWeek,
      'caloriesBurned': instance.caloriesBurned,
      'muscleStatuses': instance.muscleStatuses,
    };
