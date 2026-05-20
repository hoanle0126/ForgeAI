// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'insight_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ChartPoint _$ChartPointFromJson(Map<String, dynamic> json) {
  return _ChartPoint.fromJson(json);
}

/// @nodoc
mixin _$ChartPoint {
  String get label => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChartPointCopyWith<ChartPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChartPointCopyWith<$Res> {
  factory $ChartPointCopyWith(
    ChartPoint value,
    $Res Function(ChartPoint) then,
  ) = _$ChartPointCopyWithImpl<$Res, ChartPoint>;
  @useResult
  $Res call({String label, double value});
}

/// @nodoc
class _$ChartPointCopyWithImpl<$Res, $Val extends ChartPoint>
    implements $ChartPointCopyWith<$Res> {
  _$ChartPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? label = null, Object? value = null}) {
    return _then(
      _value.copyWith(
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
            value: null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChartPointImplCopyWith<$Res>
    implements $ChartPointCopyWith<$Res> {
  factory _$$ChartPointImplCopyWith(
    _$ChartPointImpl value,
    $Res Function(_$ChartPointImpl) then,
  ) = __$$ChartPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, double value});
}

/// @nodoc
class __$$ChartPointImplCopyWithImpl<$Res>
    extends _$ChartPointCopyWithImpl<$Res, _$ChartPointImpl>
    implements _$$ChartPointImplCopyWith<$Res> {
  __$$ChartPointImplCopyWithImpl(
    _$ChartPointImpl _value,
    $Res Function(_$ChartPointImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? label = null, Object? value = null}) {
    return _then(
      _$ChartPointImpl(
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        value: null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChartPointImpl implements _ChartPoint {
  const _$ChartPointImpl({required this.label, required this.value});

  factory _$ChartPointImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChartPointImplFromJson(json);

  @override
  final String label;
  @override
  final double value;

  @override
  String toString() {
    return 'ChartPoint(label: $label, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChartPointImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, label, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChartPointImplCopyWith<_$ChartPointImpl> get copyWith =>
      __$$ChartPointImplCopyWithImpl<_$ChartPointImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChartPointImplToJson(this);
  }
}

abstract class _ChartPoint implements ChartPoint {
  const factory _ChartPoint({
    required final String label,
    required final double value,
  }) = _$ChartPointImpl;

  factory _ChartPoint.fromJson(Map<String, dynamic> json) =
      _$ChartPointImpl.fromJson;

  @override
  String get label;
  @override
  double get value;
  @override
  @JsonKey(ignore: true)
  _$$ChartPointImplCopyWith<_$ChartPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExerciseContribution _$ExerciseContributionFromJson(Map<String, dynamic> json) {
  return _ExerciseContribution.fromJson(json);
}

/// @nodoc
mixin _$ExerciseContribution {
  String get exerciseName => throw _privateConstructorUsedError;
  double get volume => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExerciseContributionCopyWith<ExerciseContribution> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseContributionCopyWith<$Res> {
  factory $ExerciseContributionCopyWith(
    ExerciseContribution value,
    $Res Function(ExerciseContribution) then,
  ) = _$ExerciseContributionCopyWithImpl<$Res, ExerciseContribution>;
  @useResult
  $Res call({String exerciseName, double volume});
}

/// @nodoc
class _$ExerciseContributionCopyWithImpl<
  $Res,
  $Val extends ExerciseContribution
>
    implements $ExerciseContributionCopyWith<$Res> {
  _$ExerciseContributionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? exerciseName = null, Object? volume = null}) {
    return _then(
      _value.copyWith(
            exerciseName: null == exerciseName
                ? _value.exerciseName
                : exerciseName // ignore: cast_nullable_to_non_nullable
                      as String,
            volume: null == volume
                ? _value.volume
                : volume // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ExerciseContributionImplCopyWith<$Res>
    implements $ExerciseContributionCopyWith<$Res> {
  factory _$$ExerciseContributionImplCopyWith(
    _$ExerciseContributionImpl value,
    $Res Function(_$ExerciseContributionImpl) then,
  ) = __$$ExerciseContributionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String exerciseName, double volume});
}

/// @nodoc
class __$$ExerciseContributionImplCopyWithImpl<$Res>
    extends _$ExerciseContributionCopyWithImpl<$Res, _$ExerciseContributionImpl>
    implements _$$ExerciseContributionImplCopyWith<$Res> {
  __$$ExerciseContributionImplCopyWithImpl(
    _$ExerciseContributionImpl _value,
    $Res Function(_$ExerciseContributionImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? exerciseName = null, Object? volume = null}) {
    return _then(
      _$ExerciseContributionImpl(
        exerciseName: null == exerciseName
            ? _value.exerciseName
            : exerciseName // ignore: cast_nullable_to_non_nullable
                  as String,
        volume: null == volume
            ? _value.volume
            : volume // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ExerciseContributionImpl implements _ExerciseContribution {
  const _$ExerciseContributionImpl({
    required this.exerciseName,
    required this.volume,
  });

  factory _$ExerciseContributionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseContributionImplFromJson(json);

  @override
  final String exerciseName;
  @override
  final double volume;

  @override
  String toString() {
    return 'ExerciseContribution(exerciseName: $exerciseName, volume: $volume)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseContributionImpl &&
            (identical(other.exerciseName, exerciseName) ||
                other.exerciseName == exerciseName) &&
            (identical(other.volume, volume) || other.volume == volume));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, exerciseName, volume);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseContributionImplCopyWith<_$ExerciseContributionImpl>
  get copyWith =>
      __$$ExerciseContributionImplCopyWithImpl<_$ExerciseContributionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ExerciseContributionImplToJson(this);
  }
}

abstract class _ExerciseContribution implements ExerciseContribution {
  const factory _ExerciseContribution({
    required final String exerciseName,
    required final double volume,
  }) = _$ExerciseContributionImpl;

  factory _ExerciseContribution.fromJson(Map<String, dynamic> json) =
      _$ExerciseContributionImpl.fromJson;

  @override
  String get exerciseName;
  @override
  double get volume;
  @override
  @JsonKey(ignore: true)
  _$$ExerciseContributionImplCopyWith<_$ExerciseContributionImpl>
  get copyWith => throw _privateConstructorUsedError;
}

MuscleData _$MuscleDataFromJson(Map<String, dynamic> json) {
  return _MuscleData.fromJson(json);
}

/// @nodoc
mixin _$MuscleData {
  String get id =>
      throw _privateConstructorUsedError; // corresponds to flutter_body_atlas IDs
  double get volume => throw _privateConstructorUsedError;
  double get rpe => throw _privateConstructorUsedError;
  MuscleTrainingStatus get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MuscleDataCopyWith<MuscleData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MuscleDataCopyWith<$Res> {
  factory $MuscleDataCopyWith(
    MuscleData value,
    $Res Function(MuscleData) then,
  ) = _$MuscleDataCopyWithImpl<$Res, MuscleData>;
  @useResult
  $Res call({
    String id,
    double volume,
    double rpe,
    MuscleTrainingStatus status,
  });
}

/// @nodoc
class _$MuscleDataCopyWithImpl<$Res, $Val extends MuscleData>
    implements $MuscleDataCopyWith<$Res> {
  _$MuscleDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? volume = null,
    Object? rpe = null,
    Object? status = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            volume: null == volume
                ? _value.volume
                : volume // ignore: cast_nullable_to_non_nullable
                      as double,
            rpe: null == rpe
                ? _value.rpe
                : rpe // ignore: cast_nullable_to_non_nullable
                      as double,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as MuscleTrainingStatus,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MuscleDataImplCopyWith<$Res>
    implements $MuscleDataCopyWith<$Res> {
  factory _$$MuscleDataImplCopyWith(
    _$MuscleDataImpl value,
    $Res Function(_$MuscleDataImpl) then,
  ) = __$$MuscleDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    double volume,
    double rpe,
    MuscleTrainingStatus status,
  });
}

/// @nodoc
class __$$MuscleDataImplCopyWithImpl<$Res>
    extends _$MuscleDataCopyWithImpl<$Res, _$MuscleDataImpl>
    implements _$$MuscleDataImplCopyWith<$Res> {
  __$$MuscleDataImplCopyWithImpl(
    _$MuscleDataImpl _value,
    $Res Function(_$MuscleDataImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? volume = null,
    Object? rpe = null,
    Object? status = null,
  }) {
    return _then(
      _$MuscleDataImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        volume: null == volume
            ? _value.volume
            : volume // ignore: cast_nullable_to_non_nullable
                  as double,
        rpe: null == rpe
            ? _value.rpe
            : rpe // ignore: cast_nullable_to_non_nullable
                  as double,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as MuscleTrainingStatus,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MuscleDataImpl implements _MuscleData {
  const _$MuscleDataImpl({
    required this.id,
    required this.volume,
    required this.rpe,
    this.status = MuscleTrainingStatus.neutral,
  });

  factory _$MuscleDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$MuscleDataImplFromJson(json);

  @override
  final String id;
  // corresponds to flutter_body_atlas IDs
  @override
  final double volume;
  @override
  final double rpe;
  @override
  @JsonKey()
  final MuscleTrainingStatus status;

  @override
  String toString() {
    return 'MuscleData(id: $id, volume: $volume, rpe: $rpe, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MuscleDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.volume, volume) || other.volume == volume) &&
            (identical(other.rpe, rpe) || other.rpe == rpe) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, volume, rpe, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MuscleDataImplCopyWith<_$MuscleDataImpl> get copyWith =>
      __$$MuscleDataImplCopyWithImpl<_$MuscleDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MuscleDataImplToJson(this);
  }
}

abstract class _MuscleData implements MuscleData {
  const factory _MuscleData({
    required final String id,
    required final double volume,
    required final double rpe,
    final MuscleTrainingStatus status,
  }) = _$MuscleDataImpl;

  factory _MuscleData.fromJson(Map<String, dynamic> json) =
      _$MuscleDataImpl.fromJson;

  @override
  String get id;
  @override // corresponds to flutter_body_atlas IDs
  double get volume;
  @override
  double get rpe;
  @override
  MuscleTrainingStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$MuscleDataImplCopyWith<_$MuscleDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MuscleAnalysis _$MuscleAnalysisFromJson(Map<String, dynamic> json) {
  return _MuscleAnalysis.fromJson(json);
}

/// @nodoc
mixin _$MuscleAnalysis {
  String get muscleId => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  MuscleTrainingStatus get status => throw _privateConstructorUsedError;
  double get volume => throw _privateConstructorUsedError;
  double get rpe => throw _privateConstructorUsedError;
  double get trendPercent => throw _privateConstructorUsedError;
  int get fatigueScore => throw _privateConstructorUsedError;
  String get recommendation => throw _privateConstructorUsedError;
  List<ChartPoint> get loadTrend => throw _privateConstructorUsedError;
  List<ExerciseContribution> get exerciseContributions =>
      throw _privateConstructorUsedError;
  List<ChartPoint> get recoveryBalance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MuscleAnalysisCopyWith<MuscleAnalysis> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MuscleAnalysisCopyWith<$Res> {
  factory $MuscleAnalysisCopyWith(
    MuscleAnalysis value,
    $Res Function(MuscleAnalysis) then,
  ) = _$MuscleAnalysisCopyWithImpl<$Res, MuscleAnalysis>;
  @useResult
  $Res call({
    String muscleId,
    String displayName,
    MuscleTrainingStatus status,
    double volume,
    double rpe,
    double trendPercent,
    int fatigueScore,
    String recommendation,
    List<ChartPoint> loadTrend,
    List<ExerciseContribution> exerciseContributions,
    List<ChartPoint> recoveryBalance,
  });
}

/// @nodoc
class _$MuscleAnalysisCopyWithImpl<$Res, $Val extends MuscleAnalysis>
    implements $MuscleAnalysisCopyWith<$Res> {
  _$MuscleAnalysisCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? muscleId = null,
    Object? displayName = null,
    Object? status = null,
    Object? volume = null,
    Object? rpe = null,
    Object? trendPercent = null,
    Object? fatigueScore = null,
    Object? recommendation = null,
    Object? loadTrend = null,
    Object? exerciseContributions = null,
    Object? recoveryBalance = null,
  }) {
    return _then(
      _value.copyWith(
            muscleId: null == muscleId
                ? _value.muscleId
                : muscleId // ignore: cast_nullable_to_non_nullable
                      as String,
            displayName: null == displayName
                ? _value.displayName
                : displayName // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as MuscleTrainingStatus,
            volume: null == volume
                ? _value.volume
                : volume // ignore: cast_nullable_to_non_nullable
                      as double,
            rpe: null == rpe
                ? _value.rpe
                : rpe // ignore: cast_nullable_to_non_nullable
                      as double,
            trendPercent: null == trendPercent
                ? _value.trendPercent
                : trendPercent // ignore: cast_nullable_to_non_nullable
                      as double,
            fatigueScore: null == fatigueScore
                ? _value.fatigueScore
                : fatigueScore // ignore: cast_nullable_to_non_nullable
                      as int,
            recommendation: null == recommendation
                ? _value.recommendation
                : recommendation // ignore: cast_nullable_to_non_nullable
                      as String,
            loadTrend: null == loadTrend
                ? _value.loadTrend
                : loadTrend // ignore: cast_nullable_to_non_nullable
                      as List<ChartPoint>,
            exerciseContributions: null == exerciseContributions
                ? _value.exerciseContributions
                : exerciseContributions // ignore: cast_nullable_to_non_nullable
                      as List<ExerciseContribution>,
            recoveryBalance: null == recoveryBalance
                ? _value.recoveryBalance
                : recoveryBalance // ignore: cast_nullable_to_non_nullable
                      as List<ChartPoint>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MuscleAnalysisImplCopyWith<$Res>
    implements $MuscleAnalysisCopyWith<$Res> {
  factory _$$MuscleAnalysisImplCopyWith(
    _$MuscleAnalysisImpl value,
    $Res Function(_$MuscleAnalysisImpl) then,
  ) = __$$MuscleAnalysisImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String muscleId,
    String displayName,
    MuscleTrainingStatus status,
    double volume,
    double rpe,
    double trendPercent,
    int fatigueScore,
    String recommendation,
    List<ChartPoint> loadTrend,
    List<ExerciseContribution> exerciseContributions,
    List<ChartPoint> recoveryBalance,
  });
}

/// @nodoc
class __$$MuscleAnalysisImplCopyWithImpl<$Res>
    extends _$MuscleAnalysisCopyWithImpl<$Res, _$MuscleAnalysisImpl>
    implements _$$MuscleAnalysisImplCopyWith<$Res> {
  __$$MuscleAnalysisImplCopyWithImpl(
    _$MuscleAnalysisImpl _value,
    $Res Function(_$MuscleAnalysisImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? muscleId = null,
    Object? displayName = null,
    Object? status = null,
    Object? volume = null,
    Object? rpe = null,
    Object? trendPercent = null,
    Object? fatigueScore = null,
    Object? recommendation = null,
    Object? loadTrend = null,
    Object? exerciseContributions = null,
    Object? recoveryBalance = null,
  }) {
    return _then(
      _$MuscleAnalysisImpl(
        muscleId: null == muscleId
            ? _value.muscleId
            : muscleId // ignore: cast_nullable_to_non_nullable
                  as String,
        displayName: null == displayName
            ? _value.displayName
            : displayName // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as MuscleTrainingStatus,
        volume: null == volume
            ? _value.volume
            : volume // ignore: cast_nullable_to_non_nullable
                  as double,
        rpe: null == rpe
            ? _value.rpe
            : rpe // ignore: cast_nullable_to_non_nullable
                  as double,
        trendPercent: null == trendPercent
            ? _value.trendPercent
            : trendPercent // ignore: cast_nullable_to_non_nullable
                  as double,
        fatigueScore: null == fatigueScore
            ? _value.fatigueScore
            : fatigueScore // ignore: cast_nullable_to_non_nullable
                  as int,
        recommendation: null == recommendation
            ? _value.recommendation
            : recommendation // ignore: cast_nullable_to_non_nullable
                  as String,
        loadTrend: null == loadTrend
            ? _value._loadTrend
            : loadTrend // ignore: cast_nullable_to_non_nullable
                  as List<ChartPoint>,
        exerciseContributions: null == exerciseContributions
            ? _value._exerciseContributions
            : exerciseContributions // ignore: cast_nullable_to_non_nullable
                  as List<ExerciseContribution>,
        recoveryBalance: null == recoveryBalance
            ? _value._recoveryBalance
            : recoveryBalance // ignore: cast_nullable_to_non_nullable
                  as List<ChartPoint>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MuscleAnalysisImpl implements _MuscleAnalysis {
  const _$MuscleAnalysisImpl({
    required this.muscleId,
    required this.displayName,
    required this.status,
    required this.volume,
    required this.rpe,
    required this.trendPercent,
    required this.fatigueScore,
    required this.recommendation,
    final List<ChartPoint> loadTrend = const <ChartPoint>[],
    final List<ExerciseContribution> exerciseContributions =
        const <ExerciseContribution>[],
    final List<ChartPoint> recoveryBalance = const <ChartPoint>[],
  }) : _loadTrend = loadTrend,
       _exerciseContributions = exerciseContributions,
       _recoveryBalance = recoveryBalance;

  factory _$MuscleAnalysisImpl.fromJson(Map<String, dynamic> json) =>
      _$$MuscleAnalysisImplFromJson(json);

  @override
  final String muscleId;
  @override
  final String displayName;
  @override
  final MuscleTrainingStatus status;
  @override
  final double volume;
  @override
  final double rpe;
  @override
  final double trendPercent;
  @override
  final int fatigueScore;
  @override
  final String recommendation;
  final List<ChartPoint> _loadTrend;
  @override
  @JsonKey()
  List<ChartPoint> get loadTrend {
    if (_loadTrend is EqualUnmodifiableListView) return _loadTrend;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_loadTrend);
  }

  final List<ExerciseContribution> _exerciseContributions;
  @override
  @JsonKey()
  List<ExerciseContribution> get exerciseContributions {
    if (_exerciseContributions is EqualUnmodifiableListView)
      return _exerciseContributions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exerciseContributions);
  }

  final List<ChartPoint> _recoveryBalance;
  @override
  @JsonKey()
  List<ChartPoint> get recoveryBalance {
    if (_recoveryBalance is EqualUnmodifiableListView) return _recoveryBalance;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recoveryBalance);
  }

  @override
  String toString() {
    return 'MuscleAnalysis(muscleId: $muscleId, displayName: $displayName, status: $status, volume: $volume, rpe: $rpe, trendPercent: $trendPercent, fatigueScore: $fatigueScore, recommendation: $recommendation, loadTrend: $loadTrend, exerciseContributions: $exerciseContributions, recoveryBalance: $recoveryBalance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MuscleAnalysisImpl &&
            (identical(other.muscleId, muscleId) ||
                other.muscleId == muscleId) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.volume, volume) || other.volume == volume) &&
            (identical(other.rpe, rpe) || other.rpe == rpe) &&
            (identical(other.trendPercent, trendPercent) ||
                other.trendPercent == trendPercent) &&
            (identical(other.fatigueScore, fatigueScore) ||
                other.fatigueScore == fatigueScore) &&
            (identical(other.recommendation, recommendation) ||
                other.recommendation == recommendation) &&
            const DeepCollectionEquality().equals(
              other._loadTrend,
              _loadTrend,
            ) &&
            const DeepCollectionEquality().equals(
              other._exerciseContributions,
              _exerciseContributions,
            ) &&
            const DeepCollectionEquality().equals(
              other._recoveryBalance,
              _recoveryBalance,
            ));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    muscleId,
    displayName,
    status,
    volume,
    rpe,
    trendPercent,
    fatigueScore,
    recommendation,
    const DeepCollectionEquality().hash(_loadTrend),
    const DeepCollectionEquality().hash(_exerciseContributions),
    const DeepCollectionEquality().hash(_recoveryBalance),
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MuscleAnalysisImplCopyWith<_$MuscleAnalysisImpl> get copyWith =>
      __$$MuscleAnalysisImplCopyWithImpl<_$MuscleAnalysisImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MuscleAnalysisImplToJson(this);
  }
}

abstract class _MuscleAnalysis implements MuscleAnalysis {
  const factory _MuscleAnalysis({
    required final String muscleId,
    required final String displayName,
    required final MuscleTrainingStatus status,
    required final double volume,
    required final double rpe,
    required final double trendPercent,
    required final int fatigueScore,
    required final String recommendation,
    final List<ChartPoint> loadTrend,
    final List<ExerciseContribution> exerciseContributions,
    final List<ChartPoint> recoveryBalance,
  }) = _$MuscleAnalysisImpl;

  factory _MuscleAnalysis.fromJson(Map<String, dynamic> json) =
      _$MuscleAnalysisImpl.fromJson;

  @override
  String get muscleId;
  @override
  String get displayName;
  @override
  MuscleTrainingStatus get status;
  @override
  double get volume;
  @override
  double get rpe;
  @override
  double get trendPercent;
  @override
  int get fatigueScore;
  @override
  String get recommendation;
  @override
  List<ChartPoint> get loadTrend;
  @override
  List<ExerciseContribution> get exerciseContributions;
  @override
  List<ChartPoint> get recoveryBalance;
  @override
  @JsonKey(ignore: true)
  _$$MuscleAnalysisImplCopyWith<_$MuscleAnalysisImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InsightMessage _$InsightMessageFromJson(Map<String, dynamic> json) {
  return _InsightMessage.fromJson(json);
}

/// @nodoc
mixin _$InsightMessage {
  String get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  bool get isUser => throw _privateConstructorUsedError;
  bool get hasChart => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InsightMessageCopyWith<InsightMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InsightMessageCopyWith<$Res> {
  factory $InsightMessageCopyWith(
    InsightMessage value,
    $Res Function(InsightMessage) then,
  ) = _$InsightMessageCopyWithImpl<$Res, InsightMessage>;
  @useResult
  $Res call({String id, String content, bool isUser, bool hasChart});
}

/// @nodoc
class _$InsightMessageCopyWithImpl<$Res, $Val extends InsightMessage>
    implements $InsightMessageCopyWith<$Res> {
  _$InsightMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? isUser = null,
    Object? hasChart = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            isUser: null == isUser
                ? _value.isUser
                : isUser // ignore: cast_nullable_to_non_nullable
                      as bool,
            hasChart: null == hasChart
                ? _value.hasChart
                : hasChart // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InsightMessageImplCopyWith<$Res>
    implements $InsightMessageCopyWith<$Res> {
  factory _$$InsightMessageImplCopyWith(
    _$InsightMessageImpl value,
    $Res Function(_$InsightMessageImpl) then,
  ) = __$$InsightMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String content, bool isUser, bool hasChart});
}

/// @nodoc
class __$$InsightMessageImplCopyWithImpl<$Res>
    extends _$InsightMessageCopyWithImpl<$Res, _$InsightMessageImpl>
    implements _$$InsightMessageImplCopyWith<$Res> {
  __$$InsightMessageImplCopyWithImpl(
    _$InsightMessageImpl _value,
    $Res Function(_$InsightMessageImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? isUser = null,
    Object? hasChart = null,
  }) {
    return _then(
      _$InsightMessageImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        isUser: null == isUser
            ? _value.isUser
            : isUser // ignore: cast_nullable_to_non_nullable
                  as bool,
        hasChart: null == hasChart
            ? _value.hasChart
            : hasChart // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$InsightMessageImpl implements _InsightMessage {
  const _$InsightMessageImpl({
    required this.id,
    required this.content,
    required this.isUser,
    this.hasChart = false,
  });

  factory _$InsightMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$InsightMessageImplFromJson(json);

  @override
  final String id;
  @override
  final String content;
  @override
  final bool isUser;
  @override
  @JsonKey()
  final bool hasChart;

  @override
  String toString() {
    return 'InsightMessage(id: $id, content: $content, isUser: $isUser, hasChart: $hasChart)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InsightMessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.isUser, isUser) || other.isUser == isUser) &&
            (identical(other.hasChart, hasChart) ||
                other.hasChart == hasChart));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, content, isUser, hasChart);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InsightMessageImplCopyWith<_$InsightMessageImpl> get copyWith =>
      __$$InsightMessageImplCopyWithImpl<_$InsightMessageImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$InsightMessageImplToJson(this);
  }
}

abstract class _InsightMessage implements InsightMessage {
  const factory _InsightMessage({
    required final String id,
    required final String content,
    required final bool isUser,
    final bool hasChart,
  }) = _$InsightMessageImpl;

  factory _InsightMessage.fromJson(Map<String, dynamic> json) =
      _$InsightMessageImpl.fromJson;

  @override
  String get id;
  @override
  String get content;
  @override
  bool get isUser;
  @override
  bool get hasChart;
  @override
  @JsonKey(ignore: true)
  _$$InsightMessageImplCopyWith<_$InsightMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
