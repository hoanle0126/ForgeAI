// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'insight_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InsightSummary _$InsightSummaryFromJson(Map<String, dynamic> json) {
  return _InsightSummary.fromJson(json);
}

/// @nodoc
mixin _$InsightSummary {
  double get totalVolume => throw _privateConstructorUsedError;
  int get workoutsThisWeek => throw _privateConstructorUsedError;
  double get caloriesBurned => throw _privateConstructorUsedError;
  List<MuscleStatus> get muscleStatuses => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InsightSummaryCopyWith<InsightSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InsightSummaryCopyWith<$Res> {
  factory $InsightSummaryCopyWith(
          InsightSummary value, $Res Function(InsightSummary) then) =
      _$InsightSummaryCopyWithImpl<$Res, InsightSummary>;
  @useResult
  $Res call(
      {double totalVolume,
      int workoutsThisWeek,
      double caloriesBurned,
      List<MuscleStatus> muscleStatuses});
}

/// @nodoc
class _$InsightSummaryCopyWithImpl<$Res, $Val extends InsightSummary>
    implements $InsightSummaryCopyWith<$Res> {
  _$InsightSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalVolume = null,
    Object? workoutsThisWeek = null,
    Object? caloriesBurned = null,
    Object? muscleStatuses = null,
  }) {
    return _then(_value.copyWith(
      totalVolume: null == totalVolume
          ? _value.totalVolume
          : totalVolume // ignore: cast_nullable_to_non_nullable
              as double,
      workoutsThisWeek: null == workoutsThisWeek
          ? _value.workoutsThisWeek
          : workoutsThisWeek // ignore: cast_nullable_to_non_nullable
              as int,
      caloriesBurned: null == caloriesBurned
          ? _value.caloriesBurned
          : caloriesBurned // ignore: cast_nullable_to_non_nullable
              as double,
      muscleStatuses: null == muscleStatuses
          ? _value.muscleStatuses
          : muscleStatuses // ignore: cast_nullable_to_non_nullable
              as List<MuscleStatus>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InsightSummaryImplCopyWith<$Res>
    implements $InsightSummaryCopyWith<$Res> {
  factory _$$InsightSummaryImplCopyWith(_$InsightSummaryImpl value,
          $Res Function(_$InsightSummaryImpl) then) =
      __$$InsightSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double totalVolume,
      int workoutsThisWeek,
      double caloriesBurned,
      List<MuscleStatus> muscleStatuses});
}

/// @nodoc
class __$$InsightSummaryImplCopyWithImpl<$Res>
    extends _$InsightSummaryCopyWithImpl<$Res, _$InsightSummaryImpl>
    implements _$$InsightSummaryImplCopyWith<$Res> {
  __$$InsightSummaryImplCopyWithImpl(
      _$InsightSummaryImpl _value, $Res Function(_$InsightSummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalVolume = null,
    Object? workoutsThisWeek = null,
    Object? caloriesBurned = null,
    Object? muscleStatuses = null,
  }) {
    return _then(_$InsightSummaryImpl(
      totalVolume: null == totalVolume
          ? _value.totalVolume
          : totalVolume // ignore: cast_nullable_to_non_nullable
              as double,
      workoutsThisWeek: null == workoutsThisWeek
          ? _value.workoutsThisWeek
          : workoutsThisWeek // ignore: cast_nullable_to_non_nullable
              as int,
      caloriesBurned: null == caloriesBurned
          ? _value.caloriesBurned
          : caloriesBurned // ignore: cast_nullable_to_non_nullable
              as double,
      muscleStatuses: null == muscleStatuses
          ? _value._muscleStatuses
          : muscleStatuses // ignore: cast_nullable_to_non_nullable
              as List<MuscleStatus>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InsightSummaryImpl implements _InsightSummary {
  const _$InsightSummaryImpl(
      {required this.totalVolume,
      required this.workoutsThisWeek,
      required this.caloriesBurned,
      final List<MuscleStatus> muscleStatuses = const []})
      : _muscleStatuses = muscleStatuses;

  factory _$InsightSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$InsightSummaryImplFromJson(json);

  @override
  final double totalVolume;
  @override
  final int workoutsThisWeek;
  @override
  final double caloriesBurned;
  final List<MuscleStatus> _muscleStatuses;
  @override
  @JsonKey()
  List<MuscleStatus> get muscleStatuses {
    if (_muscleStatuses is EqualUnmodifiableListView) return _muscleStatuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_muscleStatuses);
  }

  @override
  String toString() {
    return 'InsightSummary(totalVolume: $totalVolume, workoutsThisWeek: $workoutsThisWeek, caloriesBurned: $caloriesBurned, muscleStatuses: $muscleStatuses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InsightSummaryImpl &&
            (identical(other.totalVolume, totalVolume) ||
                other.totalVolume == totalVolume) &&
            (identical(other.workoutsThisWeek, workoutsThisWeek) ||
                other.workoutsThisWeek == workoutsThisWeek) &&
            (identical(other.caloriesBurned, caloriesBurned) ||
                other.caloriesBurned == caloriesBurned) &&
            const DeepCollectionEquality()
                .equals(other._muscleStatuses, _muscleStatuses));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalVolume, workoutsThisWeek,
      caloriesBurned, const DeepCollectionEquality().hash(_muscleStatuses));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InsightSummaryImplCopyWith<_$InsightSummaryImpl> get copyWith =>
      __$$InsightSummaryImplCopyWithImpl<_$InsightSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InsightSummaryImplToJson(
      this,
    );
  }
}

abstract class _InsightSummary implements InsightSummary {
  const factory _InsightSummary(
      {required final double totalVolume,
      required final int workoutsThisWeek,
      required final double caloriesBurned,
      final List<MuscleStatus> muscleStatuses}) = _$InsightSummaryImpl;

  factory _InsightSummary.fromJson(Map<String, dynamic> json) =
      _$InsightSummaryImpl.fromJson;

  @override
  double get totalVolume;
  @override
  int get workoutsThisWeek;
  @override
  double get caloriesBurned;
  @override
  List<MuscleStatus> get muscleStatuses;
  @override
  @JsonKey(ignore: true)
  _$$InsightSummaryImplCopyWith<_$InsightSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
