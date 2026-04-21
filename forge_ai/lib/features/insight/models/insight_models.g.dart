// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insight_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MuscleDataImpl _$$MuscleDataImplFromJson(Map<String, dynamic> json) =>
    _$MuscleDataImpl(
      id: json['id'] as String,
      volume: (json['volume'] as num).toDouble(),
      rpe: (json['rpe'] as num).toDouble(),
    );

Map<String, dynamic> _$$MuscleDataImplToJson(_$MuscleDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'volume': instance.volume,
      'rpe': instance.rpe,
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
