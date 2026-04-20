// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'muscle_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MuscleStatusImpl _$$MuscleStatusImplFromJson(Map<String, dynamic> json) =>
    _$MuscleStatusImpl(
      name: json['name'] as String,
      fatigueLevel: (json['fatigueLevel'] as num).toDouble(),
    );

Map<String, dynamic> _$$MuscleStatusImplToJson(_$MuscleStatusImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'fatigueLevel': instance.fatigueLevel,
    };
