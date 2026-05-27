// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'training_statistics_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TrainingStatisticsPoint {
  String get label => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TrainingStatisticsPointCopyWith<TrainingStatisticsPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrainingStatisticsPointCopyWith<$Res> {
  factory $TrainingStatisticsPointCopyWith(
    TrainingStatisticsPoint value,
    $Res Function(TrainingStatisticsPoint) then,
  ) = _$TrainingStatisticsPointCopyWithImpl<$Res, TrainingStatisticsPoint>;
  @useResult
  $Res call({String label, double value});
}

/// @nodoc
class _$TrainingStatisticsPointCopyWithImpl<
  $Res,
  $Val extends TrainingStatisticsPoint
>
    implements $TrainingStatisticsPointCopyWith<$Res> {
  _$TrainingStatisticsPointCopyWithImpl(this._value, this._then);

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
abstract class _$$TrainingStatisticsPointImplCopyWith<$Res>
    implements $TrainingStatisticsPointCopyWith<$Res> {
  factory _$$TrainingStatisticsPointImplCopyWith(
    _$TrainingStatisticsPointImpl value,
    $Res Function(_$TrainingStatisticsPointImpl) then,
  ) = __$$TrainingStatisticsPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, double value});
}

/// @nodoc
class __$$TrainingStatisticsPointImplCopyWithImpl<$Res>
    extends
        _$TrainingStatisticsPointCopyWithImpl<
          $Res,
          _$TrainingStatisticsPointImpl
        >
    implements _$$TrainingStatisticsPointImplCopyWith<$Res> {
  __$$TrainingStatisticsPointImplCopyWithImpl(
    _$TrainingStatisticsPointImpl _value,
    $Res Function(_$TrainingStatisticsPointImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? label = null, Object? value = null}) {
    return _then(
      _$TrainingStatisticsPointImpl(
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

class _$TrainingStatisticsPointImpl implements _TrainingStatisticsPoint {
  const _$TrainingStatisticsPointImpl({
    required this.label,
    required this.value,
  });

  @override
  final String label;
  @override
  final double value;

  @override
  String toString() {
    return 'TrainingStatisticsPoint(label: $label, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrainingStatisticsPointImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, label, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrainingStatisticsPointImplCopyWith<_$TrainingStatisticsPointImpl>
  get copyWith =>
      __$$TrainingStatisticsPointImplCopyWithImpl<
        _$TrainingStatisticsPointImpl
      >(this, _$identity);
}

abstract class _TrainingStatisticsPoint implements TrainingStatisticsPoint {
  const factory _TrainingStatisticsPoint({
    required final String label,
    required final double value,
  }) = _$TrainingStatisticsPointImpl;

  @override
  String get label;
  @override
  double get value;
  @override
  @JsonKey(ignore: true)
  _$$TrainingStatisticsPointImplCopyWith<_$TrainingStatisticsPointImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TrainingStatisticsSegment {
  String get label => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  double get ratio => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TrainingStatisticsSegmentCopyWith<TrainingStatisticsSegment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrainingStatisticsSegmentCopyWith<$Res> {
  factory $TrainingStatisticsSegmentCopyWith(
    TrainingStatisticsSegment value,
    $Res Function(TrainingStatisticsSegment) then,
  ) = _$TrainingStatisticsSegmentCopyWithImpl<$Res, TrainingStatisticsSegment>;
  @useResult
  $Res call({String label, int count, double ratio});
}

/// @nodoc
class _$TrainingStatisticsSegmentCopyWithImpl<
  $Res,
  $Val extends TrainingStatisticsSegment
>
    implements $TrainingStatisticsSegmentCopyWith<$Res> {
  _$TrainingStatisticsSegmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? count = null,
    Object? ratio = null,
  }) {
    return _then(
      _value.copyWith(
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
            count: null == count
                ? _value.count
                : count // ignore: cast_nullable_to_non_nullable
                      as int,
            ratio: null == ratio
                ? _value.ratio
                : ratio // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TrainingStatisticsSegmentImplCopyWith<$Res>
    implements $TrainingStatisticsSegmentCopyWith<$Res> {
  factory _$$TrainingStatisticsSegmentImplCopyWith(
    _$TrainingStatisticsSegmentImpl value,
    $Res Function(_$TrainingStatisticsSegmentImpl) then,
  ) = __$$TrainingStatisticsSegmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, int count, double ratio});
}

/// @nodoc
class __$$TrainingStatisticsSegmentImplCopyWithImpl<$Res>
    extends
        _$TrainingStatisticsSegmentCopyWithImpl<
          $Res,
          _$TrainingStatisticsSegmentImpl
        >
    implements _$$TrainingStatisticsSegmentImplCopyWith<$Res> {
  __$$TrainingStatisticsSegmentImplCopyWithImpl(
    _$TrainingStatisticsSegmentImpl _value,
    $Res Function(_$TrainingStatisticsSegmentImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? count = null,
    Object? ratio = null,
  }) {
    return _then(
      _$TrainingStatisticsSegmentImpl(
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        count: null == count
            ? _value.count
            : count // ignore: cast_nullable_to_non_nullable
                  as int,
        ratio: null == ratio
            ? _value.ratio
            : ratio // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$TrainingStatisticsSegmentImpl implements _TrainingStatisticsSegment {
  const _$TrainingStatisticsSegmentImpl({
    required this.label,
    required this.count,
    required this.ratio,
  });

  @override
  final String label;
  @override
  final int count;
  @override
  final double ratio;

  @override
  String toString() {
    return 'TrainingStatisticsSegment(label: $label, count: $count, ratio: $ratio)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrainingStatisticsSegmentImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.ratio, ratio) || other.ratio == ratio));
  }

  @override
  int get hashCode => Object.hash(runtimeType, label, count, ratio);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrainingStatisticsSegmentImplCopyWith<_$TrainingStatisticsSegmentImpl>
  get copyWith =>
      __$$TrainingStatisticsSegmentImplCopyWithImpl<
        _$TrainingStatisticsSegmentImpl
      >(this, _$identity);
}

abstract class _TrainingStatisticsSegment implements TrainingStatisticsSegment {
  const factory _TrainingStatisticsSegment({
    required final String label,
    required final int count,
    required final double ratio,
  }) = _$TrainingStatisticsSegmentImpl;

  @override
  String get label;
  @override
  int get count;
  @override
  double get ratio;
  @override
  @JsonKey(ignore: true)
  _$$TrainingStatisticsSegmentImplCopyWith<_$TrainingStatisticsSegmentImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TrainingExerciseSpotlight {
  String get name => throw _privateConstructorUsedError;
  int get workoutCount => throw _privateConstructorUsedError;
  int get setCount => throw _privateConstructorUsedError;
  int get totalReps => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TrainingExerciseSpotlightCopyWith<TrainingExerciseSpotlight> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrainingExerciseSpotlightCopyWith<$Res> {
  factory $TrainingExerciseSpotlightCopyWith(
    TrainingExerciseSpotlight value,
    $Res Function(TrainingExerciseSpotlight) then,
  ) = _$TrainingExerciseSpotlightCopyWithImpl<$Res, TrainingExerciseSpotlight>;
  @useResult
  $Res call({String name, int workoutCount, int setCount, int totalReps});
}

/// @nodoc
class _$TrainingExerciseSpotlightCopyWithImpl<
  $Res,
  $Val extends TrainingExerciseSpotlight
>
    implements $TrainingExerciseSpotlightCopyWith<$Res> {
  _$TrainingExerciseSpotlightCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? workoutCount = null,
    Object? setCount = null,
    Object? totalReps = null,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            workoutCount: null == workoutCount
                ? _value.workoutCount
                : workoutCount // ignore: cast_nullable_to_non_nullable
                      as int,
            setCount: null == setCount
                ? _value.setCount
                : setCount // ignore: cast_nullable_to_non_nullable
                      as int,
            totalReps: null == totalReps
                ? _value.totalReps
                : totalReps // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TrainingExerciseSpotlightImplCopyWith<$Res>
    implements $TrainingExerciseSpotlightCopyWith<$Res> {
  factory _$$TrainingExerciseSpotlightImplCopyWith(
    _$TrainingExerciseSpotlightImpl value,
    $Res Function(_$TrainingExerciseSpotlightImpl) then,
  ) = __$$TrainingExerciseSpotlightImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int workoutCount, int setCount, int totalReps});
}

/// @nodoc
class __$$TrainingExerciseSpotlightImplCopyWithImpl<$Res>
    extends
        _$TrainingExerciseSpotlightCopyWithImpl<
          $Res,
          _$TrainingExerciseSpotlightImpl
        >
    implements _$$TrainingExerciseSpotlightImplCopyWith<$Res> {
  __$$TrainingExerciseSpotlightImplCopyWithImpl(
    _$TrainingExerciseSpotlightImpl _value,
    $Res Function(_$TrainingExerciseSpotlightImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? workoutCount = null,
    Object? setCount = null,
    Object? totalReps = null,
  }) {
    return _then(
      _$TrainingExerciseSpotlightImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        workoutCount: null == workoutCount
            ? _value.workoutCount
            : workoutCount // ignore: cast_nullable_to_non_nullable
                  as int,
        setCount: null == setCount
            ? _value.setCount
            : setCount // ignore: cast_nullable_to_non_nullable
                  as int,
        totalReps: null == totalReps
            ? _value.totalReps
            : totalReps // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$TrainingExerciseSpotlightImpl implements _TrainingExerciseSpotlight {
  const _$TrainingExerciseSpotlightImpl({
    required this.name,
    required this.workoutCount,
    required this.setCount,
    required this.totalReps,
  });

  @override
  final String name;
  @override
  final int workoutCount;
  @override
  final int setCount;
  @override
  final int totalReps;

  @override
  String toString() {
    return 'TrainingExerciseSpotlight(name: $name, workoutCount: $workoutCount, setCount: $setCount, totalReps: $totalReps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrainingExerciseSpotlightImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.workoutCount, workoutCount) ||
                other.workoutCount == workoutCount) &&
            (identical(other.setCount, setCount) ||
                other.setCount == setCount) &&
            (identical(other.totalReps, totalReps) ||
                other.totalReps == totalReps));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, workoutCount, setCount, totalReps);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrainingExerciseSpotlightImplCopyWith<_$TrainingExerciseSpotlightImpl>
  get copyWith =>
      __$$TrainingExerciseSpotlightImplCopyWithImpl<
        _$TrainingExerciseSpotlightImpl
      >(this, _$identity);
}

abstract class _TrainingExerciseSpotlight implements TrainingExerciseSpotlight {
  const factory _TrainingExerciseSpotlight({
    required final String name,
    required final int workoutCount,
    required final int setCount,
    required final int totalReps,
  }) = _$TrainingExerciseSpotlightImpl;

  @override
  String get name;
  @override
  int get workoutCount;
  @override
  int get setCount;
  @override
  int get totalReps;
  @override
  @JsonKey(ignore: true)
  _$$TrainingExerciseSpotlightImplCopyWith<_$TrainingExerciseSpotlightImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TrainingStatisticsData {
  int get trackedWorkouts => throw _privateConstructorUsedError;
  int get completedWorkouts => throw _privateConstructorUsedError;
  int get plannedMinutes => throw _privateConstructorUsedError;
  int get averageSessionMinutes => throw _privateConstructorUsedError;
  int get totalSetBlocks => throw _privateConstructorUsedError;
  double get completionRate => throw _privateConstructorUsedError;
  String get focusGoalLabel => throw _privateConstructorUsedError;
  String get busiestDayLabel => throw _privateConstructorUsedError;
  String get insightText => throw _privateConstructorUsedError;
  List<TrainingStatisticsPoint> get weeklyLoad =>
      throw _privateConstructorUsedError;
  List<TrainingStatisticsSegment> get statusSegments =>
      throw _privateConstructorUsedError;
  List<TrainingStatisticsSegment> get goalSegments =>
      throw _privateConstructorUsedError;
  List<TrainingExerciseSpotlight> get topExercises =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TrainingStatisticsDataCopyWith<TrainingStatisticsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrainingStatisticsDataCopyWith<$Res> {
  factory $TrainingStatisticsDataCopyWith(
    TrainingStatisticsData value,
    $Res Function(TrainingStatisticsData) then,
  ) = _$TrainingStatisticsDataCopyWithImpl<$Res, TrainingStatisticsData>;
  @useResult
  $Res call({
    int trackedWorkouts,
    int completedWorkouts,
    int plannedMinutes,
    int averageSessionMinutes,
    int totalSetBlocks,
    double completionRate,
    String focusGoalLabel,
    String busiestDayLabel,
    String insightText,
    List<TrainingStatisticsPoint> weeklyLoad,
    List<TrainingStatisticsSegment> statusSegments,
    List<TrainingStatisticsSegment> goalSegments,
    List<TrainingExerciseSpotlight> topExercises,
  });
}

/// @nodoc
class _$TrainingStatisticsDataCopyWithImpl<
  $Res,
  $Val extends TrainingStatisticsData
>
    implements $TrainingStatisticsDataCopyWith<$Res> {
  _$TrainingStatisticsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trackedWorkouts = null,
    Object? completedWorkouts = null,
    Object? plannedMinutes = null,
    Object? averageSessionMinutes = null,
    Object? totalSetBlocks = null,
    Object? completionRate = null,
    Object? focusGoalLabel = null,
    Object? busiestDayLabel = null,
    Object? insightText = null,
    Object? weeklyLoad = null,
    Object? statusSegments = null,
    Object? goalSegments = null,
    Object? topExercises = null,
  }) {
    return _then(
      _value.copyWith(
            trackedWorkouts: null == trackedWorkouts
                ? _value.trackedWorkouts
                : trackedWorkouts // ignore: cast_nullable_to_non_nullable
                      as int,
            completedWorkouts: null == completedWorkouts
                ? _value.completedWorkouts
                : completedWorkouts // ignore: cast_nullable_to_non_nullable
                      as int,
            plannedMinutes: null == plannedMinutes
                ? _value.plannedMinutes
                : plannedMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            averageSessionMinutes: null == averageSessionMinutes
                ? _value.averageSessionMinutes
                : averageSessionMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            totalSetBlocks: null == totalSetBlocks
                ? _value.totalSetBlocks
                : totalSetBlocks // ignore: cast_nullable_to_non_nullable
                      as int,
            completionRate: null == completionRate
                ? _value.completionRate
                : completionRate // ignore: cast_nullable_to_non_nullable
                      as double,
            focusGoalLabel: null == focusGoalLabel
                ? _value.focusGoalLabel
                : focusGoalLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            busiestDayLabel: null == busiestDayLabel
                ? _value.busiestDayLabel
                : busiestDayLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            insightText: null == insightText
                ? _value.insightText
                : insightText // ignore: cast_nullable_to_non_nullable
                      as String,
            weeklyLoad: null == weeklyLoad
                ? _value.weeklyLoad
                : weeklyLoad // ignore: cast_nullable_to_non_nullable
                      as List<TrainingStatisticsPoint>,
            statusSegments: null == statusSegments
                ? _value.statusSegments
                : statusSegments // ignore: cast_nullable_to_non_nullable
                      as List<TrainingStatisticsSegment>,
            goalSegments: null == goalSegments
                ? _value.goalSegments
                : goalSegments // ignore: cast_nullable_to_non_nullable
                      as List<TrainingStatisticsSegment>,
            topExercises: null == topExercises
                ? _value.topExercises
                : topExercises // ignore: cast_nullable_to_non_nullable
                      as List<TrainingExerciseSpotlight>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TrainingStatisticsDataImplCopyWith<$Res>
    implements $TrainingStatisticsDataCopyWith<$Res> {
  factory _$$TrainingStatisticsDataImplCopyWith(
    _$TrainingStatisticsDataImpl value,
    $Res Function(_$TrainingStatisticsDataImpl) then,
  ) = __$$TrainingStatisticsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int trackedWorkouts,
    int completedWorkouts,
    int plannedMinutes,
    int averageSessionMinutes,
    int totalSetBlocks,
    double completionRate,
    String focusGoalLabel,
    String busiestDayLabel,
    String insightText,
    List<TrainingStatisticsPoint> weeklyLoad,
    List<TrainingStatisticsSegment> statusSegments,
    List<TrainingStatisticsSegment> goalSegments,
    List<TrainingExerciseSpotlight> topExercises,
  });
}

/// @nodoc
class __$$TrainingStatisticsDataImplCopyWithImpl<$Res>
    extends
        _$TrainingStatisticsDataCopyWithImpl<$Res, _$TrainingStatisticsDataImpl>
    implements _$$TrainingStatisticsDataImplCopyWith<$Res> {
  __$$TrainingStatisticsDataImplCopyWithImpl(
    _$TrainingStatisticsDataImpl _value,
    $Res Function(_$TrainingStatisticsDataImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trackedWorkouts = null,
    Object? completedWorkouts = null,
    Object? plannedMinutes = null,
    Object? averageSessionMinutes = null,
    Object? totalSetBlocks = null,
    Object? completionRate = null,
    Object? focusGoalLabel = null,
    Object? busiestDayLabel = null,
    Object? insightText = null,
    Object? weeklyLoad = null,
    Object? statusSegments = null,
    Object? goalSegments = null,
    Object? topExercises = null,
  }) {
    return _then(
      _$TrainingStatisticsDataImpl(
        trackedWorkouts: null == trackedWorkouts
            ? _value.trackedWorkouts
            : trackedWorkouts // ignore: cast_nullable_to_non_nullable
                  as int,
        completedWorkouts: null == completedWorkouts
            ? _value.completedWorkouts
            : completedWorkouts // ignore: cast_nullable_to_non_nullable
                  as int,
        plannedMinutes: null == plannedMinutes
            ? _value.plannedMinutes
            : plannedMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        averageSessionMinutes: null == averageSessionMinutes
            ? _value.averageSessionMinutes
            : averageSessionMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        totalSetBlocks: null == totalSetBlocks
            ? _value.totalSetBlocks
            : totalSetBlocks // ignore: cast_nullable_to_non_nullable
                  as int,
        completionRate: null == completionRate
            ? _value.completionRate
            : completionRate // ignore: cast_nullable_to_non_nullable
                  as double,
        focusGoalLabel: null == focusGoalLabel
            ? _value.focusGoalLabel
            : focusGoalLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        busiestDayLabel: null == busiestDayLabel
            ? _value.busiestDayLabel
            : busiestDayLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        insightText: null == insightText
            ? _value.insightText
            : insightText // ignore: cast_nullable_to_non_nullable
                  as String,
        weeklyLoad: null == weeklyLoad
            ? _value._weeklyLoad
            : weeklyLoad // ignore: cast_nullable_to_non_nullable
                  as List<TrainingStatisticsPoint>,
        statusSegments: null == statusSegments
            ? _value._statusSegments
            : statusSegments // ignore: cast_nullable_to_non_nullable
                  as List<TrainingStatisticsSegment>,
        goalSegments: null == goalSegments
            ? _value._goalSegments
            : goalSegments // ignore: cast_nullable_to_non_nullable
                  as List<TrainingStatisticsSegment>,
        topExercises: null == topExercises
            ? _value._topExercises
            : topExercises // ignore: cast_nullable_to_non_nullable
                  as List<TrainingExerciseSpotlight>,
      ),
    );
  }
}

/// @nodoc

class _$TrainingStatisticsDataImpl implements _TrainingStatisticsData {
  const _$TrainingStatisticsDataImpl({
    required this.trackedWorkouts,
    required this.completedWorkouts,
    required this.plannedMinutes,
    required this.averageSessionMinutes,
    required this.totalSetBlocks,
    required this.completionRate,
    required this.focusGoalLabel,
    required this.busiestDayLabel,
    required this.insightText,
    final List<TrainingStatisticsPoint> weeklyLoad =
        const <TrainingStatisticsPoint>[],
    final List<TrainingStatisticsSegment> statusSegments =
        const <TrainingStatisticsSegment>[],
    final List<TrainingStatisticsSegment> goalSegments =
        const <TrainingStatisticsSegment>[],
    final List<TrainingExerciseSpotlight> topExercises =
        const <TrainingExerciseSpotlight>[],
  }) : _weeklyLoad = weeklyLoad,
       _statusSegments = statusSegments,
       _goalSegments = goalSegments,
       _topExercises = topExercises;

  @override
  final int trackedWorkouts;
  @override
  final int completedWorkouts;
  @override
  final int plannedMinutes;
  @override
  final int averageSessionMinutes;
  @override
  final int totalSetBlocks;
  @override
  final double completionRate;
  @override
  final String focusGoalLabel;
  @override
  final String busiestDayLabel;
  @override
  final String insightText;
  final List<TrainingStatisticsPoint> _weeklyLoad;
  @override
  @JsonKey()
  List<TrainingStatisticsPoint> get weeklyLoad {
    if (_weeklyLoad is EqualUnmodifiableListView) return _weeklyLoad;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weeklyLoad);
  }

  final List<TrainingStatisticsSegment> _statusSegments;
  @override
  @JsonKey()
  List<TrainingStatisticsSegment> get statusSegments {
    if (_statusSegments is EqualUnmodifiableListView) return _statusSegments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_statusSegments);
  }

  final List<TrainingStatisticsSegment> _goalSegments;
  @override
  @JsonKey()
  List<TrainingStatisticsSegment> get goalSegments {
    if (_goalSegments is EqualUnmodifiableListView) return _goalSegments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_goalSegments);
  }

  final List<TrainingExerciseSpotlight> _topExercises;
  @override
  @JsonKey()
  List<TrainingExerciseSpotlight> get topExercises {
    if (_topExercises is EqualUnmodifiableListView) return _topExercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topExercises);
  }

  @override
  String toString() {
    return 'TrainingStatisticsData(trackedWorkouts: $trackedWorkouts, completedWorkouts: $completedWorkouts, plannedMinutes: $plannedMinutes, averageSessionMinutes: $averageSessionMinutes, totalSetBlocks: $totalSetBlocks, completionRate: $completionRate, focusGoalLabel: $focusGoalLabel, busiestDayLabel: $busiestDayLabel, insightText: $insightText, weeklyLoad: $weeklyLoad, statusSegments: $statusSegments, goalSegments: $goalSegments, topExercises: $topExercises)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrainingStatisticsDataImpl &&
            (identical(other.trackedWorkouts, trackedWorkouts) ||
                other.trackedWorkouts == trackedWorkouts) &&
            (identical(other.completedWorkouts, completedWorkouts) ||
                other.completedWorkouts == completedWorkouts) &&
            (identical(other.plannedMinutes, plannedMinutes) ||
                other.plannedMinutes == plannedMinutes) &&
            (identical(other.averageSessionMinutes, averageSessionMinutes) ||
                other.averageSessionMinutes == averageSessionMinutes) &&
            (identical(other.totalSetBlocks, totalSetBlocks) ||
                other.totalSetBlocks == totalSetBlocks) &&
            (identical(other.completionRate, completionRate) ||
                other.completionRate == completionRate) &&
            (identical(other.focusGoalLabel, focusGoalLabel) ||
                other.focusGoalLabel == focusGoalLabel) &&
            (identical(other.busiestDayLabel, busiestDayLabel) ||
                other.busiestDayLabel == busiestDayLabel) &&
            (identical(other.insightText, insightText) ||
                other.insightText == insightText) &&
            const DeepCollectionEquality().equals(
              other._weeklyLoad,
              _weeklyLoad,
            ) &&
            const DeepCollectionEquality().equals(
              other._statusSegments,
              _statusSegments,
            ) &&
            const DeepCollectionEquality().equals(
              other._goalSegments,
              _goalSegments,
            ) &&
            const DeepCollectionEquality().equals(
              other._topExercises,
              _topExercises,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    trackedWorkouts,
    completedWorkouts,
    plannedMinutes,
    averageSessionMinutes,
    totalSetBlocks,
    completionRate,
    focusGoalLabel,
    busiestDayLabel,
    insightText,
    const DeepCollectionEquality().hash(_weeklyLoad),
    const DeepCollectionEquality().hash(_statusSegments),
    const DeepCollectionEquality().hash(_goalSegments),
    const DeepCollectionEquality().hash(_topExercises),
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrainingStatisticsDataImplCopyWith<_$TrainingStatisticsDataImpl>
  get copyWith =>
      __$$TrainingStatisticsDataImplCopyWithImpl<_$TrainingStatisticsDataImpl>(
        this,
        _$identity,
      );
}

abstract class _TrainingStatisticsData implements TrainingStatisticsData {
  const factory _TrainingStatisticsData({
    required final int trackedWorkouts,
    required final int completedWorkouts,
    required final int plannedMinutes,
    required final int averageSessionMinutes,
    required final int totalSetBlocks,
    required final double completionRate,
    required final String focusGoalLabel,
    required final String busiestDayLabel,
    required final String insightText,
    final List<TrainingStatisticsPoint> weeklyLoad,
    final List<TrainingStatisticsSegment> statusSegments,
    final List<TrainingStatisticsSegment> goalSegments,
    final List<TrainingExerciseSpotlight> topExercises,
  }) = _$TrainingStatisticsDataImpl;

  @override
  int get trackedWorkouts;
  @override
  int get completedWorkouts;
  @override
  int get plannedMinutes;
  @override
  int get averageSessionMinutes;
  @override
  int get totalSetBlocks;
  @override
  double get completionRate;
  @override
  String get focusGoalLabel;
  @override
  String get busiestDayLabel;
  @override
  String get insightText;
  @override
  List<TrainingStatisticsPoint> get weeklyLoad;
  @override
  List<TrainingStatisticsSegment> get statusSegments;
  @override
  List<TrainingStatisticsSegment> get goalSegments;
  @override
  List<TrainingExerciseSpotlight> get topExercises;
  @override
  @JsonKey(ignore: true)
  _$$TrainingStatisticsDataImplCopyWith<_$TrainingStatisticsDataImpl>
  get copyWith => throw _privateConstructorUsedError;
}
