// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insight_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChartPointImpl _$$ChartPointImplFromJson(Map<String, dynamic> json) =>
    _$ChartPointImpl(
      label: json['label'] as String,
      value: (json['value'] as num).toDouble(),
    );

Map<String, dynamic> _$$ChartPointImplToJson(_$ChartPointImpl instance) =>
    <String, dynamic>{'label': instance.label, 'value': instance.value};

_$ExerciseContributionImpl _$$ExerciseContributionImplFromJson(
  Map<String, dynamic> json,
) => _$ExerciseContributionImpl(
  exerciseName: json['exerciseName'] as String,
  volume: (json['volume'] as num).toDouble(),
);

Map<String, dynamic> _$$ExerciseContributionImplToJson(
  _$ExerciseContributionImpl instance,
) => <String, dynamic>{
  'exerciseName': instance.exerciseName,
  'volume': instance.volume,
};

_$MuscleDataImpl _$$MuscleDataImplFromJson(Map<String, dynamic> json) =>
    _$MuscleDataImpl(
      id: json['id'] as String,
      volume: (json['volume'] as num).toDouble(),
      rpe: (json['rpe'] as num).toDouble(),
      status:
          $enumDecodeNullable(_$MuscleTrainingStatusEnumMap, json['status']) ??
          MuscleTrainingStatus.neutral,
    );

Map<String, dynamic> _$$MuscleDataImplToJson(_$MuscleDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'volume': instance.volume,
      'rpe': instance.rpe,
      'status': _$MuscleTrainingStatusEnumMap[instance.status]!,
    };

const _$MuscleTrainingStatusEnumMap = {
  MuscleTrainingStatus.recovered: 'recovered',
  MuscleTrainingStatus.moderate: 'moderate',
  MuscleTrainingStatus.overloaded: 'overloaded',
  MuscleTrainingStatus.neutral: 'neutral',
};

_$MuscleAnalysisImpl _$$MuscleAnalysisImplFromJson(Map<String, dynamic> json) =>
    _$MuscleAnalysisImpl(
      muscleId: json['muscleId'] as String,
      displayName: json['displayName'] as String,
      status: $enumDecode(_$MuscleTrainingStatusEnumMap, json['status']),
      volume: (json['volume'] as num).toDouble(),
      rpe: (json['rpe'] as num).toDouble(),
      trendPercent: (json['trendPercent'] as num).toDouble(),
      fatigueScore: (json['fatigueScore'] as num).toInt(),
      recommendation: json['recommendation'] as String,
      loadTrend:
          (json['loadTrend'] as List<dynamic>?)
              ?.map((e) => ChartPoint.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ChartPoint>[],
      exerciseContributions:
          (json['exerciseContributions'] as List<dynamic>?)
              ?.map(
                (e) => ExerciseContribution.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <ExerciseContribution>[],
      recoveryBalance:
          (json['recoveryBalance'] as List<dynamic>?)
              ?.map((e) => ChartPoint.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ChartPoint>[],
    );

Map<String, dynamic> _$$MuscleAnalysisImplToJson(
  _$MuscleAnalysisImpl instance,
) => <String, dynamic>{
  'muscleId': instance.muscleId,
  'displayName': instance.displayName,
  'status': _$MuscleTrainingStatusEnumMap[instance.status]!,
  'volume': instance.volume,
  'rpe': instance.rpe,
  'trendPercent': instance.trendPercent,
  'fatigueScore': instance.fatigueScore,
  'recommendation': instance.recommendation,
  'loadTrend': instance.loadTrend,
  'exerciseContributions': instance.exerciseContributions,
  'recoveryBalance': instance.recoveryBalance,
};

_$InsightMessageImpl _$$InsightMessageImplFromJson(Map<String, dynamic> json) =>
    _$InsightMessageImpl(
      id: json['id'] as String,
      content: json['content'] as String,
      isUser: json['isUser'] as bool,
      hasChart: json['hasChart'] as bool? ?? false,
    );

Map<String, dynamic> _$$InsightMessageImplToJson(
  _$InsightMessageImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'content': instance.content,
  'isUser': instance.isUser,
  'hasChart': instance.hasChart,
};
