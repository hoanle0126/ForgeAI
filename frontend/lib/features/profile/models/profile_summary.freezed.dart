// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProfileSummary _$ProfileSummaryFromJson(Map<String, dynamic> json) {
  return _ProfileSummary.fromJson(json);
}

/// @nodoc
mixin _$ProfileSummary {
  String get id => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String get dateOfBirth => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get athleteAlias => throw _privateConstructorUsedError;
  String get athleteTitle => throw _privateConstructorUsedError;
  int get completionCount => throw _privateConstructorUsedError;
  int get streakDays => throw _privateConstructorUsedError;
  ProfileLatestMetric? get latestMetric => throw _privateConstructorUsedError;
  ProfileTrainingSnapshotSummary get trainingSnapshot =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileSummaryCopyWith<ProfileSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileSummaryCopyWith<$Res> {
  factory $ProfileSummaryCopyWith(
    ProfileSummary value,
    $Res Function(ProfileSummary) then,
  ) = _$ProfileSummaryCopyWithImpl<$Res, ProfileSummary>;
  @useResult
  $Res call({
    String id,
    String fullName,
    String email,
    String gender,
    String dateOfBirth,
    String createdAt,
    String athleteAlias,
    String athleteTitle,
    int completionCount,
    int streakDays,
    ProfileLatestMetric? latestMetric,
    ProfileTrainingSnapshotSummary trainingSnapshot,
  });

  $ProfileLatestMetricCopyWith<$Res>? get latestMetric;
  $ProfileTrainingSnapshotSummaryCopyWith<$Res> get trainingSnapshot;
}

/// @nodoc
class _$ProfileSummaryCopyWithImpl<$Res, $Val extends ProfileSummary>
    implements $ProfileSummaryCopyWith<$Res> {
  _$ProfileSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? email = null,
    Object? gender = null,
    Object? dateOfBirth = null,
    Object? createdAt = null,
    Object? athleteAlias = null,
    Object? athleteTitle = null,
    Object? completionCount = null,
    Object? streakDays = null,
    Object? latestMetric = freezed,
    Object? trainingSnapshot = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            fullName: null == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            gender: null == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as String,
            dateOfBirth: null == dateOfBirth
                ? _value.dateOfBirth
                : dateOfBirth // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            athleteAlias: null == athleteAlias
                ? _value.athleteAlias
                : athleteAlias // ignore: cast_nullable_to_non_nullable
                      as String,
            athleteTitle: null == athleteTitle
                ? _value.athleteTitle
                : athleteTitle // ignore: cast_nullable_to_non_nullable
                      as String,
            completionCount: null == completionCount
                ? _value.completionCount
                : completionCount // ignore: cast_nullable_to_non_nullable
                      as int,
            streakDays: null == streakDays
                ? _value.streakDays
                : streakDays // ignore: cast_nullable_to_non_nullable
                      as int,
            latestMetric: freezed == latestMetric
                ? _value.latestMetric
                : latestMetric // ignore: cast_nullable_to_non_nullable
                      as ProfileLatestMetric?,
            trainingSnapshot: null == trainingSnapshot
                ? _value.trainingSnapshot
                : trainingSnapshot // ignore: cast_nullable_to_non_nullable
                      as ProfileTrainingSnapshotSummary,
          )
          as $Val,
    );
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileLatestMetricCopyWith<$Res>? get latestMetric {
    if (_value.latestMetric == null) {
      return null;
    }

    return $ProfileLatestMetricCopyWith<$Res>(_value.latestMetric!, (value) {
      return _then(_value.copyWith(latestMetric: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileTrainingSnapshotSummaryCopyWith<$Res> get trainingSnapshot {
    return $ProfileTrainingSnapshotSummaryCopyWith<$Res>(
      _value.trainingSnapshot,
      (value) {
        return _then(_value.copyWith(trainingSnapshot: value) as $Val);
      },
    );
  }
}

/// @nodoc
abstract class _$$ProfileSummaryImplCopyWith<$Res>
    implements $ProfileSummaryCopyWith<$Res> {
  factory _$$ProfileSummaryImplCopyWith(
    _$ProfileSummaryImpl value,
    $Res Function(_$ProfileSummaryImpl) then,
  ) = __$$ProfileSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String fullName,
    String email,
    String gender,
    String dateOfBirth,
    String createdAt,
    String athleteAlias,
    String athleteTitle,
    int completionCount,
    int streakDays,
    ProfileLatestMetric? latestMetric,
    ProfileTrainingSnapshotSummary trainingSnapshot,
  });

  @override
  $ProfileLatestMetricCopyWith<$Res>? get latestMetric;
  @override
  $ProfileTrainingSnapshotSummaryCopyWith<$Res> get trainingSnapshot;
}

/// @nodoc
class __$$ProfileSummaryImplCopyWithImpl<$Res>
    extends _$ProfileSummaryCopyWithImpl<$Res, _$ProfileSummaryImpl>
    implements _$$ProfileSummaryImplCopyWith<$Res> {
  __$$ProfileSummaryImplCopyWithImpl(
    _$ProfileSummaryImpl _value,
    $Res Function(_$ProfileSummaryImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? email = null,
    Object? gender = null,
    Object? dateOfBirth = null,
    Object? createdAt = null,
    Object? athleteAlias = null,
    Object? athleteTitle = null,
    Object? completionCount = null,
    Object? streakDays = null,
    Object? latestMetric = freezed,
    Object? trainingSnapshot = null,
  }) {
    return _then(
      _$ProfileSummaryImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        fullName: null == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        gender: null == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as String,
        dateOfBirth: null == dateOfBirth
            ? _value.dateOfBirth
            : dateOfBirth // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        athleteAlias: null == athleteAlias
            ? _value.athleteAlias
            : athleteAlias // ignore: cast_nullable_to_non_nullable
                  as String,
        athleteTitle: null == athleteTitle
            ? _value.athleteTitle
            : athleteTitle // ignore: cast_nullable_to_non_nullable
                  as String,
        completionCount: null == completionCount
            ? _value.completionCount
            : completionCount // ignore: cast_nullable_to_non_nullable
                  as int,
        streakDays: null == streakDays
            ? _value.streakDays
            : streakDays // ignore: cast_nullable_to_non_nullable
                  as int,
        latestMetric: freezed == latestMetric
            ? _value.latestMetric
            : latestMetric // ignore: cast_nullable_to_non_nullable
                  as ProfileLatestMetric?,
        trainingSnapshot: null == trainingSnapshot
            ? _value.trainingSnapshot
            : trainingSnapshot // ignore: cast_nullable_to_non_nullable
                  as ProfileTrainingSnapshotSummary,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileSummaryImpl implements _ProfileSummary {
  const _$ProfileSummaryImpl({
    required this.id,
    required this.fullName,
    required this.email,
    required this.gender,
    required this.dateOfBirth,
    required this.createdAt,
    required this.athleteAlias,
    required this.athleteTitle,
    required this.completionCount,
    required this.streakDays,
    this.latestMetric,
    required this.trainingSnapshot,
  });

  factory _$ProfileSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileSummaryImplFromJson(json);

  @override
  final String id;
  @override
  final String fullName;
  @override
  final String email;
  @override
  final String gender;
  @override
  final String dateOfBirth;
  @override
  final String createdAt;
  @override
  final String athleteAlias;
  @override
  final String athleteTitle;
  @override
  final int completionCount;
  @override
  final int streakDays;
  @override
  final ProfileLatestMetric? latestMetric;
  @override
  final ProfileTrainingSnapshotSummary trainingSnapshot;

  @override
  String toString() {
    return 'ProfileSummary(id: $id, fullName: $fullName, email: $email, gender: $gender, dateOfBirth: $dateOfBirth, createdAt: $createdAt, athleteAlias: $athleteAlias, athleteTitle: $athleteTitle, completionCount: $completionCount, streakDays: $streakDays, latestMetric: $latestMetric, trainingSnapshot: $trainingSnapshot)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileSummaryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.athleteAlias, athleteAlias) ||
                other.athleteAlias == athleteAlias) &&
            (identical(other.athleteTitle, athleteTitle) ||
                other.athleteTitle == athleteTitle) &&
            (identical(other.completionCount, completionCount) ||
                other.completionCount == completionCount) &&
            (identical(other.streakDays, streakDays) ||
                other.streakDays == streakDays) &&
            (identical(other.latestMetric, latestMetric) ||
                other.latestMetric == latestMetric) &&
            (identical(other.trainingSnapshot, trainingSnapshot) ||
                other.trainingSnapshot == trainingSnapshot));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    fullName,
    email,
    gender,
    dateOfBirth,
    createdAt,
    athleteAlias,
    athleteTitle,
    completionCount,
    streakDays,
    latestMetric,
    trainingSnapshot,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileSummaryImplCopyWith<_$ProfileSummaryImpl> get copyWith =>
      __$$ProfileSummaryImplCopyWithImpl<_$ProfileSummaryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileSummaryImplToJson(this);
  }
}

abstract class _ProfileSummary implements ProfileSummary {
  const factory _ProfileSummary({
    required final String id,
    required final String fullName,
    required final String email,
    required final String gender,
    required final String dateOfBirth,
    required final String createdAt,
    required final String athleteAlias,
    required final String athleteTitle,
    required final int completionCount,
    required final int streakDays,
    final ProfileLatestMetric? latestMetric,
    required final ProfileTrainingSnapshotSummary trainingSnapshot,
  }) = _$ProfileSummaryImpl;

  factory _ProfileSummary.fromJson(Map<String, dynamic> json) =
      _$ProfileSummaryImpl.fromJson;

  @override
  String get id;
  @override
  String get fullName;
  @override
  String get email;
  @override
  String get gender;
  @override
  String get dateOfBirth;
  @override
  String get createdAt;
  @override
  String get athleteAlias;
  @override
  String get athleteTitle;
  @override
  int get completionCount;
  @override
  int get streakDays;
  @override
  ProfileLatestMetric? get latestMetric;
  @override
  ProfileTrainingSnapshotSummary get trainingSnapshot;
  @override
  @JsonKey(ignore: true)
  _$$ProfileSummaryImplCopyWith<_$ProfileSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProfileLatestMetric _$ProfileLatestMetricFromJson(Map<String, dynamic> json) {
  return _ProfileLatestMetric.fromJson(json);
}

/// @nodoc
mixin _$ProfileLatestMetric {
  String get recordedAt => throw _privateConstructorUsedError;
  double? get weightKg => throw _privateConstructorUsedError;
  double? get heightCm => throw _privateConstructorUsedError;
  double? get bodyFatPct => throw _privateConstructorUsedError;
  double? get muscleMass => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileLatestMetricCopyWith<ProfileLatestMetric> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileLatestMetricCopyWith<$Res> {
  factory $ProfileLatestMetricCopyWith(
    ProfileLatestMetric value,
    $Res Function(ProfileLatestMetric) then,
  ) = _$ProfileLatestMetricCopyWithImpl<$Res, ProfileLatestMetric>;
  @useResult
  $Res call({
    String recordedAt,
    double? weightKg,
    double? heightCm,
    double? bodyFatPct,
    double? muscleMass,
  });
}

/// @nodoc
class _$ProfileLatestMetricCopyWithImpl<$Res, $Val extends ProfileLatestMetric>
    implements $ProfileLatestMetricCopyWith<$Res> {
  _$ProfileLatestMetricCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recordedAt = null,
    Object? weightKg = freezed,
    Object? heightCm = freezed,
    Object? bodyFatPct = freezed,
    Object? muscleMass = freezed,
  }) {
    return _then(
      _value.copyWith(
            recordedAt: null == recordedAt
                ? _value.recordedAt
                : recordedAt // ignore: cast_nullable_to_non_nullable
                      as String,
            weightKg: freezed == weightKg
                ? _value.weightKg
                : weightKg // ignore: cast_nullable_to_non_nullable
                      as double?,
            heightCm: freezed == heightCm
                ? _value.heightCm
                : heightCm // ignore: cast_nullable_to_non_nullable
                      as double?,
            bodyFatPct: freezed == bodyFatPct
                ? _value.bodyFatPct
                : bodyFatPct // ignore: cast_nullable_to_non_nullable
                      as double?,
            muscleMass: freezed == muscleMass
                ? _value.muscleMass
                : muscleMass // ignore: cast_nullable_to_non_nullable
                      as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProfileLatestMetricImplCopyWith<$Res>
    implements $ProfileLatestMetricCopyWith<$Res> {
  factory _$$ProfileLatestMetricImplCopyWith(
    _$ProfileLatestMetricImpl value,
    $Res Function(_$ProfileLatestMetricImpl) then,
  ) = __$$ProfileLatestMetricImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String recordedAt,
    double? weightKg,
    double? heightCm,
    double? bodyFatPct,
    double? muscleMass,
  });
}

/// @nodoc
class __$$ProfileLatestMetricImplCopyWithImpl<$Res>
    extends _$ProfileLatestMetricCopyWithImpl<$Res, _$ProfileLatestMetricImpl>
    implements _$$ProfileLatestMetricImplCopyWith<$Res> {
  __$$ProfileLatestMetricImplCopyWithImpl(
    _$ProfileLatestMetricImpl _value,
    $Res Function(_$ProfileLatestMetricImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recordedAt = null,
    Object? weightKg = freezed,
    Object? heightCm = freezed,
    Object? bodyFatPct = freezed,
    Object? muscleMass = freezed,
  }) {
    return _then(
      _$ProfileLatestMetricImpl(
        recordedAt: null == recordedAt
            ? _value.recordedAt
            : recordedAt // ignore: cast_nullable_to_non_nullable
                  as String,
        weightKg: freezed == weightKg
            ? _value.weightKg
            : weightKg // ignore: cast_nullable_to_non_nullable
                  as double?,
        heightCm: freezed == heightCm
            ? _value.heightCm
            : heightCm // ignore: cast_nullable_to_non_nullable
                  as double?,
        bodyFatPct: freezed == bodyFatPct
            ? _value.bodyFatPct
            : bodyFatPct // ignore: cast_nullable_to_non_nullable
                  as double?,
        muscleMass: freezed == muscleMass
            ? _value.muscleMass
            : muscleMass // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileLatestMetricImpl implements _ProfileLatestMetric {
  const _$ProfileLatestMetricImpl({
    required this.recordedAt,
    this.weightKg,
    this.heightCm,
    this.bodyFatPct,
    this.muscleMass,
  });

  factory _$ProfileLatestMetricImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileLatestMetricImplFromJson(json);

  @override
  final String recordedAt;
  @override
  final double? weightKg;
  @override
  final double? heightCm;
  @override
  final double? bodyFatPct;
  @override
  final double? muscleMass;

  @override
  String toString() {
    return 'ProfileLatestMetric(recordedAt: $recordedAt, weightKg: $weightKg, heightCm: $heightCm, bodyFatPct: $bodyFatPct, muscleMass: $muscleMass)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileLatestMetricImpl &&
            (identical(other.recordedAt, recordedAt) ||
                other.recordedAt == recordedAt) &&
            (identical(other.weightKg, weightKg) ||
                other.weightKg == weightKg) &&
            (identical(other.heightCm, heightCm) ||
                other.heightCm == heightCm) &&
            (identical(other.bodyFatPct, bodyFatPct) ||
                other.bodyFatPct == bodyFatPct) &&
            (identical(other.muscleMass, muscleMass) ||
                other.muscleMass == muscleMass));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    recordedAt,
    weightKg,
    heightCm,
    bodyFatPct,
    muscleMass,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileLatestMetricImplCopyWith<_$ProfileLatestMetricImpl> get copyWith =>
      __$$ProfileLatestMetricImplCopyWithImpl<_$ProfileLatestMetricImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileLatestMetricImplToJson(this);
  }
}

abstract class _ProfileLatestMetric implements ProfileLatestMetric {
  const factory _ProfileLatestMetric({
    required final String recordedAt,
    final double? weightKg,
    final double? heightCm,
    final double? bodyFatPct,
    final double? muscleMass,
  }) = _$ProfileLatestMetricImpl;

  factory _ProfileLatestMetric.fromJson(Map<String, dynamic> json) =
      _$ProfileLatestMetricImpl.fromJson;

  @override
  String get recordedAt;
  @override
  double? get weightKg;
  @override
  double? get heightCm;
  @override
  double? get bodyFatPct;
  @override
  double? get muscleMass;
  @override
  @JsonKey(ignore: true)
  _$$ProfileLatestMetricImplCopyWith<_$ProfileLatestMetricImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProfileTrainingSnapshotSummary _$ProfileTrainingSnapshotSummaryFromJson(
  Map<String, dynamic> json,
) {
  return _ProfileTrainingSnapshotSummary.fromJson(json);
}

/// @nodoc
mixin _$ProfileTrainingSnapshotSummary {
  List<String> get preferredDays => throw _privateConstructorUsedError;
  int? get preferredDurationMinutes => throw _privateConstructorUsedError;
  String? get primaryGoal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileTrainingSnapshotSummaryCopyWith<ProfileTrainingSnapshotSummary>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileTrainingSnapshotSummaryCopyWith<$Res> {
  factory $ProfileTrainingSnapshotSummaryCopyWith(
    ProfileTrainingSnapshotSummary value,
    $Res Function(ProfileTrainingSnapshotSummary) then,
  ) =
      _$ProfileTrainingSnapshotSummaryCopyWithImpl<
        $Res,
        ProfileTrainingSnapshotSummary
      >;
  @useResult
  $Res call({
    List<String> preferredDays,
    int? preferredDurationMinutes,
    String? primaryGoal,
  });
}

/// @nodoc
class _$ProfileTrainingSnapshotSummaryCopyWithImpl<
  $Res,
  $Val extends ProfileTrainingSnapshotSummary
>
    implements $ProfileTrainingSnapshotSummaryCopyWith<$Res> {
  _$ProfileTrainingSnapshotSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preferredDays = null,
    Object? preferredDurationMinutes = freezed,
    Object? primaryGoal = freezed,
  }) {
    return _then(
      _value.copyWith(
            preferredDays: null == preferredDays
                ? _value.preferredDays
                : preferredDays // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            preferredDurationMinutes: freezed == preferredDurationMinutes
                ? _value.preferredDurationMinutes
                : preferredDurationMinutes // ignore: cast_nullable_to_non_nullable
                      as int?,
            primaryGoal: freezed == primaryGoal
                ? _value.primaryGoal
                : primaryGoal // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProfileTrainingSnapshotSummaryImplCopyWith<$Res>
    implements $ProfileTrainingSnapshotSummaryCopyWith<$Res> {
  factory _$$ProfileTrainingSnapshotSummaryImplCopyWith(
    _$ProfileTrainingSnapshotSummaryImpl value,
    $Res Function(_$ProfileTrainingSnapshotSummaryImpl) then,
  ) = __$$ProfileTrainingSnapshotSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<String> preferredDays,
    int? preferredDurationMinutes,
    String? primaryGoal,
  });
}

/// @nodoc
class __$$ProfileTrainingSnapshotSummaryImplCopyWithImpl<$Res>
    extends
        _$ProfileTrainingSnapshotSummaryCopyWithImpl<
          $Res,
          _$ProfileTrainingSnapshotSummaryImpl
        >
    implements _$$ProfileTrainingSnapshotSummaryImplCopyWith<$Res> {
  __$$ProfileTrainingSnapshotSummaryImplCopyWithImpl(
    _$ProfileTrainingSnapshotSummaryImpl _value,
    $Res Function(_$ProfileTrainingSnapshotSummaryImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preferredDays = null,
    Object? preferredDurationMinutes = freezed,
    Object? primaryGoal = freezed,
  }) {
    return _then(
      _$ProfileTrainingSnapshotSummaryImpl(
        preferredDays: null == preferredDays
            ? _value._preferredDays
            : preferredDays // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        preferredDurationMinutes: freezed == preferredDurationMinutes
            ? _value.preferredDurationMinutes
            : preferredDurationMinutes // ignore: cast_nullable_to_non_nullable
                  as int?,
        primaryGoal: freezed == primaryGoal
            ? _value.primaryGoal
            : primaryGoal // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileTrainingSnapshotSummaryImpl
    implements _ProfileTrainingSnapshotSummary {
  const _$ProfileTrainingSnapshotSummaryImpl({
    required final List<String> preferredDays,
    this.preferredDurationMinutes,
    this.primaryGoal,
  }) : _preferredDays = preferredDays;

  factory _$ProfileTrainingSnapshotSummaryImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$ProfileTrainingSnapshotSummaryImplFromJson(json);

  final List<String> _preferredDays;
  @override
  List<String> get preferredDays {
    if (_preferredDays is EqualUnmodifiableListView) return _preferredDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_preferredDays);
  }

  @override
  final int? preferredDurationMinutes;
  @override
  final String? primaryGoal;

  @override
  String toString() {
    return 'ProfileTrainingSnapshotSummary(preferredDays: $preferredDays, preferredDurationMinutes: $preferredDurationMinutes, primaryGoal: $primaryGoal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileTrainingSnapshotSummaryImpl &&
            const DeepCollectionEquality().equals(
              other._preferredDays,
              _preferredDays,
            ) &&
            (identical(
                  other.preferredDurationMinutes,
                  preferredDurationMinutes,
                ) ||
                other.preferredDurationMinutes == preferredDurationMinutes) &&
            (identical(other.primaryGoal, primaryGoal) ||
                other.primaryGoal == primaryGoal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_preferredDays),
    preferredDurationMinutes,
    primaryGoal,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileTrainingSnapshotSummaryImplCopyWith<
    _$ProfileTrainingSnapshotSummaryImpl
  >
  get copyWith =>
      __$$ProfileTrainingSnapshotSummaryImplCopyWithImpl<
        _$ProfileTrainingSnapshotSummaryImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileTrainingSnapshotSummaryImplToJson(this);
  }
}

abstract class _ProfileTrainingSnapshotSummary
    implements ProfileTrainingSnapshotSummary {
  const factory _ProfileTrainingSnapshotSummary({
    required final List<String> preferredDays,
    final int? preferredDurationMinutes,
    final String? primaryGoal,
  }) = _$ProfileTrainingSnapshotSummaryImpl;

  factory _ProfileTrainingSnapshotSummary.fromJson(Map<String, dynamic> json) =
      _$ProfileTrainingSnapshotSummaryImpl.fromJson;

  @override
  List<String> get preferredDays;
  @override
  int? get preferredDurationMinutes;
  @override
  String? get primaryGoal;
  @override
  @JsonKey(ignore: true)
  _$$ProfileTrainingSnapshotSummaryImplCopyWith<
    _$ProfileTrainingSnapshotSummaryImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
