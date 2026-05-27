// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monthly_workout_plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AiMonthlyWorkoutPlan _$AiMonthlyWorkoutPlanFromJson(Map<String, dynamic> json) {
  return _AiMonthlyWorkoutPlan.fromJson(json);
}

/// @nodoc
mixin _$AiMonthlyWorkoutPlan {
  String get title => throw _privateConstructorUsedError;
  String get goal => throw _privateConstructorUsedError;
  String get modelGoal => throw _privateConstructorUsedError;
  String get modelVersion => throw _privateConstructorUsedError;
  int get blockLengthWeeks => throw _privateConstructorUsedError;
  List<String> get selectedTrainingDays => throw _privateConstructorUsedError;
  String get preferredTime => throw _privateConstructorUsedError;
  String get preferredTimeLabel => throw _privateConstructorUsedError;
  String get summary => throw _privateConstructorUsedError;
  List<String> get safetyNotes => throw _privateConstructorUsedError;
  List<String> get coachNotes => throw _privateConstructorUsedError;
  AiReadinessAdjustment get readinessAdjustment =>
      throw _privateConstructorUsedError;
  AiNutritionTargets get nutritionTargets => throw _privateConstructorUsedError;
  List<AiTemplateWorkout> get templateWorkouts =>
      throw _privateConstructorUsedError;
  List<AiMonthlyPlanWeek> get weeks => throw _privateConstructorUsedError;
  AiReassessment get reassessment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AiMonthlyWorkoutPlanCopyWith<AiMonthlyWorkoutPlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiMonthlyWorkoutPlanCopyWith<$Res> {
  factory $AiMonthlyWorkoutPlanCopyWith(
    AiMonthlyWorkoutPlan value,
    $Res Function(AiMonthlyWorkoutPlan) then,
  ) = _$AiMonthlyWorkoutPlanCopyWithImpl<$Res, AiMonthlyWorkoutPlan>;
  @useResult
  $Res call({
    String title,
    String goal,
    String modelGoal,
    String modelVersion,
    int blockLengthWeeks,
    List<String> selectedTrainingDays,
    String preferredTime,
    String preferredTimeLabel,
    String summary,
    List<String> safetyNotes,
    List<String> coachNotes,
    AiReadinessAdjustment readinessAdjustment,
    AiNutritionTargets nutritionTargets,
    List<AiTemplateWorkout> templateWorkouts,
    List<AiMonthlyPlanWeek> weeks,
    AiReassessment reassessment,
  });

  $AiReadinessAdjustmentCopyWith<$Res> get readinessAdjustment;
  $AiNutritionTargetsCopyWith<$Res> get nutritionTargets;
  $AiReassessmentCopyWith<$Res> get reassessment;
}

/// @nodoc
class _$AiMonthlyWorkoutPlanCopyWithImpl<
  $Res,
  $Val extends AiMonthlyWorkoutPlan
>
    implements $AiMonthlyWorkoutPlanCopyWith<$Res> {
  _$AiMonthlyWorkoutPlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? goal = null,
    Object? modelGoal = null,
    Object? modelVersion = null,
    Object? blockLengthWeeks = null,
    Object? selectedTrainingDays = null,
    Object? preferredTime = null,
    Object? preferredTimeLabel = null,
    Object? summary = null,
    Object? safetyNotes = null,
    Object? coachNotes = null,
    Object? readinessAdjustment = null,
    Object? nutritionTargets = null,
    Object? templateWorkouts = null,
    Object? weeks = null,
    Object? reassessment = null,
  }) {
    return _then(
      _value.copyWith(
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            goal: null == goal
                ? _value.goal
                : goal // ignore: cast_nullable_to_non_nullable
                      as String,
            modelGoal: null == modelGoal
                ? _value.modelGoal
                : modelGoal // ignore: cast_nullable_to_non_nullable
                      as String,
            modelVersion: null == modelVersion
                ? _value.modelVersion
                : modelVersion // ignore: cast_nullable_to_non_nullable
                      as String,
            blockLengthWeeks: null == blockLengthWeeks
                ? _value.blockLengthWeeks
                : blockLengthWeeks // ignore: cast_nullable_to_non_nullable
                      as int,
            selectedTrainingDays: null == selectedTrainingDays
                ? _value.selectedTrainingDays
                : selectedTrainingDays // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            preferredTime: null == preferredTime
                ? _value.preferredTime
                : preferredTime // ignore: cast_nullable_to_non_nullable
                      as String,
            preferredTimeLabel: null == preferredTimeLabel
                ? _value.preferredTimeLabel
                : preferredTimeLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            summary: null == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                      as String,
            safetyNotes: null == safetyNotes
                ? _value.safetyNotes
                : safetyNotes // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            coachNotes: null == coachNotes
                ? _value.coachNotes
                : coachNotes // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            readinessAdjustment: null == readinessAdjustment
                ? _value.readinessAdjustment
                : readinessAdjustment // ignore: cast_nullable_to_non_nullable
                      as AiReadinessAdjustment,
            nutritionTargets: null == nutritionTargets
                ? _value.nutritionTargets
                : nutritionTargets // ignore: cast_nullable_to_non_nullable
                      as AiNutritionTargets,
            templateWorkouts: null == templateWorkouts
                ? _value.templateWorkouts
                : templateWorkouts // ignore: cast_nullable_to_non_nullable
                      as List<AiTemplateWorkout>,
            weeks: null == weeks
                ? _value.weeks
                : weeks // ignore: cast_nullable_to_non_nullable
                      as List<AiMonthlyPlanWeek>,
            reassessment: null == reassessment
                ? _value.reassessment
                : reassessment // ignore: cast_nullable_to_non_nullable
                      as AiReassessment,
          )
          as $Val,
    );
  }

  @override
  @pragma('vm:prefer-inline')
  $AiReadinessAdjustmentCopyWith<$Res> get readinessAdjustment {
    return $AiReadinessAdjustmentCopyWith<$Res>(_value.readinessAdjustment, (
      value,
    ) {
      return _then(_value.copyWith(readinessAdjustment: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AiNutritionTargetsCopyWith<$Res> get nutritionTargets {
    return $AiNutritionTargetsCopyWith<$Res>(_value.nutritionTargets, (value) {
      return _then(_value.copyWith(nutritionTargets: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AiReassessmentCopyWith<$Res> get reassessment {
    return $AiReassessmentCopyWith<$Res>(_value.reassessment, (value) {
      return _then(_value.copyWith(reassessment: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AiMonthlyWorkoutPlanImplCopyWith<$Res>
    implements $AiMonthlyWorkoutPlanCopyWith<$Res> {
  factory _$$AiMonthlyWorkoutPlanImplCopyWith(
    _$AiMonthlyWorkoutPlanImpl value,
    $Res Function(_$AiMonthlyWorkoutPlanImpl) then,
  ) = __$$AiMonthlyWorkoutPlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String title,
    String goal,
    String modelGoal,
    String modelVersion,
    int blockLengthWeeks,
    List<String> selectedTrainingDays,
    String preferredTime,
    String preferredTimeLabel,
    String summary,
    List<String> safetyNotes,
    List<String> coachNotes,
    AiReadinessAdjustment readinessAdjustment,
    AiNutritionTargets nutritionTargets,
    List<AiTemplateWorkout> templateWorkouts,
    List<AiMonthlyPlanWeek> weeks,
    AiReassessment reassessment,
  });

  @override
  $AiReadinessAdjustmentCopyWith<$Res> get readinessAdjustment;
  @override
  $AiNutritionTargetsCopyWith<$Res> get nutritionTargets;
  @override
  $AiReassessmentCopyWith<$Res> get reassessment;
}

/// @nodoc
class __$$AiMonthlyWorkoutPlanImplCopyWithImpl<$Res>
    extends _$AiMonthlyWorkoutPlanCopyWithImpl<$Res, _$AiMonthlyWorkoutPlanImpl>
    implements _$$AiMonthlyWorkoutPlanImplCopyWith<$Res> {
  __$$AiMonthlyWorkoutPlanImplCopyWithImpl(
    _$AiMonthlyWorkoutPlanImpl _value,
    $Res Function(_$AiMonthlyWorkoutPlanImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? goal = null,
    Object? modelGoal = null,
    Object? modelVersion = null,
    Object? blockLengthWeeks = null,
    Object? selectedTrainingDays = null,
    Object? preferredTime = null,
    Object? preferredTimeLabel = null,
    Object? summary = null,
    Object? safetyNotes = null,
    Object? coachNotes = null,
    Object? readinessAdjustment = null,
    Object? nutritionTargets = null,
    Object? templateWorkouts = null,
    Object? weeks = null,
    Object? reassessment = null,
  }) {
    return _then(
      _$AiMonthlyWorkoutPlanImpl(
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        goal: null == goal
            ? _value.goal
            : goal // ignore: cast_nullable_to_non_nullable
                  as String,
        modelGoal: null == modelGoal
            ? _value.modelGoal
            : modelGoal // ignore: cast_nullable_to_non_nullable
                  as String,
        modelVersion: null == modelVersion
            ? _value.modelVersion
            : modelVersion // ignore: cast_nullable_to_non_nullable
                  as String,
        blockLengthWeeks: null == blockLengthWeeks
            ? _value.blockLengthWeeks
            : blockLengthWeeks // ignore: cast_nullable_to_non_nullable
                  as int,
        selectedTrainingDays: null == selectedTrainingDays
            ? _value._selectedTrainingDays
            : selectedTrainingDays // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        preferredTime: null == preferredTime
            ? _value.preferredTime
            : preferredTime // ignore: cast_nullable_to_non_nullable
                  as String,
        preferredTimeLabel: null == preferredTimeLabel
            ? _value.preferredTimeLabel
            : preferredTimeLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        summary: null == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as String,
        safetyNotes: null == safetyNotes
            ? _value._safetyNotes
            : safetyNotes // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        coachNotes: null == coachNotes
            ? _value._coachNotes
            : coachNotes // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        readinessAdjustment: null == readinessAdjustment
            ? _value.readinessAdjustment
            : readinessAdjustment // ignore: cast_nullable_to_non_nullable
                  as AiReadinessAdjustment,
        nutritionTargets: null == nutritionTargets
            ? _value.nutritionTargets
            : nutritionTargets // ignore: cast_nullable_to_non_nullable
                  as AiNutritionTargets,
        templateWorkouts: null == templateWorkouts
            ? _value._templateWorkouts
            : templateWorkouts // ignore: cast_nullable_to_non_nullable
                  as List<AiTemplateWorkout>,
        weeks: null == weeks
            ? _value._weeks
            : weeks // ignore: cast_nullable_to_non_nullable
                  as List<AiMonthlyPlanWeek>,
        reassessment: null == reassessment
            ? _value.reassessment
            : reassessment // ignore: cast_nullable_to_non_nullable
                  as AiReassessment,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AiMonthlyWorkoutPlanImpl extends _AiMonthlyWorkoutPlan {
  const _$AiMonthlyWorkoutPlanImpl({
    required this.title,
    required this.goal,
    required this.modelGoal,
    required this.modelVersion,
    required this.blockLengthWeeks,
    final List<String> selectedTrainingDays = const [],
    required this.preferredTime,
    required this.preferredTimeLabel,
    required this.summary,
    final List<String> safetyNotes = const [],
    final List<String> coachNotes = const [],
    required this.readinessAdjustment,
    required this.nutritionTargets,
    final List<AiTemplateWorkout> templateWorkouts = const [],
    final List<AiMonthlyPlanWeek> weeks = const [],
    required this.reassessment,
  }) : _selectedTrainingDays = selectedTrainingDays,
       _safetyNotes = safetyNotes,
       _coachNotes = coachNotes,
       _templateWorkouts = templateWorkouts,
       _weeks = weeks,
       super._();

  factory _$AiMonthlyWorkoutPlanImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiMonthlyWorkoutPlanImplFromJson(json);

  @override
  final String title;
  @override
  final String goal;
  @override
  final String modelGoal;
  @override
  final String modelVersion;
  @override
  final int blockLengthWeeks;
  final List<String> _selectedTrainingDays;
  @override
  @JsonKey()
  List<String> get selectedTrainingDays {
    if (_selectedTrainingDays is EqualUnmodifiableListView)
      return _selectedTrainingDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedTrainingDays);
  }

  @override
  final String preferredTime;
  @override
  final String preferredTimeLabel;
  @override
  final String summary;
  final List<String> _safetyNotes;
  @override
  @JsonKey()
  List<String> get safetyNotes {
    if (_safetyNotes is EqualUnmodifiableListView) return _safetyNotes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_safetyNotes);
  }

  final List<String> _coachNotes;
  @override
  @JsonKey()
  List<String> get coachNotes {
    if (_coachNotes is EqualUnmodifiableListView) return _coachNotes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coachNotes);
  }

  @override
  final AiReadinessAdjustment readinessAdjustment;
  @override
  final AiNutritionTargets nutritionTargets;
  final List<AiTemplateWorkout> _templateWorkouts;
  @override
  @JsonKey()
  List<AiTemplateWorkout> get templateWorkouts {
    if (_templateWorkouts is EqualUnmodifiableListView)
      return _templateWorkouts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_templateWorkouts);
  }

  final List<AiMonthlyPlanWeek> _weeks;
  @override
  @JsonKey()
  List<AiMonthlyPlanWeek> get weeks {
    if (_weeks is EqualUnmodifiableListView) return _weeks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weeks);
  }

  @override
  final AiReassessment reassessment;

  @override
  String toString() {
    return 'AiMonthlyWorkoutPlan(title: $title, goal: $goal, modelGoal: $modelGoal, modelVersion: $modelVersion, blockLengthWeeks: $blockLengthWeeks, selectedTrainingDays: $selectedTrainingDays, preferredTime: $preferredTime, preferredTimeLabel: $preferredTimeLabel, summary: $summary, safetyNotes: $safetyNotes, coachNotes: $coachNotes, readinessAdjustment: $readinessAdjustment, nutritionTargets: $nutritionTargets, templateWorkouts: $templateWorkouts, weeks: $weeks, reassessment: $reassessment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiMonthlyWorkoutPlanImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.goal, goal) || other.goal == goal) &&
            (identical(other.modelGoal, modelGoal) ||
                other.modelGoal == modelGoal) &&
            (identical(other.modelVersion, modelVersion) ||
                other.modelVersion == modelVersion) &&
            (identical(other.blockLengthWeeks, blockLengthWeeks) ||
                other.blockLengthWeeks == blockLengthWeeks) &&
            const DeepCollectionEquality().equals(
              other._selectedTrainingDays,
              _selectedTrainingDays,
            ) &&
            (identical(other.preferredTime, preferredTime) ||
                other.preferredTime == preferredTime) &&
            (identical(other.preferredTimeLabel, preferredTimeLabel) ||
                other.preferredTimeLabel == preferredTimeLabel) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            const DeepCollectionEquality().equals(
              other._safetyNotes,
              _safetyNotes,
            ) &&
            const DeepCollectionEquality().equals(
              other._coachNotes,
              _coachNotes,
            ) &&
            (identical(other.readinessAdjustment, readinessAdjustment) ||
                other.readinessAdjustment == readinessAdjustment) &&
            (identical(other.nutritionTargets, nutritionTargets) ||
                other.nutritionTargets == nutritionTargets) &&
            const DeepCollectionEquality().equals(
              other._templateWorkouts,
              _templateWorkouts,
            ) &&
            const DeepCollectionEquality().equals(other._weeks, _weeks) &&
            (identical(other.reassessment, reassessment) ||
                other.reassessment == reassessment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    title,
    goal,
    modelGoal,
    modelVersion,
    blockLengthWeeks,
    const DeepCollectionEquality().hash(_selectedTrainingDays),
    preferredTime,
    preferredTimeLabel,
    summary,
    const DeepCollectionEquality().hash(_safetyNotes),
    const DeepCollectionEquality().hash(_coachNotes),
    readinessAdjustment,
    nutritionTargets,
    const DeepCollectionEquality().hash(_templateWorkouts),
    const DeepCollectionEquality().hash(_weeks),
    reassessment,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AiMonthlyWorkoutPlanImplCopyWith<_$AiMonthlyWorkoutPlanImpl>
  get copyWith =>
      __$$AiMonthlyWorkoutPlanImplCopyWithImpl<_$AiMonthlyWorkoutPlanImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AiMonthlyWorkoutPlanImplToJson(this);
  }
}

abstract class _AiMonthlyWorkoutPlan extends AiMonthlyWorkoutPlan {
  const factory _AiMonthlyWorkoutPlan({
    required final String title,
    required final String goal,
    required final String modelGoal,
    required final String modelVersion,
    required final int blockLengthWeeks,
    final List<String> selectedTrainingDays,
    required final String preferredTime,
    required final String preferredTimeLabel,
    required final String summary,
    final List<String> safetyNotes,
    final List<String> coachNotes,
    required final AiReadinessAdjustment readinessAdjustment,
    required final AiNutritionTargets nutritionTargets,
    final List<AiTemplateWorkout> templateWorkouts,
    final List<AiMonthlyPlanWeek> weeks,
    required final AiReassessment reassessment,
  }) = _$AiMonthlyWorkoutPlanImpl;
  const _AiMonthlyWorkoutPlan._() : super._();

  factory _AiMonthlyWorkoutPlan.fromJson(Map<String, dynamic> json) =
      _$AiMonthlyWorkoutPlanImpl.fromJson;

  @override
  String get title;
  @override
  String get goal;
  @override
  String get modelGoal;
  @override
  String get modelVersion;
  @override
  int get blockLengthWeeks;
  @override
  List<String> get selectedTrainingDays;
  @override
  String get preferredTime;
  @override
  String get preferredTimeLabel;
  @override
  String get summary;
  @override
  List<String> get safetyNotes;
  @override
  List<String> get coachNotes;
  @override
  AiReadinessAdjustment get readinessAdjustment;
  @override
  AiNutritionTargets get nutritionTargets;
  @override
  List<AiTemplateWorkout> get templateWorkouts;
  @override
  List<AiMonthlyPlanWeek> get weeks;
  @override
  AiReassessment get reassessment;
  @override
  @JsonKey(ignore: true)
  _$$AiMonthlyWorkoutPlanImplCopyWith<_$AiMonthlyWorkoutPlanImpl>
  get copyWith => throw _privateConstructorUsedError;
}

AiReadinessAdjustment _$AiReadinessAdjustmentFromJson(
  Map<String, dynamic> json,
) {
  return _AiReadinessAdjustment.fromJson(json);
}

/// @nodoc
mixin _$AiReadinessAdjustment {
  String get intensityModifier => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AiReadinessAdjustmentCopyWith<AiReadinessAdjustment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiReadinessAdjustmentCopyWith<$Res> {
  factory $AiReadinessAdjustmentCopyWith(
    AiReadinessAdjustment value,
    $Res Function(AiReadinessAdjustment) then,
  ) = _$AiReadinessAdjustmentCopyWithImpl<$Res, AiReadinessAdjustment>;
  @useResult
  $Res call({String intensityModifier, String reason});
}

/// @nodoc
class _$AiReadinessAdjustmentCopyWithImpl<
  $Res,
  $Val extends AiReadinessAdjustment
>
    implements $AiReadinessAdjustmentCopyWith<$Res> {
  _$AiReadinessAdjustmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? intensityModifier = null, Object? reason = null}) {
    return _then(
      _value.copyWith(
            intensityModifier: null == intensityModifier
                ? _value.intensityModifier
                : intensityModifier // ignore: cast_nullable_to_non_nullable
                      as String,
            reason: null == reason
                ? _value.reason
                : reason // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AiReadinessAdjustmentImplCopyWith<$Res>
    implements $AiReadinessAdjustmentCopyWith<$Res> {
  factory _$$AiReadinessAdjustmentImplCopyWith(
    _$AiReadinessAdjustmentImpl value,
    $Res Function(_$AiReadinessAdjustmentImpl) then,
  ) = __$$AiReadinessAdjustmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String intensityModifier, String reason});
}

/// @nodoc
class __$$AiReadinessAdjustmentImplCopyWithImpl<$Res>
    extends
        _$AiReadinessAdjustmentCopyWithImpl<$Res, _$AiReadinessAdjustmentImpl>
    implements _$$AiReadinessAdjustmentImplCopyWith<$Res> {
  __$$AiReadinessAdjustmentImplCopyWithImpl(
    _$AiReadinessAdjustmentImpl _value,
    $Res Function(_$AiReadinessAdjustmentImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? intensityModifier = null, Object? reason = null}) {
    return _then(
      _$AiReadinessAdjustmentImpl(
        intensityModifier: null == intensityModifier
            ? _value.intensityModifier
            : intensityModifier // ignore: cast_nullable_to_non_nullable
                  as String,
        reason: null == reason
            ? _value.reason
            : reason // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AiReadinessAdjustmentImpl implements _AiReadinessAdjustment {
  const _$AiReadinessAdjustmentImpl({
    required this.intensityModifier,
    required this.reason,
  });

  factory _$AiReadinessAdjustmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiReadinessAdjustmentImplFromJson(json);

  @override
  final String intensityModifier;
  @override
  final String reason;

  @override
  String toString() {
    return 'AiReadinessAdjustment(intensityModifier: $intensityModifier, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiReadinessAdjustmentImpl &&
            (identical(other.intensityModifier, intensityModifier) ||
                other.intensityModifier == intensityModifier) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, intensityModifier, reason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AiReadinessAdjustmentImplCopyWith<_$AiReadinessAdjustmentImpl>
  get copyWith =>
      __$$AiReadinessAdjustmentImplCopyWithImpl<_$AiReadinessAdjustmentImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AiReadinessAdjustmentImplToJson(this);
  }
}

abstract class _AiReadinessAdjustment implements AiReadinessAdjustment {
  const factory _AiReadinessAdjustment({
    required final String intensityModifier,
    required final String reason,
  }) = _$AiReadinessAdjustmentImpl;

  factory _AiReadinessAdjustment.fromJson(Map<String, dynamic> json) =
      _$AiReadinessAdjustmentImpl.fromJson;

  @override
  String get intensityModifier;
  @override
  String get reason;
  @override
  @JsonKey(ignore: true)
  _$$AiReadinessAdjustmentImplCopyWith<_$AiReadinessAdjustmentImpl>
  get copyWith => throw _privateConstructorUsedError;
}

AiNutritionTargets _$AiNutritionTargetsFromJson(Map<String, dynamic> json) {
  return _AiNutritionTargets.fromJson(json);
}

/// @nodoc
mixin _$AiNutritionTargets {
  int get dailyCalories => throw _privateConstructorUsedError;
  int get proteinTargetG => throw _privateConstructorUsedError;
  int get carbTargetG => throw _privateConstructorUsedError;
  int get fatTargetG => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AiNutritionTargetsCopyWith<AiNutritionTargets> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiNutritionTargetsCopyWith<$Res> {
  factory $AiNutritionTargetsCopyWith(
    AiNutritionTargets value,
    $Res Function(AiNutritionTargets) then,
  ) = _$AiNutritionTargetsCopyWithImpl<$Res, AiNutritionTargets>;
  @useResult
  $Res call({
    int dailyCalories,
    int proteinTargetG,
    int carbTargetG,
    int fatTargetG,
  });
}

/// @nodoc
class _$AiNutritionTargetsCopyWithImpl<$Res, $Val extends AiNutritionTargets>
    implements $AiNutritionTargetsCopyWith<$Res> {
  _$AiNutritionTargetsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dailyCalories = null,
    Object? proteinTargetG = null,
    Object? carbTargetG = null,
    Object? fatTargetG = null,
  }) {
    return _then(
      _value.copyWith(
            dailyCalories: null == dailyCalories
                ? _value.dailyCalories
                : dailyCalories // ignore: cast_nullable_to_non_nullable
                      as int,
            proteinTargetG: null == proteinTargetG
                ? _value.proteinTargetG
                : proteinTargetG // ignore: cast_nullable_to_non_nullable
                      as int,
            carbTargetG: null == carbTargetG
                ? _value.carbTargetG
                : carbTargetG // ignore: cast_nullable_to_non_nullable
                      as int,
            fatTargetG: null == fatTargetG
                ? _value.fatTargetG
                : fatTargetG // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AiNutritionTargetsImplCopyWith<$Res>
    implements $AiNutritionTargetsCopyWith<$Res> {
  factory _$$AiNutritionTargetsImplCopyWith(
    _$AiNutritionTargetsImpl value,
    $Res Function(_$AiNutritionTargetsImpl) then,
  ) = __$$AiNutritionTargetsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int dailyCalories,
    int proteinTargetG,
    int carbTargetG,
    int fatTargetG,
  });
}

/// @nodoc
class __$$AiNutritionTargetsImplCopyWithImpl<$Res>
    extends _$AiNutritionTargetsCopyWithImpl<$Res, _$AiNutritionTargetsImpl>
    implements _$$AiNutritionTargetsImplCopyWith<$Res> {
  __$$AiNutritionTargetsImplCopyWithImpl(
    _$AiNutritionTargetsImpl _value,
    $Res Function(_$AiNutritionTargetsImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dailyCalories = null,
    Object? proteinTargetG = null,
    Object? carbTargetG = null,
    Object? fatTargetG = null,
  }) {
    return _then(
      _$AiNutritionTargetsImpl(
        dailyCalories: null == dailyCalories
            ? _value.dailyCalories
            : dailyCalories // ignore: cast_nullable_to_non_nullable
                  as int,
        proteinTargetG: null == proteinTargetG
            ? _value.proteinTargetG
            : proteinTargetG // ignore: cast_nullable_to_non_nullable
                  as int,
        carbTargetG: null == carbTargetG
            ? _value.carbTargetG
            : carbTargetG // ignore: cast_nullable_to_non_nullable
                  as int,
        fatTargetG: null == fatTargetG
            ? _value.fatTargetG
            : fatTargetG // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AiNutritionTargetsImpl implements _AiNutritionTargets {
  const _$AiNutritionTargetsImpl({
    required this.dailyCalories,
    required this.proteinTargetG,
    required this.carbTargetG,
    required this.fatTargetG,
  });

  factory _$AiNutritionTargetsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiNutritionTargetsImplFromJson(json);

  @override
  final int dailyCalories;
  @override
  final int proteinTargetG;
  @override
  final int carbTargetG;
  @override
  final int fatTargetG;

  @override
  String toString() {
    return 'AiNutritionTargets(dailyCalories: $dailyCalories, proteinTargetG: $proteinTargetG, carbTargetG: $carbTargetG, fatTargetG: $fatTargetG)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiNutritionTargetsImpl &&
            (identical(other.dailyCalories, dailyCalories) ||
                other.dailyCalories == dailyCalories) &&
            (identical(other.proteinTargetG, proteinTargetG) ||
                other.proteinTargetG == proteinTargetG) &&
            (identical(other.carbTargetG, carbTargetG) ||
                other.carbTargetG == carbTargetG) &&
            (identical(other.fatTargetG, fatTargetG) ||
                other.fatTargetG == fatTargetG));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    dailyCalories,
    proteinTargetG,
    carbTargetG,
    fatTargetG,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AiNutritionTargetsImplCopyWith<_$AiNutritionTargetsImpl> get copyWith =>
      __$$AiNutritionTargetsImplCopyWithImpl<_$AiNutritionTargetsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AiNutritionTargetsImplToJson(this);
  }
}

abstract class _AiNutritionTargets implements AiNutritionTargets {
  const factory _AiNutritionTargets({
    required final int dailyCalories,
    required final int proteinTargetG,
    required final int carbTargetG,
    required final int fatTargetG,
  }) = _$AiNutritionTargetsImpl;

  factory _AiNutritionTargets.fromJson(Map<String, dynamic> json) =
      _$AiNutritionTargetsImpl.fromJson;

  @override
  int get dailyCalories;
  @override
  int get proteinTargetG;
  @override
  int get carbTargetG;
  @override
  int get fatTargetG;
  @override
  @JsonKey(ignore: true)
  _$$AiNutritionTargetsImplCopyWith<_$AiNutritionTargetsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AiTemplateWorkout _$AiTemplateWorkoutFromJson(Map<String, dynamic> json) {
  return _AiTemplateWorkout.fromJson(json);
}

/// @nodoc
mixin _$AiTemplateWorkout {
  String get templateId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get focus => throw _privateConstructorUsedError;
  int get estimatedMinutes => throw _privateConstructorUsedError;
  String get warmUp => throw _privateConstructorUsedError;
  String get cooldown => throw _privateConstructorUsedError;
  List<AiTemplateExercise> get exercises => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AiTemplateWorkoutCopyWith<AiTemplateWorkout> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiTemplateWorkoutCopyWith<$Res> {
  factory $AiTemplateWorkoutCopyWith(
    AiTemplateWorkout value,
    $Res Function(AiTemplateWorkout) then,
  ) = _$AiTemplateWorkoutCopyWithImpl<$Res, AiTemplateWorkout>;
  @useResult
  $Res call({
    String templateId,
    String title,
    String focus,
    int estimatedMinutes,
    String warmUp,
    String cooldown,
    List<AiTemplateExercise> exercises,
  });
}

/// @nodoc
class _$AiTemplateWorkoutCopyWithImpl<$Res, $Val extends AiTemplateWorkout>
    implements $AiTemplateWorkoutCopyWith<$Res> {
  _$AiTemplateWorkoutCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? templateId = null,
    Object? title = null,
    Object? focus = null,
    Object? estimatedMinutes = null,
    Object? warmUp = null,
    Object? cooldown = null,
    Object? exercises = null,
  }) {
    return _then(
      _value.copyWith(
            templateId: null == templateId
                ? _value.templateId
                : templateId // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            focus: null == focus
                ? _value.focus
                : focus // ignore: cast_nullable_to_non_nullable
                      as String,
            estimatedMinutes: null == estimatedMinutes
                ? _value.estimatedMinutes
                : estimatedMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            warmUp: null == warmUp
                ? _value.warmUp
                : warmUp // ignore: cast_nullable_to_non_nullable
                      as String,
            cooldown: null == cooldown
                ? _value.cooldown
                : cooldown // ignore: cast_nullable_to_non_nullable
                      as String,
            exercises: null == exercises
                ? _value.exercises
                : exercises // ignore: cast_nullable_to_non_nullable
                      as List<AiTemplateExercise>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AiTemplateWorkoutImplCopyWith<$Res>
    implements $AiTemplateWorkoutCopyWith<$Res> {
  factory _$$AiTemplateWorkoutImplCopyWith(
    _$AiTemplateWorkoutImpl value,
    $Res Function(_$AiTemplateWorkoutImpl) then,
  ) = __$$AiTemplateWorkoutImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String templateId,
    String title,
    String focus,
    int estimatedMinutes,
    String warmUp,
    String cooldown,
    List<AiTemplateExercise> exercises,
  });
}

/// @nodoc
class __$$AiTemplateWorkoutImplCopyWithImpl<$Res>
    extends _$AiTemplateWorkoutCopyWithImpl<$Res, _$AiTemplateWorkoutImpl>
    implements _$$AiTemplateWorkoutImplCopyWith<$Res> {
  __$$AiTemplateWorkoutImplCopyWithImpl(
    _$AiTemplateWorkoutImpl _value,
    $Res Function(_$AiTemplateWorkoutImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? templateId = null,
    Object? title = null,
    Object? focus = null,
    Object? estimatedMinutes = null,
    Object? warmUp = null,
    Object? cooldown = null,
    Object? exercises = null,
  }) {
    return _then(
      _$AiTemplateWorkoutImpl(
        templateId: null == templateId
            ? _value.templateId
            : templateId // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        focus: null == focus
            ? _value.focus
            : focus // ignore: cast_nullable_to_non_nullable
                  as String,
        estimatedMinutes: null == estimatedMinutes
            ? _value.estimatedMinutes
            : estimatedMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        warmUp: null == warmUp
            ? _value.warmUp
            : warmUp // ignore: cast_nullable_to_non_nullable
                  as String,
        cooldown: null == cooldown
            ? _value.cooldown
            : cooldown // ignore: cast_nullable_to_non_nullable
                  as String,
        exercises: null == exercises
            ? _value._exercises
            : exercises // ignore: cast_nullable_to_non_nullable
                  as List<AiTemplateExercise>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AiTemplateWorkoutImpl implements _AiTemplateWorkout {
  const _$AiTemplateWorkoutImpl({
    required this.templateId,
    required this.title,
    required this.focus,
    required this.estimatedMinutes,
    required this.warmUp,
    required this.cooldown,
    final List<AiTemplateExercise> exercises = const [],
  }) : _exercises = exercises;

  factory _$AiTemplateWorkoutImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiTemplateWorkoutImplFromJson(json);

  @override
  final String templateId;
  @override
  final String title;
  @override
  final String focus;
  @override
  final int estimatedMinutes;
  @override
  final String warmUp;
  @override
  final String cooldown;
  final List<AiTemplateExercise> _exercises;
  @override
  @JsonKey()
  List<AiTemplateExercise> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  @override
  String toString() {
    return 'AiTemplateWorkout(templateId: $templateId, title: $title, focus: $focus, estimatedMinutes: $estimatedMinutes, warmUp: $warmUp, cooldown: $cooldown, exercises: $exercises)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiTemplateWorkoutImpl &&
            (identical(other.templateId, templateId) ||
                other.templateId == templateId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.focus, focus) || other.focus == focus) &&
            (identical(other.estimatedMinutes, estimatedMinutes) ||
                other.estimatedMinutes == estimatedMinutes) &&
            (identical(other.warmUp, warmUp) || other.warmUp == warmUp) &&
            (identical(other.cooldown, cooldown) ||
                other.cooldown == cooldown) &&
            const DeepCollectionEquality().equals(
              other._exercises,
              _exercises,
            ));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    templateId,
    title,
    focus,
    estimatedMinutes,
    warmUp,
    cooldown,
    const DeepCollectionEquality().hash(_exercises),
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AiTemplateWorkoutImplCopyWith<_$AiTemplateWorkoutImpl> get copyWith =>
      __$$AiTemplateWorkoutImplCopyWithImpl<_$AiTemplateWorkoutImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AiTemplateWorkoutImplToJson(this);
  }
}

abstract class _AiTemplateWorkout implements AiTemplateWorkout {
  const factory _AiTemplateWorkout({
    required final String templateId,
    required final String title,
    required final String focus,
    required final int estimatedMinutes,
    required final String warmUp,
    required final String cooldown,
    final List<AiTemplateExercise> exercises,
  }) = _$AiTemplateWorkoutImpl;

  factory _AiTemplateWorkout.fromJson(Map<String, dynamic> json) =
      _$AiTemplateWorkoutImpl.fromJson;

  @override
  String get templateId;
  @override
  String get title;
  @override
  String get focus;
  @override
  int get estimatedMinutes;
  @override
  String get warmUp;
  @override
  String get cooldown;
  @override
  List<AiTemplateExercise> get exercises;
  @override
  @JsonKey(ignore: true)
  _$$AiTemplateWorkoutImplCopyWith<_$AiTemplateWorkoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AiTemplateExercise _$AiTemplateExerciseFromJson(Map<String, dynamic> json) {
  return _AiTemplateExercise.fromJson(json);
}

/// @nodoc
mixin _$AiTemplateExercise {
  int get order => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get bodyPart => throw _privateConstructorUsedError;
  String get equipment => throw _privateConstructorUsedError;
  String get level => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get sets => throw _privateConstructorUsedError;
  String get reps => throw _privateConstructorUsedError;
  int get restSeconds => throw _privateConstructorUsedError;
  String get prescriptionLabel => throw _privateConstructorUsedError;
  String get rationale => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AiTemplateExerciseCopyWith<AiTemplateExercise> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiTemplateExerciseCopyWith<$Res> {
  factory $AiTemplateExerciseCopyWith(
    AiTemplateExercise value,
    $Res Function(AiTemplateExercise) then,
  ) = _$AiTemplateExerciseCopyWithImpl<$Res, AiTemplateExercise>;
  @useResult
  $Res call({
    int order,
    String title,
    String bodyPart,
    String equipment,
    String level,
    String type,
    String description,
    int sets,
    String reps,
    int restSeconds,
    String prescriptionLabel,
    String rationale,
  });
}

/// @nodoc
class _$AiTemplateExerciseCopyWithImpl<$Res, $Val extends AiTemplateExercise>
    implements $AiTemplateExerciseCopyWith<$Res> {
  _$AiTemplateExerciseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = null,
    Object? title = null,
    Object? bodyPart = null,
    Object? equipment = null,
    Object? level = null,
    Object? type = null,
    Object? description = null,
    Object? sets = null,
    Object? reps = null,
    Object? restSeconds = null,
    Object? prescriptionLabel = null,
    Object? rationale = null,
  }) {
    return _then(
      _value.copyWith(
            order: null == order
                ? _value.order
                : order // ignore: cast_nullable_to_non_nullable
                      as int,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            bodyPart: null == bodyPart
                ? _value.bodyPart
                : bodyPart // ignore: cast_nullable_to_non_nullable
                      as String,
            equipment: null == equipment
                ? _value.equipment
                : equipment // ignore: cast_nullable_to_non_nullable
                      as String,
            level: null == level
                ? _value.level
                : level // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            sets: null == sets
                ? _value.sets
                : sets // ignore: cast_nullable_to_non_nullable
                      as int,
            reps: null == reps
                ? _value.reps
                : reps // ignore: cast_nullable_to_non_nullable
                      as String,
            restSeconds: null == restSeconds
                ? _value.restSeconds
                : restSeconds // ignore: cast_nullable_to_non_nullable
                      as int,
            prescriptionLabel: null == prescriptionLabel
                ? _value.prescriptionLabel
                : prescriptionLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            rationale: null == rationale
                ? _value.rationale
                : rationale // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AiTemplateExerciseImplCopyWith<$Res>
    implements $AiTemplateExerciseCopyWith<$Res> {
  factory _$$AiTemplateExerciseImplCopyWith(
    _$AiTemplateExerciseImpl value,
    $Res Function(_$AiTemplateExerciseImpl) then,
  ) = __$$AiTemplateExerciseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int order,
    String title,
    String bodyPart,
    String equipment,
    String level,
    String type,
    String description,
    int sets,
    String reps,
    int restSeconds,
    String prescriptionLabel,
    String rationale,
  });
}

/// @nodoc
class __$$AiTemplateExerciseImplCopyWithImpl<$Res>
    extends _$AiTemplateExerciseCopyWithImpl<$Res, _$AiTemplateExerciseImpl>
    implements _$$AiTemplateExerciseImplCopyWith<$Res> {
  __$$AiTemplateExerciseImplCopyWithImpl(
    _$AiTemplateExerciseImpl _value,
    $Res Function(_$AiTemplateExerciseImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = null,
    Object? title = null,
    Object? bodyPart = null,
    Object? equipment = null,
    Object? level = null,
    Object? type = null,
    Object? description = null,
    Object? sets = null,
    Object? reps = null,
    Object? restSeconds = null,
    Object? prescriptionLabel = null,
    Object? rationale = null,
  }) {
    return _then(
      _$AiTemplateExerciseImpl(
        order: null == order
            ? _value.order
            : order // ignore: cast_nullable_to_non_nullable
                  as int,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        bodyPart: null == bodyPart
            ? _value.bodyPart
            : bodyPart // ignore: cast_nullable_to_non_nullable
                  as String,
        equipment: null == equipment
            ? _value.equipment
            : equipment // ignore: cast_nullable_to_non_nullable
                  as String,
        level: null == level
            ? _value.level
            : level // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        sets: null == sets
            ? _value.sets
            : sets // ignore: cast_nullable_to_non_nullable
                  as int,
        reps: null == reps
            ? _value.reps
            : reps // ignore: cast_nullable_to_non_nullable
                  as String,
        restSeconds: null == restSeconds
            ? _value.restSeconds
            : restSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
        prescriptionLabel: null == prescriptionLabel
            ? _value.prescriptionLabel
            : prescriptionLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        rationale: null == rationale
            ? _value.rationale
            : rationale // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AiTemplateExerciseImpl implements _AiTemplateExercise {
  const _$AiTemplateExerciseImpl({
    required this.order,
    required this.title,
    required this.bodyPart,
    required this.equipment,
    required this.level,
    required this.type,
    required this.description,
    required this.sets,
    required this.reps,
    required this.restSeconds,
    required this.prescriptionLabel,
    required this.rationale,
  });

  factory _$AiTemplateExerciseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiTemplateExerciseImplFromJson(json);

  @override
  final int order;
  @override
  final String title;
  @override
  final String bodyPart;
  @override
  final String equipment;
  @override
  final String level;
  @override
  final String type;
  @override
  final String description;
  @override
  final int sets;
  @override
  final String reps;
  @override
  final int restSeconds;
  @override
  final String prescriptionLabel;
  @override
  final String rationale;

  @override
  String toString() {
    return 'AiTemplateExercise(order: $order, title: $title, bodyPart: $bodyPart, equipment: $equipment, level: $level, type: $type, description: $description, sets: $sets, reps: $reps, restSeconds: $restSeconds, prescriptionLabel: $prescriptionLabel, rationale: $rationale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiTemplateExerciseImpl &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.bodyPart, bodyPart) ||
                other.bodyPart == bodyPart) &&
            (identical(other.equipment, equipment) ||
                other.equipment == equipment) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.sets, sets) || other.sets == sets) &&
            (identical(other.reps, reps) || other.reps == reps) &&
            (identical(other.restSeconds, restSeconds) ||
                other.restSeconds == restSeconds) &&
            (identical(other.prescriptionLabel, prescriptionLabel) ||
                other.prescriptionLabel == prescriptionLabel) &&
            (identical(other.rationale, rationale) ||
                other.rationale == rationale));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    order,
    title,
    bodyPart,
    equipment,
    level,
    type,
    description,
    sets,
    reps,
    restSeconds,
    prescriptionLabel,
    rationale,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AiTemplateExerciseImplCopyWith<_$AiTemplateExerciseImpl> get copyWith =>
      __$$AiTemplateExerciseImplCopyWithImpl<_$AiTemplateExerciseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AiTemplateExerciseImplToJson(this);
  }
}

abstract class _AiTemplateExercise implements AiTemplateExercise {
  const factory _AiTemplateExercise({
    required final int order,
    required final String title,
    required final String bodyPart,
    required final String equipment,
    required final String level,
    required final String type,
    required final String description,
    required final int sets,
    required final String reps,
    required final int restSeconds,
    required final String prescriptionLabel,
    required final String rationale,
  }) = _$AiTemplateExerciseImpl;

  factory _AiTemplateExercise.fromJson(Map<String, dynamic> json) =
      _$AiTemplateExerciseImpl.fromJson;

  @override
  int get order;
  @override
  String get title;
  @override
  String get bodyPart;
  @override
  String get equipment;
  @override
  String get level;
  @override
  String get type;
  @override
  String get description;
  @override
  int get sets;
  @override
  String get reps;
  @override
  int get restSeconds;
  @override
  String get prescriptionLabel;
  @override
  String get rationale;
  @override
  @JsonKey(ignore: true)
  _$$AiTemplateExerciseImplCopyWith<_$AiTemplateExerciseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AiMonthlyPlanWeek _$AiMonthlyPlanWeekFromJson(Map<String, dynamic> json) {
  return _AiMonthlyPlanWeek.fromJson(json);
}

/// @nodoc
mixin _$AiMonthlyPlanWeek {
  int get weekNumber => throw _privateConstructorUsedError;
  double get loadMultiplier => throw _privateConstructorUsedError;
  int get targetSets => throw _privateConstructorUsedError;
  bool get isDeload => throw _privateConstructorUsedError;
  String get progressionRule => throw _privateConstructorUsedError;
  String get focus => throw _privateConstructorUsedError;
  List<AiMonthlyPlanDay> get days => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AiMonthlyPlanWeekCopyWith<AiMonthlyPlanWeek> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiMonthlyPlanWeekCopyWith<$Res> {
  factory $AiMonthlyPlanWeekCopyWith(
    AiMonthlyPlanWeek value,
    $Res Function(AiMonthlyPlanWeek) then,
  ) = _$AiMonthlyPlanWeekCopyWithImpl<$Res, AiMonthlyPlanWeek>;
  @useResult
  $Res call({
    int weekNumber,
    double loadMultiplier,
    int targetSets,
    bool isDeload,
    String progressionRule,
    String focus,
    List<AiMonthlyPlanDay> days,
  });
}

/// @nodoc
class _$AiMonthlyPlanWeekCopyWithImpl<$Res, $Val extends AiMonthlyPlanWeek>
    implements $AiMonthlyPlanWeekCopyWith<$Res> {
  _$AiMonthlyPlanWeekCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weekNumber = null,
    Object? loadMultiplier = null,
    Object? targetSets = null,
    Object? isDeload = null,
    Object? progressionRule = null,
    Object? focus = null,
    Object? days = null,
  }) {
    return _then(
      _value.copyWith(
            weekNumber: null == weekNumber
                ? _value.weekNumber
                : weekNumber // ignore: cast_nullable_to_non_nullable
                      as int,
            loadMultiplier: null == loadMultiplier
                ? _value.loadMultiplier
                : loadMultiplier // ignore: cast_nullable_to_non_nullable
                      as double,
            targetSets: null == targetSets
                ? _value.targetSets
                : targetSets // ignore: cast_nullable_to_non_nullable
                      as int,
            isDeload: null == isDeload
                ? _value.isDeload
                : isDeload // ignore: cast_nullable_to_non_nullable
                      as bool,
            progressionRule: null == progressionRule
                ? _value.progressionRule
                : progressionRule // ignore: cast_nullable_to_non_nullable
                      as String,
            focus: null == focus
                ? _value.focus
                : focus // ignore: cast_nullable_to_non_nullable
                      as String,
            days: null == days
                ? _value.days
                : days // ignore: cast_nullable_to_non_nullable
                      as List<AiMonthlyPlanDay>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AiMonthlyPlanWeekImplCopyWith<$Res>
    implements $AiMonthlyPlanWeekCopyWith<$Res> {
  factory _$$AiMonthlyPlanWeekImplCopyWith(
    _$AiMonthlyPlanWeekImpl value,
    $Res Function(_$AiMonthlyPlanWeekImpl) then,
  ) = __$$AiMonthlyPlanWeekImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int weekNumber,
    double loadMultiplier,
    int targetSets,
    bool isDeload,
    String progressionRule,
    String focus,
    List<AiMonthlyPlanDay> days,
  });
}

/// @nodoc
class __$$AiMonthlyPlanWeekImplCopyWithImpl<$Res>
    extends _$AiMonthlyPlanWeekCopyWithImpl<$Res, _$AiMonthlyPlanWeekImpl>
    implements _$$AiMonthlyPlanWeekImplCopyWith<$Res> {
  __$$AiMonthlyPlanWeekImplCopyWithImpl(
    _$AiMonthlyPlanWeekImpl _value,
    $Res Function(_$AiMonthlyPlanWeekImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weekNumber = null,
    Object? loadMultiplier = null,
    Object? targetSets = null,
    Object? isDeload = null,
    Object? progressionRule = null,
    Object? focus = null,
    Object? days = null,
  }) {
    return _then(
      _$AiMonthlyPlanWeekImpl(
        weekNumber: null == weekNumber
            ? _value.weekNumber
            : weekNumber // ignore: cast_nullable_to_non_nullable
                  as int,
        loadMultiplier: null == loadMultiplier
            ? _value.loadMultiplier
            : loadMultiplier // ignore: cast_nullable_to_non_nullable
                  as double,
        targetSets: null == targetSets
            ? _value.targetSets
            : targetSets // ignore: cast_nullable_to_non_nullable
                  as int,
        isDeload: null == isDeload
            ? _value.isDeload
            : isDeload // ignore: cast_nullable_to_non_nullable
                  as bool,
        progressionRule: null == progressionRule
            ? _value.progressionRule
            : progressionRule // ignore: cast_nullable_to_non_nullable
                  as String,
        focus: null == focus
            ? _value.focus
            : focus // ignore: cast_nullable_to_non_nullable
                  as String,
        days: null == days
            ? _value._days
            : days // ignore: cast_nullable_to_non_nullable
                  as List<AiMonthlyPlanDay>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AiMonthlyPlanWeekImpl implements _AiMonthlyPlanWeek {
  const _$AiMonthlyPlanWeekImpl({
    required this.weekNumber,
    required this.loadMultiplier,
    required this.targetSets,
    required this.isDeload,
    required this.progressionRule,
    required this.focus,
    final List<AiMonthlyPlanDay> days = const [],
  }) : _days = days;

  factory _$AiMonthlyPlanWeekImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiMonthlyPlanWeekImplFromJson(json);

  @override
  final int weekNumber;
  @override
  final double loadMultiplier;
  @override
  final int targetSets;
  @override
  final bool isDeload;
  @override
  final String progressionRule;
  @override
  final String focus;
  final List<AiMonthlyPlanDay> _days;
  @override
  @JsonKey()
  List<AiMonthlyPlanDay> get days {
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_days);
  }

  @override
  String toString() {
    return 'AiMonthlyPlanWeek(weekNumber: $weekNumber, loadMultiplier: $loadMultiplier, targetSets: $targetSets, isDeload: $isDeload, progressionRule: $progressionRule, focus: $focus, days: $days)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiMonthlyPlanWeekImpl &&
            (identical(other.weekNumber, weekNumber) ||
                other.weekNumber == weekNumber) &&
            (identical(other.loadMultiplier, loadMultiplier) ||
                other.loadMultiplier == loadMultiplier) &&
            (identical(other.targetSets, targetSets) ||
                other.targetSets == targetSets) &&
            (identical(other.isDeload, isDeload) ||
                other.isDeload == isDeload) &&
            (identical(other.progressionRule, progressionRule) ||
                other.progressionRule == progressionRule) &&
            (identical(other.focus, focus) || other.focus == focus) &&
            const DeepCollectionEquality().equals(other._days, _days));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    weekNumber,
    loadMultiplier,
    targetSets,
    isDeload,
    progressionRule,
    focus,
    const DeepCollectionEquality().hash(_days),
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AiMonthlyPlanWeekImplCopyWith<_$AiMonthlyPlanWeekImpl> get copyWith =>
      __$$AiMonthlyPlanWeekImplCopyWithImpl<_$AiMonthlyPlanWeekImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AiMonthlyPlanWeekImplToJson(this);
  }
}

abstract class _AiMonthlyPlanWeek implements AiMonthlyPlanWeek {
  const factory _AiMonthlyPlanWeek({
    required final int weekNumber,
    required final double loadMultiplier,
    required final int targetSets,
    required final bool isDeload,
    required final String progressionRule,
    required final String focus,
    final List<AiMonthlyPlanDay> days,
  }) = _$AiMonthlyPlanWeekImpl;

  factory _AiMonthlyPlanWeek.fromJson(Map<String, dynamic> json) =
      _$AiMonthlyPlanWeekImpl.fromJson;

  @override
  int get weekNumber;
  @override
  double get loadMultiplier;
  @override
  int get targetSets;
  @override
  bool get isDeload;
  @override
  String get progressionRule;
  @override
  String get focus;
  @override
  List<AiMonthlyPlanDay> get days;
  @override
  @JsonKey(ignore: true)
  _$$AiMonthlyPlanWeekImplCopyWith<_$AiMonthlyPlanWeekImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AiMonthlyPlanDay _$AiMonthlyPlanDayFromJson(Map<String, dynamic> json) {
  return _AiMonthlyPlanDay.fromJson(json);
}

/// @nodoc
mixin _$AiMonthlyPlanDay {
  String get dayCode => throw _privateConstructorUsedError;
  String get dayLabel => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String? get preferredTime => throw _privateConstructorUsedError;
  String? get preferredTimeLabel => throw _privateConstructorUsedError;
  String? get templateId => throw _privateConstructorUsedError;
  String? get templateTitle => throw _privateConstructorUsedError;
  String get focus => throw _privateConstructorUsedError;
  List<String> get exercises => throw _privateConstructorUsedError;
  int? get estimatedMinutes => throw _privateConstructorUsedError;
  String? get mobility => throw _privateConstructorUsedError;
  String? get warmUp => throw _privateConstructorUsedError;
  String? get cooldown => throw _privateConstructorUsedError;
  double? get loadMultiplier => throw _privateConstructorUsedError;
  int? get targetSets => throw _privateConstructorUsedError;
  bool? get isDeload => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AiMonthlyPlanDayCopyWith<AiMonthlyPlanDay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiMonthlyPlanDayCopyWith<$Res> {
  factory $AiMonthlyPlanDayCopyWith(
    AiMonthlyPlanDay value,
    $Res Function(AiMonthlyPlanDay) then,
  ) = _$AiMonthlyPlanDayCopyWithImpl<$Res, AiMonthlyPlanDay>;
  @useResult
  $Res call({
    String dayCode,
    String dayLabel,
    String type,
    String? preferredTime,
    String? preferredTimeLabel,
    String? templateId,
    String? templateTitle,
    String focus,
    List<String> exercises,
    int? estimatedMinutes,
    String? mobility,
    String? warmUp,
    String? cooldown,
    double? loadMultiplier,
    int? targetSets,
    bool? isDeload,
  });
}

/// @nodoc
class _$AiMonthlyPlanDayCopyWithImpl<$Res, $Val extends AiMonthlyPlanDay>
    implements $AiMonthlyPlanDayCopyWith<$Res> {
  _$AiMonthlyPlanDayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayCode = null,
    Object? dayLabel = null,
    Object? type = null,
    Object? preferredTime = freezed,
    Object? preferredTimeLabel = freezed,
    Object? templateId = freezed,
    Object? templateTitle = freezed,
    Object? focus = null,
    Object? exercises = null,
    Object? estimatedMinutes = freezed,
    Object? mobility = freezed,
    Object? warmUp = freezed,
    Object? cooldown = freezed,
    Object? loadMultiplier = freezed,
    Object? targetSets = freezed,
    Object? isDeload = freezed,
  }) {
    return _then(
      _value.copyWith(
            dayCode: null == dayCode
                ? _value.dayCode
                : dayCode // ignore: cast_nullable_to_non_nullable
                      as String,
            dayLabel: null == dayLabel
                ? _value.dayLabel
                : dayLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            preferredTime: freezed == preferredTime
                ? _value.preferredTime
                : preferredTime // ignore: cast_nullable_to_non_nullable
                      as String?,
            preferredTimeLabel: freezed == preferredTimeLabel
                ? _value.preferredTimeLabel
                : preferredTimeLabel // ignore: cast_nullable_to_non_nullable
                      as String?,
            templateId: freezed == templateId
                ? _value.templateId
                : templateId // ignore: cast_nullable_to_non_nullable
                      as String?,
            templateTitle: freezed == templateTitle
                ? _value.templateTitle
                : templateTitle // ignore: cast_nullable_to_non_nullable
                      as String?,
            focus: null == focus
                ? _value.focus
                : focus // ignore: cast_nullable_to_non_nullable
                      as String,
            exercises: null == exercises
                ? _value.exercises
                : exercises // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            estimatedMinutes: freezed == estimatedMinutes
                ? _value.estimatedMinutes
                : estimatedMinutes // ignore: cast_nullable_to_non_nullable
                      as int?,
            mobility: freezed == mobility
                ? _value.mobility
                : mobility // ignore: cast_nullable_to_non_nullable
                      as String?,
            warmUp: freezed == warmUp
                ? _value.warmUp
                : warmUp // ignore: cast_nullable_to_non_nullable
                      as String?,
            cooldown: freezed == cooldown
                ? _value.cooldown
                : cooldown // ignore: cast_nullable_to_non_nullable
                      as String?,
            loadMultiplier: freezed == loadMultiplier
                ? _value.loadMultiplier
                : loadMultiplier // ignore: cast_nullable_to_non_nullable
                      as double?,
            targetSets: freezed == targetSets
                ? _value.targetSets
                : targetSets // ignore: cast_nullable_to_non_nullable
                      as int?,
            isDeload: freezed == isDeload
                ? _value.isDeload
                : isDeload // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AiMonthlyPlanDayImplCopyWith<$Res>
    implements $AiMonthlyPlanDayCopyWith<$Res> {
  factory _$$AiMonthlyPlanDayImplCopyWith(
    _$AiMonthlyPlanDayImpl value,
    $Res Function(_$AiMonthlyPlanDayImpl) then,
  ) = __$$AiMonthlyPlanDayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String dayCode,
    String dayLabel,
    String type,
    String? preferredTime,
    String? preferredTimeLabel,
    String? templateId,
    String? templateTitle,
    String focus,
    List<String> exercises,
    int? estimatedMinutes,
    String? mobility,
    String? warmUp,
    String? cooldown,
    double? loadMultiplier,
    int? targetSets,
    bool? isDeload,
  });
}

/// @nodoc
class __$$AiMonthlyPlanDayImplCopyWithImpl<$Res>
    extends _$AiMonthlyPlanDayCopyWithImpl<$Res, _$AiMonthlyPlanDayImpl>
    implements _$$AiMonthlyPlanDayImplCopyWith<$Res> {
  __$$AiMonthlyPlanDayImplCopyWithImpl(
    _$AiMonthlyPlanDayImpl _value,
    $Res Function(_$AiMonthlyPlanDayImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayCode = null,
    Object? dayLabel = null,
    Object? type = null,
    Object? preferredTime = freezed,
    Object? preferredTimeLabel = freezed,
    Object? templateId = freezed,
    Object? templateTitle = freezed,
    Object? focus = null,
    Object? exercises = null,
    Object? estimatedMinutes = freezed,
    Object? mobility = freezed,
    Object? warmUp = freezed,
    Object? cooldown = freezed,
    Object? loadMultiplier = freezed,
    Object? targetSets = freezed,
    Object? isDeload = freezed,
  }) {
    return _then(
      _$AiMonthlyPlanDayImpl(
        dayCode: null == dayCode
            ? _value.dayCode
            : dayCode // ignore: cast_nullable_to_non_nullable
                  as String,
        dayLabel: null == dayLabel
            ? _value.dayLabel
            : dayLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        preferredTime: freezed == preferredTime
            ? _value.preferredTime
            : preferredTime // ignore: cast_nullable_to_non_nullable
                  as String?,
        preferredTimeLabel: freezed == preferredTimeLabel
            ? _value.preferredTimeLabel
            : preferredTimeLabel // ignore: cast_nullable_to_non_nullable
                  as String?,
        templateId: freezed == templateId
            ? _value.templateId
            : templateId // ignore: cast_nullable_to_non_nullable
                  as String?,
        templateTitle: freezed == templateTitle
            ? _value.templateTitle
            : templateTitle // ignore: cast_nullable_to_non_nullable
                  as String?,
        focus: null == focus
            ? _value.focus
            : focus // ignore: cast_nullable_to_non_nullable
                  as String,
        exercises: null == exercises
            ? _value._exercises
            : exercises // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        estimatedMinutes: freezed == estimatedMinutes
            ? _value.estimatedMinutes
            : estimatedMinutes // ignore: cast_nullable_to_non_nullable
                  as int?,
        mobility: freezed == mobility
            ? _value.mobility
            : mobility // ignore: cast_nullable_to_non_nullable
                  as String?,
        warmUp: freezed == warmUp
            ? _value.warmUp
            : warmUp // ignore: cast_nullable_to_non_nullable
                  as String?,
        cooldown: freezed == cooldown
            ? _value.cooldown
            : cooldown // ignore: cast_nullable_to_non_nullable
                  as String?,
        loadMultiplier: freezed == loadMultiplier
            ? _value.loadMultiplier
            : loadMultiplier // ignore: cast_nullable_to_non_nullable
                  as double?,
        targetSets: freezed == targetSets
            ? _value.targetSets
            : targetSets // ignore: cast_nullable_to_non_nullable
                  as int?,
        isDeload: freezed == isDeload
            ? _value.isDeload
            : isDeload // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AiMonthlyPlanDayImpl implements _AiMonthlyPlanDay {
  const _$AiMonthlyPlanDayImpl({
    required this.dayCode,
    required this.dayLabel,
    required this.type,
    this.preferredTime,
    this.preferredTimeLabel,
    this.templateId,
    this.templateTitle,
    required this.focus,
    final List<String> exercises = const [],
    this.estimatedMinutes,
    this.mobility,
    this.warmUp,
    this.cooldown,
    this.loadMultiplier,
    this.targetSets,
    this.isDeload,
  }) : _exercises = exercises;

  factory _$AiMonthlyPlanDayImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiMonthlyPlanDayImplFromJson(json);

  @override
  final String dayCode;
  @override
  final String dayLabel;
  @override
  final String type;
  @override
  final String? preferredTime;
  @override
  final String? preferredTimeLabel;
  @override
  final String? templateId;
  @override
  final String? templateTitle;
  @override
  final String focus;
  final List<String> _exercises;
  @override
  @JsonKey()
  List<String> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  @override
  final int? estimatedMinutes;
  @override
  final String? mobility;
  @override
  final String? warmUp;
  @override
  final String? cooldown;
  @override
  final double? loadMultiplier;
  @override
  final int? targetSets;
  @override
  final bool? isDeload;

  @override
  String toString() {
    return 'AiMonthlyPlanDay(dayCode: $dayCode, dayLabel: $dayLabel, type: $type, preferredTime: $preferredTime, preferredTimeLabel: $preferredTimeLabel, templateId: $templateId, templateTitle: $templateTitle, focus: $focus, exercises: $exercises, estimatedMinutes: $estimatedMinutes, mobility: $mobility, warmUp: $warmUp, cooldown: $cooldown, loadMultiplier: $loadMultiplier, targetSets: $targetSets, isDeload: $isDeload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiMonthlyPlanDayImpl &&
            (identical(other.dayCode, dayCode) || other.dayCode == dayCode) &&
            (identical(other.dayLabel, dayLabel) ||
                other.dayLabel == dayLabel) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.preferredTime, preferredTime) ||
                other.preferredTime == preferredTime) &&
            (identical(other.preferredTimeLabel, preferredTimeLabel) ||
                other.preferredTimeLabel == preferredTimeLabel) &&
            (identical(other.templateId, templateId) ||
                other.templateId == templateId) &&
            (identical(other.templateTitle, templateTitle) ||
                other.templateTitle == templateTitle) &&
            (identical(other.focus, focus) || other.focus == focus) &&
            const DeepCollectionEquality().equals(
              other._exercises,
              _exercises,
            ) &&
            (identical(other.estimatedMinutes, estimatedMinutes) ||
                other.estimatedMinutes == estimatedMinutes) &&
            (identical(other.mobility, mobility) ||
                other.mobility == mobility) &&
            (identical(other.warmUp, warmUp) || other.warmUp == warmUp) &&
            (identical(other.cooldown, cooldown) ||
                other.cooldown == cooldown) &&
            (identical(other.loadMultiplier, loadMultiplier) ||
                other.loadMultiplier == loadMultiplier) &&
            (identical(other.targetSets, targetSets) ||
                other.targetSets == targetSets) &&
            (identical(other.isDeload, isDeload) ||
                other.isDeload == isDeload));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    dayCode,
    dayLabel,
    type,
    preferredTime,
    preferredTimeLabel,
    templateId,
    templateTitle,
    focus,
    const DeepCollectionEquality().hash(_exercises),
    estimatedMinutes,
    mobility,
    warmUp,
    cooldown,
    loadMultiplier,
    targetSets,
    isDeload,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AiMonthlyPlanDayImplCopyWith<_$AiMonthlyPlanDayImpl> get copyWith =>
      __$$AiMonthlyPlanDayImplCopyWithImpl<_$AiMonthlyPlanDayImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AiMonthlyPlanDayImplToJson(this);
  }
}

abstract class _AiMonthlyPlanDay implements AiMonthlyPlanDay {
  const factory _AiMonthlyPlanDay({
    required final String dayCode,
    required final String dayLabel,
    required final String type,
    final String? preferredTime,
    final String? preferredTimeLabel,
    final String? templateId,
    final String? templateTitle,
    required final String focus,
    final List<String> exercises,
    final int? estimatedMinutes,
    final String? mobility,
    final String? warmUp,
    final String? cooldown,
    final double? loadMultiplier,
    final int? targetSets,
    final bool? isDeload,
  }) = _$AiMonthlyPlanDayImpl;

  factory _AiMonthlyPlanDay.fromJson(Map<String, dynamic> json) =
      _$AiMonthlyPlanDayImpl.fromJson;

  @override
  String get dayCode;
  @override
  String get dayLabel;
  @override
  String get type;
  @override
  String? get preferredTime;
  @override
  String? get preferredTimeLabel;
  @override
  String? get templateId;
  @override
  String? get templateTitle;
  @override
  String get focus;
  @override
  List<String> get exercises;
  @override
  int? get estimatedMinutes;
  @override
  String? get mobility;
  @override
  String? get warmUp;
  @override
  String? get cooldown;
  @override
  double? get loadMultiplier;
  @override
  int? get targetSets;
  @override
  bool? get isDeload;
  @override
  @JsonKey(ignore: true)
  _$$AiMonthlyPlanDayImplCopyWith<_$AiMonthlyPlanDayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AiReassessment _$AiReassessmentFromJson(Map<String, dynamic> json) {
  return _AiReassessment.fromJson(json);
}

/// @nodoc
mixin _$AiReassessment {
  int get dueAfterDays => throw _privateConstructorUsedError;
  String get promptTitle => throw _privateConstructorUsedError;
  String get summary => throw _privateConstructorUsedError;
  List<String> get questions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AiReassessmentCopyWith<AiReassessment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiReassessmentCopyWith<$Res> {
  factory $AiReassessmentCopyWith(
    AiReassessment value,
    $Res Function(AiReassessment) then,
  ) = _$AiReassessmentCopyWithImpl<$Res, AiReassessment>;
  @useResult
  $Res call({
    int dueAfterDays,
    String promptTitle,
    String summary,
    List<String> questions,
  });
}

/// @nodoc
class _$AiReassessmentCopyWithImpl<$Res, $Val extends AiReassessment>
    implements $AiReassessmentCopyWith<$Res> {
  _$AiReassessmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dueAfterDays = null,
    Object? promptTitle = null,
    Object? summary = null,
    Object? questions = null,
  }) {
    return _then(
      _value.copyWith(
            dueAfterDays: null == dueAfterDays
                ? _value.dueAfterDays
                : dueAfterDays // ignore: cast_nullable_to_non_nullable
                      as int,
            promptTitle: null == promptTitle
                ? _value.promptTitle
                : promptTitle // ignore: cast_nullable_to_non_nullable
                      as String,
            summary: null == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                      as String,
            questions: null == questions
                ? _value.questions
                : questions // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AiReassessmentImplCopyWith<$Res>
    implements $AiReassessmentCopyWith<$Res> {
  factory _$$AiReassessmentImplCopyWith(
    _$AiReassessmentImpl value,
    $Res Function(_$AiReassessmentImpl) then,
  ) = __$$AiReassessmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int dueAfterDays,
    String promptTitle,
    String summary,
    List<String> questions,
  });
}

/// @nodoc
class __$$AiReassessmentImplCopyWithImpl<$Res>
    extends _$AiReassessmentCopyWithImpl<$Res, _$AiReassessmentImpl>
    implements _$$AiReassessmentImplCopyWith<$Res> {
  __$$AiReassessmentImplCopyWithImpl(
    _$AiReassessmentImpl _value,
    $Res Function(_$AiReassessmentImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dueAfterDays = null,
    Object? promptTitle = null,
    Object? summary = null,
    Object? questions = null,
  }) {
    return _then(
      _$AiReassessmentImpl(
        dueAfterDays: null == dueAfterDays
            ? _value.dueAfterDays
            : dueAfterDays // ignore: cast_nullable_to_non_nullable
                  as int,
        promptTitle: null == promptTitle
            ? _value.promptTitle
            : promptTitle // ignore: cast_nullable_to_non_nullable
                  as String,
        summary: null == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as String,
        questions: null == questions
            ? _value._questions
            : questions // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AiReassessmentImpl implements _AiReassessment {
  const _$AiReassessmentImpl({
    required this.dueAfterDays,
    required this.promptTitle,
    required this.summary,
    final List<String> questions = const [],
  }) : _questions = questions;

  factory _$AiReassessmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiReassessmentImplFromJson(json);

  @override
  final int dueAfterDays;
  @override
  final String promptTitle;
  @override
  final String summary;
  final List<String> _questions;
  @override
  @JsonKey()
  List<String> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  @override
  String toString() {
    return 'AiReassessment(dueAfterDays: $dueAfterDays, promptTitle: $promptTitle, summary: $summary, questions: $questions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiReassessmentImpl &&
            (identical(other.dueAfterDays, dueAfterDays) ||
                other.dueAfterDays == dueAfterDays) &&
            (identical(other.promptTitle, promptTitle) ||
                other.promptTitle == promptTitle) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            const DeepCollectionEquality().equals(
              other._questions,
              _questions,
            ));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    dueAfterDays,
    promptTitle,
    summary,
    const DeepCollectionEquality().hash(_questions),
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AiReassessmentImplCopyWith<_$AiReassessmentImpl> get copyWith =>
      __$$AiReassessmentImplCopyWithImpl<_$AiReassessmentImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AiReassessmentImplToJson(this);
  }
}

abstract class _AiReassessment implements AiReassessment {
  const factory _AiReassessment({
    required final int dueAfterDays,
    required final String promptTitle,
    required final String summary,
    final List<String> questions,
  }) = _$AiReassessmentImpl;

  factory _AiReassessment.fromJson(Map<String, dynamic> json) =
      _$AiReassessmentImpl.fromJson;

  @override
  int get dueAfterDays;
  @override
  String get promptTitle;
  @override
  String get summary;
  @override
  List<String> get questions;
  @override
  @JsonKey(ignore: true)
  _$$AiReassessmentImplCopyWith<_$AiReassessmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
