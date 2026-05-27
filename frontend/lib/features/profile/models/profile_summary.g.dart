// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileSummaryImpl _$$ProfileSummaryImplFromJson(Map<String, dynamic> json) =>
    _$ProfileSummaryImpl(
      id: json['id'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      gender: json['gender'] as String,
      dateOfBirth: json['dateOfBirth'] as String,
      createdAt: json['createdAt'] as String,
      athleteAlias: json['athleteAlias'] as String,
      athleteTitle: json['athleteTitle'] as String,
      completionCount: (json['completionCount'] as num).toInt(),
      streakDays: (json['streakDays'] as num).toInt(),
      latestMetric: json['latestMetric'] == null
          ? null
          : ProfileLatestMetric.fromJson(
              json['latestMetric'] as Map<String, dynamic>,
            ),
      trainingSnapshot: ProfileTrainingSnapshotSummary.fromJson(
        json['trainingSnapshot'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$$ProfileSummaryImplToJson(
  _$ProfileSummaryImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'fullName': instance.fullName,
  'email': instance.email,
  'gender': instance.gender,
  'dateOfBirth': instance.dateOfBirth,
  'createdAt': instance.createdAt,
  'athleteAlias': instance.athleteAlias,
  'athleteTitle': instance.athleteTitle,
  'completionCount': instance.completionCount,
  'streakDays': instance.streakDays,
  'latestMetric': instance.latestMetric,
  'trainingSnapshot': instance.trainingSnapshot,
};

_$ProfileLatestMetricImpl _$$ProfileLatestMetricImplFromJson(
  Map<String, dynamic> json,
) => _$ProfileLatestMetricImpl(
  recordedAt: json['recordedAt'] as String,
  weightKg: (json['weightKg'] as num?)?.toDouble(),
  heightCm: (json['heightCm'] as num?)?.toDouble(),
  bodyFatPct: (json['bodyFatPct'] as num?)?.toDouble(),
  muscleMass: (json['muscleMass'] as num?)?.toDouble(),
);

Map<String, dynamic> _$$ProfileLatestMetricImplToJson(
  _$ProfileLatestMetricImpl instance,
) => <String, dynamic>{
  'recordedAt': instance.recordedAt,
  'weightKg': instance.weightKg,
  'heightCm': instance.heightCm,
  'bodyFatPct': instance.bodyFatPct,
  'muscleMass': instance.muscleMass,
};

_$ProfileTrainingSnapshotSummaryImpl
_$$ProfileTrainingSnapshotSummaryImplFromJson(Map<String, dynamic> json) =>
    _$ProfileTrainingSnapshotSummaryImpl(
      preferredDays: (json['preferredDays'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      preferredDurationMinutes: (json['preferredDurationMinutes'] as num?)
          ?.toInt(),
      primaryGoal: json['primaryGoal'] as String?,
    );

Map<String, dynamic> _$$ProfileTrainingSnapshotSummaryImplToJson(
  _$ProfileTrainingSnapshotSummaryImpl instance,
) => <String, dynamic>{
  'preferredDays': instance.preferredDays,
  'preferredDurationMinutes': instance.preferredDurationMinutes,
  'primaryGoal': instance.primaryGoal,
};
