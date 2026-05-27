// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_create_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WorkoutSet _$WorkoutSetFromJson(Map<String, dynamic> json) {
  return _WorkoutSet.fromJson(json);
}

/// @nodoc
mixin _$WorkoutSet {
  int get order => throw _privateConstructorUsedError;
  int? get reps => throw _privateConstructorUsedError;
  double? get weightKg => throw _privateConstructorUsedError;
  int? get durationSeconds => throw _privateConstructorUsedError;
  int? get restSeconds => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkoutSetCopyWith<WorkoutSet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutSetCopyWith<$Res> {
  factory $WorkoutSetCopyWith(
    WorkoutSet value,
    $Res Function(WorkoutSet) then,
  ) = _$WorkoutSetCopyWithImpl<$Res, WorkoutSet>;
  @useResult
  $Res call({
    int order,
    int? reps,
    double? weightKg,
    int? durationSeconds,
    int? restSeconds,
    bool isCompleted,
  });
}

/// @nodoc
class _$WorkoutSetCopyWithImpl<$Res, $Val extends WorkoutSet>
    implements $WorkoutSetCopyWith<$Res> {
  _$WorkoutSetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = null,
    Object? reps = freezed,
    Object? weightKg = freezed,
    Object? durationSeconds = freezed,
    Object? restSeconds = freezed,
    Object? isCompleted = null,
  }) {
    return _then(
      _value.copyWith(
            order: null == order
                ? _value.order
                : order // ignore: cast_nullable_to_non_nullable
                      as int,
            reps: freezed == reps
                ? _value.reps
                : reps // ignore: cast_nullable_to_non_nullable
                      as int?,
            weightKg: freezed == weightKg
                ? _value.weightKg
                : weightKg // ignore: cast_nullable_to_non_nullable
                      as double?,
            durationSeconds: freezed == durationSeconds
                ? _value.durationSeconds
                : durationSeconds // ignore: cast_nullable_to_non_nullable
                      as int?,
            restSeconds: freezed == restSeconds
                ? _value.restSeconds
                : restSeconds // ignore: cast_nullable_to_non_nullable
                      as int?,
            isCompleted: null == isCompleted
                ? _value.isCompleted
                : isCompleted // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkoutSetImplCopyWith<$Res>
    implements $WorkoutSetCopyWith<$Res> {
  factory _$$WorkoutSetImplCopyWith(
    _$WorkoutSetImpl value,
    $Res Function(_$WorkoutSetImpl) then,
  ) = __$$WorkoutSetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int order,
    int? reps,
    double? weightKg,
    int? durationSeconds,
    int? restSeconds,
    bool isCompleted,
  });
}

/// @nodoc
class __$$WorkoutSetImplCopyWithImpl<$Res>
    extends _$WorkoutSetCopyWithImpl<$Res, _$WorkoutSetImpl>
    implements _$$WorkoutSetImplCopyWith<$Res> {
  __$$WorkoutSetImplCopyWithImpl(
    _$WorkoutSetImpl _value,
    $Res Function(_$WorkoutSetImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = null,
    Object? reps = freezed,
    Object? weightKg = freezed,
    Object? durationSeconds = freezed,
    Object? restSeconds = freezed,
    Object? isCompleted = null,
  }) {
    return _then(
      _$WorkoutSetImpl(
        order: null == order
            ? _value.order
            : order // ignore: cast_nullable_to_non_nullable
                  as int,
        reps: freezed == reps
            ? _value.reps
            : reps // ignore: cast_nullable_to_non_nullable
                  as int?,
        weightKg: freezed == weightKg
            ? _value.weightKg
            : weightKg // ignore: cast_nullable_to_non_nullable
                  as double?,
        durationSeconds: freezed == durationSeconds
            ? _value.durationSeconds
            : durationSeconds // ignore: cast_nullable_to_non_nullable
                  as int?,
        restSeconds: freezed == restSeconds
            ? _value.restSeconds
            : restSeconds // ignore: cast_nullable_to_non_nullable
                  as int?,
        isCompleted: null == isCompleted
            ? _value.isCompleted
            : isCompleted // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutSetImpl implements _WorkoutSet {
  const _$WorkoutSetImpl({
    required this.order,
    this.reps,
    this.weightKg,
    this.durationSeconds,
    this.restSeconds,
    this.isCompleted = false,
  });

  factory _$WorkoutSetImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutSetImplFromJson(json);

  @override
  final int order;
  @override
  final int? reps;
  @override
  final double? weightKg;
  @override
  final int? durationSeconds;
  @override
  final int? restSeconds;
  @override
  @JsonKey()
  final bool isCompleted;

  @override
  String toString() {
    return 'WorkoutSet(order: $order, reps: $reps, weightKg: $weightKg, durationSeconds: $durationSeconds, restSeconds: $restSeconds, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutSetImpl &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.reps, reps) || other.reps == reps) &&
            (identical(other.weightKg, weightKg) ||
                other.weightKg == weightKg) &&
            (identical(other.durationSeconds, durationSeconds) ||
                other.durationSeconds == durationSeconds) &&
            (identical(other.restSeconds, restSeconds) ||
                other.restSeconds == restSeconds) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    order,
    reps,
    weightKg,
    durationSeconds,
    restSeconds,
    isCompleted,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutSetImplCopyWith<_$WorkoutSetImpl> get copyWith =>
      __$$WorkoutSetImplCopyWithImpl<_$WorkoutSetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutSetImplToJson(this);
  }
}

abstract class _WorkoutSet implements WorkoutSet {
  const factory _WorkoutSet({
    required final int order,
    final int? reps,
    final double? weightKg,
    final int? durationSeconds,
    final int? restSeconds,
    final bool isCompleted,
  }) = _$WorkoutSetImpl;

  factory _WorkoutSet.fromJson(Map<String, dynamic> json) =
      _$WorkoutSetImpl.fromJson;

  @override
  int get order;
  @override
  int? get reps;
  @override
  double? get weightKg;
  @override
  int? get durationSeconds;
  @override
  int? get restSeconds;
  @override
  bool get isCompleted;
  @override
  @JsonKey(ignore: true)
  _$$WorkoutSetImplCopyWith<_$WorkoutSetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WorkoutItem _$WorkoutItemFromJson(Map<String, dynamic> json) {
  return _WorkoutItem.fromJson(json);
}

/// @nodoc
mixin _$WorkoutItem {
  String? get exerciseId => throw _privateConstructorUsedError;
  String? get exerciseName => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;
  int? get restSeconds => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  List<WorkoutSet> get sets => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkoutItemCopyWith<WorkoutItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutItemCopyWith<$Res> {
  factory $WorkoutItemCopyWith(
    WorkoutItem value,
    $Res Function(WorkoutItem) then,
  ) = _$WorkoutItemCopyWithImpl<$Res, WorkoutItem>;
  @useResult
  $Res call({
    String? exerciseId,
    String? exerciseName,
    int order,
    int? restSeconds,
    String? notes,
    List<WorkoutSet> sets,
  });
}

/// @nodoc
class _$WorkoutItemCopyWithImpl<$Res, $Val extends WorkoutItem>
    implements $WorkoutItemCopyWith<$Res> {
  _$WorkoutItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exerciseId = freezed,
    Object? exerciseName = freezed,
    Object? order = null,
    Object? restSeconds = freezed,
    Object? notes = freezed,
    Object? sets = null,
  }) {
    return _then(
      _value.copyWith(
            exerciseId: freezed == exerciseId
                ? _value.exerciseId
                : exerciseId // ignore: cast_nullable_to_non_nullable
                      as String?,
            exerciseName: freezed == exerciseName
                ? _value.exerciseName
                : exerciseName // ignore: cast_nullable_to_non_nullable
                      as String?,
            order: null == order
                ? _value.order
                : order // ignore: cast_nullable_to_non_nullable
                      as int,
            restSeconds: freezed == restSeconds
                ? _value.restSeconds
                : restSeconds // ignore: cast_nullable_to_non_nullable
                      as int?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            sets: null == sets
                ? _value.sets
                : sets // ignore: cast_nullable_to_non_nullable
                      as List<WorkoutSet>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkoutItemImplCopyWith<$Res>
    implements $WorkoutItemCopyWith<$Res> {
  factory _$$WorkoutItemImplCopyWith(
    _$WorkoutItemImpl value,
    $Res Function(_$WorkoutItemImpl) then,
  ) = __$$WorkoutItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? exerciseId,
    String? exerciseName,
    int order,
    int? restSeconds,
    String? notes,
    List<WorkoutSet> sets,
  });
}

/// @nodoc
class __$$WorkoutItemImplCopyWithImpl<$Res>
    extends _$WorkoutItemCopyWithImpl<$Res, _$WorkoutItemImpl>
    implements _$$WorkoutItemImplCopyWith<$Res> {
  __$$WorkoutItemImplCopyWithImpl(
    _$WorkoutItemImpl _value,
    $Res Function(_$WorkoutItemImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exerciseId = freezed,
    Object? exerciseName = freezed,
    Object? order = null,
    Object? restSeconds = freezed,
    Object? notes = freezed,
    Object? sets = null,
  }) {
    return _then(
      _$WorkoutItemImpl(
        exerciseId: freezed == exerciseId
            ? _value.exerciseId
            : exerciseId // ignore: cast_nullable_to_non_nullable
                  as String?,
        exerciseName: freezed == exerciseName
            ? _value.exerciseName
            : exerciseName // ignore: cast_nullable_to_non_nullable
                  as String?,
        order: null == order
            ? _value.order
            : order // ignore: cast_nullable_to_non_nullable
                  as int,
        restSeconds: freezed == restSeconds
            ? _value.restSeconds
            : restSeconds // ignore: cast_nullable_to_non_nullable
                  as int?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        sets: null == sets
            ? _value._sets
            : sets // ignore: cast_nullable_to_non_nullable
                  as List<WorkoutSet>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutItemImpl implements _WorkoutItem {
  const _$WorkoutItemImpl({
    this.exerciseId,
    this.exerciseName,
    required this.order,
    this.restSeconds,
    this.notes,
    final List<WorkoutSet> sets = const [],
  }) : _sets = sets;

  factory _$WorkoutItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutItemImplFromJson(json);

  @override
  final String? exerciseId;
  @override
  final String? exerciseName;
  @override
  final int order;
  @override
  final int? restSeconds;
  @override
  final String? notes;
  final List<WorkoutSet> _sets;
  @override
  @JsonKey()
  List<WorkoutSet> get sets {
    if (_sets is EqualUnmodifiableListView) return _sets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sets);
  }

  @override
  String toString() {
    return 'WorkoutItem(exerciseId: $exerciseId, exerciseName: $exerciseName, order: $order, restSeconds: $restSeconds, notes: $notes, sets: $sets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutItemImpl &&
            (identical(other.exerciseId, exerciseId) ||
                other.exerciseId == exerciseId) &&
            (identical(other.exerciseName, exerciseName) ||
                other.exerciseName == exerciseName) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.restSeconds, restSeconds) ||
                other.restSeconds == restSeconds) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality().equals(other._sets, _sets));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    exerciseId,
    exerciseName,
    order,
    restSeconds,
    notes,
    const DeepCollectionEquality().hash(_sets),
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutItemImplCopyWith<_$WorkoutItemImpl> get copyWith =>
      __$$WorkoutItemImplCopyWithImpl<_$WorkoutItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutItemImplToJson(this);
  }
}

abstract class _WorkoutItem implements WorkoutItem {
  const factory _WorkoutItem({
    final String? exerciseId,
    final String? exerciseName,
    required final int order,
    final int? restSeconds,
    final String? notes,
    final List<WorkoutSet> sets,
  }) = _$WorkoutItemImpl;

  factory _WorkoutItem.fromJson(Map<String, dynamic> json) =
      _$WorkoutItemImpl.fromJson;

  @override
  String? get exerciseId;
  @override
  String? get exerciseName;
  @override
  int get order;
  @override
  int? get restSeconds;
  @override
  String? get notes;
  @override
  List<WorkoutSet> get sets;
  @override
  @JsonKey(ignore: true)
  _$$WorkoutItemImplCopyWith<_$WorkoutItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateWorkoutRequest _$CreateWorkoutRequestFromJson(Map<String, dynamic> json) {
  return _CreateWorkoutRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateWorkoutRequest {
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool get isTemplate => throw _privateConstructorUsedError;
  DateTime? get scheduledFor => throw _privateConstructorUsedError;
  List<WorkoutScheduleDay> get scheduledDays =>
      throw _privateConstructorUsedError;
  int? get durationMinutes => throw _privateConstructorUsedError;
  WorkoutDifficulty? get difficulty => throw _privateConstructorUsedError;
  WorkoutGoal? get goal => throw _privateConstructorUsedError;
  WorkoutStatus get status => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  List<WorkoutItem> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateWorkoutRequestCopyWith<CreateWorkoutRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateWorkoutRequestCopyWith<$Res> {
  factory $CreateWorkoutRequestCopyWith(
    CreateWorkoutRequest value,
    $Res Function(CreateWorkoutRequest) then,
  ) = _$CreateWorkoutRequestCopyWithImpl<$Res, CreateWorkoutRequest>;
  @useResult
  $Res call({
    String title,
    String? description,
    bool isTemplate,
    DateTime? scheduledFor,
    List<WorkoutScheduleDay> scheduledDays,
    int? durationMinutes,
    WorkoutDifficulty? difficulty,
    WorkoutGoal? goal,
    WorkoutStatus status,
    String? notes,
    List<WorkoutItem> items,
  });
}

/// @nodoc
class _$CreateWorkoutRequestCopyWithImpl<
  $Res,
  $Val extends CreateWorkoutRequest
>
    implements $CreateWorkoutRequestCopyWith<$Res> {
  _$CreateWorkoutRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = freezed,
    Object? isTemplate = null,
    Object? scheduledFor = freezed,
    Object? scheduledDays = null,
    Object? durationMinutes = freezed,
    Object? difficulty = freezed,
    Object? goal = freezed,
    Object? status = null,
    Object? notes = freezed,
    Object? items = null,
  }) {
    return _then(
      _value.copyWith(
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            isTemplate: null == isTemplate
                ? _value.isTemplate
                : isTemplate // ignore: cast_nullable_to_non_nullable
                      as bool,
            scheduledFor: freezed == scheduledFor
                ? _value.scheduledFor
                : scheduledFor // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            scheduledDays: null == scheduledDays
                ? _value.scheduledDays
                : scheduledDays // ignore: cast_nullable_to_non_nullable
                      as List<WorkoutScheduleDay>,
            durationMinutes: freezed == durationMinutes
                ? _value.durationMinutes
                : durationMinutes // ignore: cast_nullable_to_non_nullable
                      as int?,
            difficulty: freezed == difficulty
                ? _value.difficulty
                : difficulty // ignore: cast_nullable_to_non_nullable
                      as WorkoutDifficulty?,
            goal: freezed == goal
                ? _value.goal
                : goal // ignore: cast_nullable_to_non_nullable
                      as WorkoutGoal?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as WorkoutStatus,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<WorkoutItem>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateWorkoutRequestImplCopyWith<$Res>
    implements $CreateWorkoutRequestCopyWith<$Res> {
  factory _$$CreateWorkoutRequestImplCopyWith(
    _$CreateWorkoutRequestImpl value,
    $Res Function(_$CreateWorkoutRequestImpl) then,
  ) = __$$CreateWorkoutRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String title,
    String? description,
    bool isTemplate,
    DateTime? scheduledFor,
    List<WorkoutScheduleDay> scheduledDays,
    int? durationMinutes,
    WorkoutDifficulty? difficulty,
    WorkoutGoal? goal,
    WorkoutStatus status,
    String? notes,
    List<WorkoutItem> items,
  });
}

/// @nodoc
class __$$CreateWorkoutRequestImplCopyWithImpl<$Res>
    extends _$CreateWorkoutRequestCopyWithImpl<$Res, _$CreateWorkoutRequestImpl>
    implements _$$CreateWorkoutRequestImplCopyWith<$Res> {
  __$$CreateWorkoutRequestImplCopyWithImpl(
    _$CreateWorkoutRequestImpl _value,
    $Res Function(_$CreateWorkoutRequestImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = freezed,
    Object? isTemplate = null,
    Object? scheduledFor = freezed,
    Object? scheduledDays = null,
    Object? durationMinutes = freezed,
    Object? difficulty = freezed,
    Object? goal = freezed,
    Object? status = null,
    Object? notes = freezed,
    Object? items = null,
  }) {
    return _then(
      _$CreateWorkoutRequestImpl(
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        isTemplate: null == isTemplate
            ? _value.isTemplate
            : isTemplate // ignore: cast_nullable_to_non_nullable
                  as bool,
        scheduledFor: freezed == scheduledFor
            ? _value.scheduledFor
            : scheduledFor // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        scheduledDays: null == scheduledDays
            ? _value._scheduledDays
            : scheduledDays // ignore: cast_nullable_to_non_nullable
                  as List<WorkoutScheduleDay>,
        durationMinutes: freezed == durationMinutes
            ? _value.durationMinutes
            : durationMinutes // ignore: cast_nullable_to_non_nullable
                  as int?,
        difficulty: freezed == difficulty
            ? _value.difficulty
            : difficulty // ignore: cast_nullable_to_non_nullable
                  as WorkoutDifficulty?,
        goal: freezed == goal
            ? _value.goal
            : goal // ignore: cast_nullable_to_non_nullable
                  as WorkoutGoal?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as WorkoutStatus,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<WorkoutItem>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateWorkoutRequestImpl implements _CreateWorkoutRequest {
  const _$CreateWorkoutRequestImpl({
    required this.title,
    this.description,
    this.isTemplate = false,
    this.scheduledFor,
    final List<WorkoutScheduleDay> scheduledDays = const [],
    this.durationMinutes,
    this.difficulty,
    this.goal,
    this.status = WorkoutStatus.draft,
    this.notes,
    final List<WorkoutItem> items = const [],
  }) : _scheduledDays = scheduledDays,
       _items = items;

  factory _$CreateWorkoutRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateWorkoutRequestImplFromJson(json);

  @override
  final String title;
  @override
  final String? description;
  @override
  @JsonKey()
  final bool isTemplate;
  @override
  final DateTime? scheduledFor;
  final List<WorkoutScheduleDay> _scheduledDays;
  @override
  @JsonKey()
  List<WorkoutScheduleDay> get scheduledDays {
    if (_scheduledDays is EqualUnmodifiableListView) return _scheduledDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scheduledDays);
  }

  @override
  final int? durationMinutes;
  @override
  final WorkoutDifficulty? difficulty;
  @override
  final WorkoutGoal? goal;
  @override
  @JsonKey()
  final WorkoutStatus status;
  @override
  final String? notes;
  final List<WorkoutItem> _items;
  @override
  @JsonKey()
  List<WorkoutItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'CreateWorkoutRequest(title: $title, description: $description, isTemplate: $isTemplate, scheduledFor: $scheduledFor, scheduledDays: $scheduledDays, durationMinutes: $durationMinutes, difficulty: $difficulty, goal: $goal, status: $status, notes: $notes, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateWorkoutRequestImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isTemplate, isTemplate) ||
                other.isTemplate == isTemplate) &&
            (identical(other.scheduledFor, scheduledFor) ||
                other.scheduledFor == scheduledFor) &&
            const DeepCollectionEquality().equals(
              other._scheduledDays,
              _scheduledDays,
            ) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.goal, goal) || other.goal == goal) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    title,
    description,
    isTemplate,
    scheduledFor,
    const DeepCollectionEquality().hash(_scheduledDays),
    durationMinutes,
    difficulty,
    goal,
    status,
    notes,
    const DeepCollectionEquality().hash(_items),
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateWorkoutRequestImplCopyWith<_$CreateWorkoutRequestImpl>
  get copyWith =>
      __$$CreateWorkoutRequestImplCopyWithImpl<_$CreateWorkoutRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateWorkoutRequestImplToJson(this);
  }
}

abstract class _CreateWorkoutRequest implements CreateWorkoutRequest {
  const factory _CreateWorkoutRequest({
    required final String title,
    final String? description,
    final bool isTemplate,
    final DateTime? scheduledFor,
    final List<WorkoutScheduleDay> scheduledDays,
    final int? durationMinutes,
    final WorkoutDifficulty? difficulty,
    final WorkoutGoal? goal,
    final WorkoutStatus status,
    final String? notes,
    final List<WorkoutItem> items,
  }) = _$CreateWorkoutRequestImpl;

  factory _CreateWorkoutRequest.fromJson(Map<String, dynamic> json) =
      _$CreateWorkoutRequestImpl.fromJson;

  @override
  String get title;
  @override
  String? get description;
  @override
  bool get isTemplate;
  @override
  DateTime? get scheduledFor;
  @override
  List<WorkoutScheduleDay> get scheduledDays;
  @override
  int? get durationMinutes;
  @override
  WorkoutDifficulty? get difficulty;
  @override
  WorkoutGoal? get goal;
  @override
  WorkoutStatus get status;
  @override
  String? get notes;
  @override
  List<WorkoutItem> get items;
  @override
  @JsonKey(ignore: true)
  _$$CreateWorkoutRequestImplCopyWith<_$CreateWorkoutRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}

CreateExerciseRequest _$CreateExerciseRequestFromJson(
  Map<String, dynamic> json,
) {
  return _CreateExerciseRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateExerciseRequest {
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<String> get muscleGroups => throw _privateConstructorUsedError;
  String get equipment => throw _privateConstructorUsedError;
  String get difficulty => throw _privateConstructorUsedError;
  List<String> get instructions => throw _privateConstructorUsedError;
  List<String> get safetyNotes => throw _privateConstructorUsedError;
  String? get videoUrl => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String get visibility => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateExerciseRequestCopyWith<CreateExerciseRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateExerciseRequestCopyWith<$Res> {
  factory $CreateExerciseRequestCopyWith(
    CreateExerciseRequest value,
    $Res Function(CreateExerciseRequest) then,
  ) = _$CreateExerciseRequestCopyWithImpl<$Res, CreateExerciseRequest>;
  @useResult
  $Res call({
    String name,
    String? description,
    List<String> muscleGroups,
    String equipment,
    String difficulty,
    List<String> instructions,
    List<String> safetyNotes,
    String? videoUrl,
    String? imageUrl,
    String visibility,
  });
}

/// @nodoc
class _$CreateExerciseRequestCopyWithImpl<
  $Res,
  $Val extends CreateExerciseRequest
>
    implements $CreateExerciseRequestCopyWith<$Res> {
  _$CreateExerciseRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? muscleGroups = null,
    Object? equipment = null,
    Object? difficulty = null,
    Object? instructions = null,
    Object? safetyNotes = null,
    Object? videoUrl = freezed,
    Object? imageUrl = freezed,
    Object? visibility = null,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            muscleGroups: null == muscleGroups
                ? _value.muscleGroups
                : muscleGroups // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            equipment: null == equipment
                ? _value.equipment
                : equipment // ignore: cast_nullable_to_non_nullable
                      as String,
            difficulty: null == difficulty
                ? _value.difficulty
                : difficulty // ignore: cast_nullable_to_non_nullable
                      as String,
            instructions: null == instructions
                ? _value.instructions
                : instructions // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            safetyNotes: null == safetyNotes
                ? _value.safetyNotes
                : safetyNotes // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            videoUrl: freezed == videoUrl
                ? _value.videoUrl
                : videoUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            imageUrl: freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            visibility: null == visibility
                ? _value.visibility
                : visibility // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateExerciseRequestImplCopyWith<$Res>
    implements $CreateExerciseRequestCopyWith<$Res> {
  factory _$$CreateExerciseRequestImplCopyWith(
    _$CreateExerciseRequestImpl value,
    $Res Function(_$CreateExerciseRequestImpl) then,
  ) = __$$CreateExerciseRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    String? description,
    List<String> muscleGroups,
    String equipment,
    String difficulty,
    List<String> instructions,
    List<String> safetyNotes,
    String? videoUrl,
    String? imageUrl,
    String visibility,
  });
}

/// @nodoc
class __$$CreateExerciseRequestImplCopyWithImpl<$Res>
    extends
        _$CreateExerciseRequestCopyWithImpl<$Res, _$CreateExerciseRequestImpl>
    implements _$$CreateExerciseRequestImplCopyWith<$Res> {
  __$$CreateExerciseRequestImplCopyWithImpl(
    _$CreateExerciseRequestImpl _value,
    $Res Function(_$CreateExerciseRequestImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? muscleGroups = null,
    Object? equipment = null,
    Object? difficulty = null,
    Object? instructions = null,
    Object? safetyNotes = null,
    Object? videoUrl = freezed,
    Object? imageUrl = freezed,
    Object? visibility = null,
  }) {
    return _then(
      _$CreateExerciseRequestImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        muscleGroups: null == muscleGroups
            ? _value._muscleGroups
            : muscleGroups // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        equipment: null == equipment
            ? _value.equipment
            : equipment // ignore: cast_nullable_to_non_nullable
                  as String,
        difficulty: null == difficulty
            ? _value.difficulty
            : difficulty // ignore: cast_nullable_to_non_nullable
                  as String,
        instructions: null == instructions
            ? _value._instructions
            : instructions // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        safetyNotes: null == safetyNotes
            ? _value._safetyNotes
            : safetyNotes // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        videoUrl: freezed == videoUrl
            ? _value.videoUrl
            : videoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        imageUrl: freezed == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        visibility: null == visibility
            ? _value.visibility
            : visibility // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateExerciseRequestImpl implements _CreateExerciseRequest {
  const _$CreateExerciseRequestImpl({
    required this.name,
    this.description,
    final List<String> muscleGroups = const [],
    required this.equipment,
    required this.difficulty,
    final List<String> instructions = const [],
    final List<String> safetyNotes = const [],
    this.videoUrl,
    this.imageUrl,
    this.visibility = 'private',
  }) : _muscleGroups = muscleGroups,
       _instructions = instructions,
       _safetyNotes = safetyNotes;

  factory _$CreateExerciseRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateExerciseRequestImplFromJson(json);

  @override
  final String name;
  @override
  final String? description;
  final List<String> _muscleGroups;
  @override
  @JsonKey()
  List<String> get muscleGroups {
    if (_muscleGroups is EqualUnmodifiableListView) return _muscleGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_muscleGroups);
  }

  @override
  final String equipment;
  @override
  final String difficulty;
  final List<String> _instructions;
  @override
  @JsonKey()
  List<String> get instructions {
    if (_instructions is EqualUnmodifiableListView) return _instructions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_instructions);
  }

  final List<String> _safetyNotes;
  @override
  @JsonKey()
  List<String> get safetyNotes {
    if (_safetyNotes is EqualUnmodifiableListView) return _safetyNotes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_safetyNotes);
  }

  @override
  final String? videoUrl;
  @override
  final String? imageUrl;
  @override
  @JsonKey()
  final String visibility;

  @override
  String toString() {
    return 'CreateExerciseRequest(name: $name, description: $description, muscleGroups: $muscleGroups, equipment: $equipment, difficulty: $difficulty, instructions: $instructions, safetyNotes: $safetyNotes, videoUrl: $videoUrl, imageUrl: $imageUrl, visibility: $visibility)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateExerciseRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(
              other._muscleGroups,
              _muscleGroups,
            ) &&
            (identical(other.equipment, equipment) ||
                other.equipment == equipment) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            const DeepCollectionEquality().equals(
              other._instructions,
              _instructions,
            ) &&
            const DeepCollectionEquality().equals(
              other._safetyNotes,
              _safetyNotes,
            ) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    description,
    const DeepCollectionEquality().hash(_muscleGroups),
    equipment,
    difficulty,
    const DeepCollectionEquality().hash(_instructions),
    const DeepCollectionEquality().hash(_safetyNotes),
    videoUrl,
    imageUrl,
    visibility,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateExerciseRequestImplCopyWith<_$CreateExerciseRequestImpl>
  get copyWith =>
      __$$CreateExerciseRequestImplCopyWithImpl<_$CreateExerciseRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateExerciseRequestImplToJson(this);
  }
}

abstract class _CreateExerciseRequest implements CreateExerciseRequest {
  const factory _CreateExerciseRequest({
    required final String name,
    final String? description,
    final List<String> muscleGroups,
    required final String equipment,
    required final String difficulty,
    final List<String> instructions,
    final List<String> safetyNotes,
    final String? videoUrl,
    final String? imageUrl,
    final String visibility,
  }) = _$CreateExerciseRequestImpl;

  factory _CreateExerciseRequest.fromJson(Map<String, dynamic> json) =
      _$CreateExerciseRequestImpl.fromJson;

  @override
  String get name;
  @override
  String? get description;
  @override
  List<String> get muscleGroups;
  @override
  String get equipment;
  @override
  String get difficulty;
  @override
  List<String> get instructions;
  @override
  List<String> get safetyNotes;
  @override
  String? get videoUrl;
  @override
  String? get imageUrl;
  @override
  String get visibility;
  @override
  @JsonKey(ignore: true)
  _$$CreateExerciseRequestImplCopyWith<_$CreateExerciseRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}

Exercise _$ExerciseFromJson(Map<String, dynamic> json) {
  return _Exercise.fromJson(json);
}

/// @nodoc
mixin _$Exercise {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<String> get muscleGroups => throw _privateConstructorUsedError;
  String get equipment => throw _privateConstructorUsedError;
  String get difficulty => throw _privateConstructorUsedError;
  List<String> get instructions => throw _privateConstructorUsedError;
  List<String> get safetyNotes => throw _privateConstructorUsedError;
  String? get videoUrl => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String get visibility => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExerciseCopyWith<Exercise> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseCopyWith<$Res> {
  factory $ExerciseCopyWith(Exercise value, $Res Function(Exercise) then) =
      _$ExerciseCopyWithImpl<$Res, Exercise>;
  @useResult
  $Res call({
    String id,
    String name,
    String? description,
    List<String> muscleGroups,
    String equipment,
    String difficulty,
    List<String> instructions,
    List<String> safetyNotes,
    String? videoUrl,
    String? imageUrl,
    String visibility,
  });
}

/// @nodoc
class _$ExerciseCopyWithImpl<$Res, $Val extends Exercise>
    implements $ExerciseCopyWith<$Res> {
  _$ExerciseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? muscleGroups = null,
    Object? equipment = null,
    Object? difficulty = null,
    Object? instructions = null,
    Object? safetyNotes = null,
    Object? videoUrl = freezed,
    Object? imageUrl = freezed,
    Object? visibility = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            muscleGroups: null == muscleGroups
                ? _value.muscleGroups
                : muscleGroups // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            equipment: null == equipment
                ? _value.equipment
                : equipment // ignore: cast_nullable_to_non_nullable
                      as String,
            difficulty: null == difficulty
                ? _value.difficulty
                : difficulty // ignore: cast_nullable_to_non_nullable
                      as String,
            instructions: null == instructions
                ? _value.instructions
                : instructions // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            safetyNotes: null == safetyNotes
                ? _value.safetyNotes
                : safetyNotes // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            videoUrl: freezed == videoUrl
                ? _value.videoUrl
                : videoUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            imageUrl: freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            visibility: null == visibility
                ? _value.visibility
                : visibility // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ExerciseImplCopyWith<$Res>
    implements $ExerciseCopyWith<$Res> {
  factory _$$ExerciseImplCopyWith(
    _$ExerciseImpl value,
    $Res Function(_$ExerciseImpl) then,
  ) = __$$ExerciseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String? description,
    List<String> muscleGroups,
    String equipment,
    String difficulty,
    List<String> instructions,
    List<String> safetyNotes,
    String? videoUrl,
    String? imageUrl,
    String visibility,
  });
}

/// @nodoc
class __$$ExerciseImplCopyWithImpl<$Res>
    extends _$ExerciseCopyWithImpl<$Res, _$ExerciseImpl>
    implements _$$ExerciseImplCopyWith<$Res> {
  __$$ExerciseImplCopyWithImpl(
    _$ExerciseImpl _value,
    $Res Function(_$ExerciseImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? muscleGroups = null,
    Object? equipment = null,
    Object? difficulty = null,
    Object? instructions = null,
    Object? safetyNotes = null,
    Object? videoUrl = freezed,
    Object? imageUrl = freezed,
    Object? visibility = null,
  }) {
    return _then(
      _$ExerciseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        muscleGroups: null == muscleGroups
            ? _value._muscleGroups
            : muscleGroups // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        equipment: null == equipment
            ? _value.equipment
            : equipment // ignore: cast_nullable_to_non_nullable
                  as String,
        difficulty: null == difficulty
            ? _value.difficulty
            : difficulty // ignore: cast_nullable_to_non_nullable
                  as String,
        instructions: null == instructions
            ? _value._instructions
            : instructions // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        safetyNotes: null == safetyNotes
            ? _value._safetyNotes
            : safetyNotes // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        videoUrl: freezed == videoUrl
            ? _value.videoUrl
            : videoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        imageUrl: freezed == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        visibility: null == visibility
            ? _value.visibility
            : visibility // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ExerciseImpl implements _Exercise {
  const _$ExerciseImpl({
    required this.id,
    required this.name,
    this.description,
    final List<String> muscleGroups = const [],
    required this.equipment,
    required this.difficulty,
    final List<String> instructions = const [],
    final List<String> safetyNotes = const [],
    this.videoUrl,
    this.imageUrl,
    required this.visibility,
  }) : _muscleGroups = muscleGroups,
       _instructions = instructions,
       _safetyNotes = safetyNotes;

  factory _$ExerciseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? description;
  final List<String> _muscleGroups;
  @override
  @JsonKey()
  List<String> get muscleGroups {
    if (_muscleGroups is EqualUnmodifiableListView) return _muscleGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_muscleGroups);
  }

  @override
  final String equipment;
  @override
  final String difficulty;
  final List<String> _instructions;
  @override
  @JsonKey()
  List<String> get instructions {
    if (_instructions is EqualUnmodifiableListView) return _instructions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_instructions);
  }

  final List<String> _safetyNotes;
  @override
  @JsonKey()
  List<String> get safetyNotes {
    if (_safetyNotes is EqualUnmodifiableListView) return _safetyNotes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_safetyNotes);
  }

  @override
  final String? videoUrl;
  @override
  final String? imageUrl;
  @override
  final String visibility;

  @override
  String toString() {
    return 'Exercise(id: $id, name: $name, description: $description, muscleGroups: $muscleGroups, equipment: $equipment, difficulty: $difficulty, instructions: $instructions, safetyNotes: $safetyNotes, videoUrl: $videoUrl, imageUrl: $imageUrl, visibility: $visibility)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(
              other._muscleGroups,
              _muscleGroups,
            ) &&
            (identical(other.equipment, equipment) ||
                other.equipment == equipment) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            const DeepCollectionEquality().equals(
              other._instructions,
              _instructions,
            ) &&
            const DeepCollectionEquality().equals(
              other._safetyNotes,
              _safetyNotes,
            ) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    description,
    const DeepCollectionEquality().hash(_muscleGroups),
    equipment,
    difficulty,
    const DeepCollectionEquality().hash(_instructions),
    const DeepCollectionEquality().hash(_safetyNotes),
    videoUrl,
    imageUrl,
    visibility,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseImplCopyWith<_$ExerciseImpl> get copyWith =>
      __$$ExerciseImplCopyWithImpl<_$ExerciseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExerciseImplToJson(this);
  }
}

abstract class _Exercise implements Exercise {
  const factory _Exercise({
    required final String id,
    required final String name,
    final String? description,
    final List<String> muscleGroups,
    required final String equipment,
    required final String difficulty,
    final List<String> instructions,
    final List<String> safetyNotes,
    final String? videoUrl,
    final String? imageUrl,
    required final String visibility,
  }) = _$ExerciseImpl;

  factory _Exercise.fromJson(Map<String, dynamic> json) =
      _$ExerciseImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  List<String> get muscleGroups;
  @override
  String get equipment;
  @override
  String get difficulty;
  @override
  List<String> get instructions;
  @override
  List<String> get safetyNotes;
  @override
  String? get videoUrl;
  @override
  String? get imageUrl;
  @override
  String get visibility;
  @override
  @JsonKey(ignore: true)
  _$$ExerciseImplCopyWith<_$ExerciseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ExerciseCreateState {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get muscleGroups => throw _privateConstructorUsedError;
  String get equipment => throw _privateConstructorUsedError;
  String get difficulty => throw _privateConstructorUsedError;
  String get instructionsText => throw _privateConstructorUsedError;
  String get safetyNotesText => throw _privateConstructorUsedError;
  String get videoUrl => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get visibility => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExerciseCreateStateCopyWith<ExerciseCreateState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseCreateStateCopyWith<$Res> {
  factory $ExerciseCreateStateCopyWith(
    ExerciseCreateState value,
    $Res Function(ExerciseCreateState) then,
  ) = _$ExerciseCreateStateCopyWithImpl<$Res, ExerciseCreateState>;
  @useResult
  $Res call({
    String name,
    String description,
    List<String> muscleGroups,
    String equipment,
    String difficulty,
    String instructionsText,
    String safetyNotesText,
    String videoUrl,
    String imageUrl,
    String visibility,
    bool isSaving,
    String? errorMessage,
  });
}

/// @nodoc
class _$ExerciseCreateStateCopyWithImpl<$Res, $Val extends ExerciseCreateState>
    implements $ExerciseCreateStateCopyWith<$Res> {
  _$ExerciseCreateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? muscleGroups = null,
    Object? equipment = null,
    Object? difficulty = null,
    Object? instructionsText = null,
    Object? safetyNotesText = null,
    Object? videoUrl = null,
    Object? imageUrl = null,
    Object? visibility = null,
    Object? isSaving = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            muscleGroups: null == muscleGroups
                ? _value.muscleGroups
                : muscleGroups // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            equipment: null == equipment
                ? _value.equipment
                : equipment // ignore: cast_nullable_to_non_nullable
                      as String,
            difficulty: null == difficulty
                ? _value.difficulty
                : difficulty // ignore: cast_nullable_to_non_nullable
                      as String,
            instructionsText: null == instructionsText
                ? _value.instructionsText
                : instructionsText // ignore: cast_nullable_to_non_nullable
                      as String,
            safetyNotesText: null == safetyNotesText
                ? _value.safetyNotesText
                : safetyNotesText // ignore: cast_nullable_to_non_nullable
                      as String,
            videoUrl: null == videoUrl
                ? _value.videoUrl
                : videoUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            imageUrl: null == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            visibility: null == visibility
                ? _value.visibility
                : visibility // ignore: cast_nullable_to_non_nullable
                      as String,
            isSaving: null == isSaving
                ? _value.isSaving
                : isSaving // ignore: cast_nullable_to_non_nullable
                      as bool,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ExerciseCreateStateImplCopyWith<$Res>
    implements $ExerciseCreateStateCopyWith<$Res> {
  factory _$$ExerciseCreateStateImplCopyWith(
    _$ExerciseCreateStateImpl value,
    $Res Function(_$ExerciseCreateStateImpl) then,
  ) = __$$ExerciseCreateStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    String description,
    List<String> muscleGroups,
    String equipment,
    String difficulty,
    String instructionsText,
    String safetyNotesText,
    String videoUrl,
    String imageUrl,
    String visibility,
    bool isSaving,
    String? errorMessage,
  });
}

/// @nodoc
class __$$ExerciseCreateStateImplCopyWithImpl<$Res>
    extends _$ExerciseCreateStateCopyWithImpl<$Res, _$ExerciseCreateStateImpl>
    implements _$$ExerciseCreateStateImplCopyWith<$Res> {
  __$$ExerciseCreateStateImplCopyWithImpl(
    _$ExerciseCreateStateImpl _value,
    $Res Function(_$ExerciseCreateStateImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? muscleGroups = null,
    Object? equipment = null,
    Object? difficulty = null,
    Object? instructionsText = null,
    Object? safetyNotesText = null,
    Object? videoUrl = null,
    Object? imageUrl = null,
    Object? visibility = null,
    Object? isSaving = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$ExerciseCreateStateImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        muscleGroups: null == muscleGroups
            ? _value._muscleGroups
            : muscleGroups // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        equipment: null == equipment
            ? _value.equipment
            : equipment // ignore: cast_nullable_to_non_nullable
                  as String,
        difficulty: null == difficulty
            ? _value.difficulty
            : difficulty // ignore: cast_nullable_to_non_nullable
                  as String,
        instructionsText: null == instructionsText
            ? _value.instructionsText
            : instructionsText // ignore: cast_nullable_to_non_nullable
                  as String,
        safetyNotesText: null == safetyNotesText
            ? _value.safetyNotesText
            : safetyNotesText // ignore: cast_nullable_to_non_nullable
                  as String,
        videoUrl: null == videoUrl
            ? _value.videoUrl
            : videoUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        imageUrl: null == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        visibility: null == visibility
            ? _value.visibility
            : visibility // ignore: cast_nullable_to_non_nullable
                  as String,
        isSaving: null == isSaving
            ? _value.isSaving
            : isSaving // ignore: cast_nullable_to_non_nullable
                  as bool,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ExerciseCreateStateImpl implements _ExerciseCreateState {
  const _$ExerciseCreateStateImpl({
    this.name = '',
    this.description = '',
    final List<String> muscleGroups = const [],
    this.equipment = 'bodyweight',
    this.difficulty = 'beginner',
    this.instructionsText = '',
    this.safetyNotesText = '',
    this.videoUrl = '',
    this.imageUrl = '',
    this.visibility = 'private',
    this.isSaving = false,
    this.errorMessage,
  }) : _muscleGroups = muscleGroups;

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String description;
  final List<String> _muscleGroups;
  @override
  @JsonKey()
  List<String> get muscleGroups {
    if (_muscleGroups is EqualUnmodifiableListView) return _muscleGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_muscleGroups);
  }

  @override
  @JsonKey()
  final String equipment;
  @override
  @JsonKey()
  final String difficulty;
  @override
  @JsonKey()
  final String instructionsText;
  @override
  @JsonKey()
  final String safetyNotesText;
  @override
  @JsonKey()
  final String videoUrl;
  @override
  @JsonKey()
  final String imageUrl;
  @override
  @JsonKey()
  final String visibility;
  @override
  @JsonKey()
  final bool isSaving;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ExerciseCreateState(name: $name, description: $description, muscleGroups: $muscleGroups, equipment: $equipment, difficulty: $difficulty, instructionsText: $instructionsText, safetyNotesText: $safetyNotesText, videoUrl: $videoUrl, imageUrl: $imageUrl, visibility: $visibility, isSaving: $isSaving, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseCreateStateImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(
              other._muscleGroups,
              _muscleGroups,
            ) &&
            (identical(other.equipment, equipment) ||
                other.equipment == equipment) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.instructionsText, instructionsText) ||
                other.instructionsText == instructionsText) &&
            (identical(other.safetyNotesText, safetyNotesText) ||
                other.safetyNotesText == safetyNotesText) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    description,
    const DeepCollectionEquality().hash(_muscleGroups),
    equipment,
    difficulty,
    instructionsText,
    safetyNotesText,
    videoUrl,
    imageUrl,
    visibility,
    isSaving,
    errorMessage,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseCreateStateImplCopyWith<_$ExerciseCreateStateImpl> get copyWith =>
      __$$ExerciseCreateStateImplCopyWithImpl<_$ExerciseCreateStateImpl>(
        this,
        _$identity,
      );
}

abstract class _ExerciseCreateState implements ExerciseCreateState {
  const factory _ExerciseCreateState({
    final String name,
    final String description,
    final List<String> muscleGroups,
    final String equipment,
    final String difficulty,
    final String instructionsText,
    final String safetyNotesText,
    final String videoUrl,
    final String imageUrl,
    final String visibility,
    final bool isSaving,
    final String? errorMessage,
  }) = _$ExerciseCreateStateImpl;

  @override
  String get name;
  @override
  String get description;
  @override
  List<String> get muscleGroups;
  @override
  String get equipment;
  @override
  String get difficulty;
  @override
  String get instructionsText;
  @override
  String get safetyNotesText;
  @override
  String get videoUrl;
  @override
  String get imageUrl;
  @override
  String get visibility;
  @override
  bool get isSaving;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$ExerciseCreateStateImplCopyWith<_$ExerciseCreateStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$WorkoutCreateState {
  String? get editingWorkoutId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get isTemplate => throw _privateConstructorUsedError;
  DateTime? get scheduledFor => throw _privateConstructorUsedError;
  List<WorkoutScheduleDay> get scheduledDays =>
      throw _privateConstructorUsedError;
  int? get durationMinutes => throw _privateConstructorUsedError;
  WorkoutDifficulty? get difficulty => throw _privateConstructorUsedError;
  WorkoutGoal? get goal => throw _privateConstructorUsedError;
  WorkoutStatus get status => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  List<WorkoutItem> get items => throw _privateConstructorUsedError;
  List<Exercise> get availableExercises => throw _privateConstructorUsedError;
  bool get isLoadingExercises => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WorkoutCreateStateCopyWith<WorkoutCreateState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutCreateStateCopyWith<$Res> {
  factory $WorkoutCreateStateCopyWith(
    WorkoutCreateState value,
    $Res Function(WorkoutCreateState) then,
  ) = _$WorkoutCreateStateCopyWithImpl<$Res, WorkoutCreateState>;
  @useResult
  $Res call({
    String? editingWorkoutId,
    String title,
    String description,
    bool isTemplate,
    DateTime? scheduledFor,
    List<WorkoutScheduleDay> scheduledDays,
    int? durationMinutes,
    WorkoutDifficulty? difficulty,
    WorkoutGoal? goal,
    WorkoutStatus status,
    String notes,
    List<WorkoutItem> items,
    List<Exercise> availableExercises,
    bool isLoadingExercises,
    bool isSaving,
    String? errorMessage,
  });
}

/// @nodoc
class _$WorkoutCreateStateCopyWithImpl<$Res, $Val extends WorkoutCreateState>
    implements $WorkoutCreateStateCopyWith<$Res> {
  _$WorkoutCreateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? editingWorkoutId = freezed,
    Object? title = null,
    Object? description = null,
    Object? isTemplate = null,
    Object? scheduledFor = freezed,
    Object? scheduledDays = null,
    Object? durationMinutes = freezed,
    Object? difficulty = freezed,
    Object? goal = freezed,
    Object? status = null,
    Object? notes = null,
    Object? items = null,
    Object? availableExercises = null,
    Object? isLoadingExercises = null,
    Object? isSaving = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            editingWorkoutId: freezed == editingWorkoutId
                ? _value.editingWorkoutId
                : editingWorkoutId // ignore: cast_nullable_to_non_nullable
                      as String?,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            isTemplate: null == isTemplate
                ? _value.isTemplate
                : isTemplate // ignore: cast_nullable_to_non_nullable
                      as bool,
            scheduledFor: freezed == scheduledFor
                ? _value.scheduledFor
                : scheduledFor // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            scheduledDays: null == scheduledDays
                ? _value.scheduledDays
                : scheduledDays // ignore: cast_nullable_to_non_nullable
                      as List<WorkoutScheduleDay>,
            durationMinutes: freezed == durationMinutes
                ? _value.durationMinutes
                : durationMinutes // ignore: cast_nullable_to_non_nullable
                      as int?,
            difficulty: freezed == difficulty
                ? _value.difficulty
                : difficulty // ignore: cast_nullable_to_non_nullable
                      as WorkoutDifficulty?,
            goal: freezed == goal
                ? _value.goal
                : goal // ignore: cast_nullable_to_non_nullable
                      as WorkoutGoal?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as WorkoutStatus,
            notes: null == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String,
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<WorkoutItem>,
            availableExercises: null == availableExercises
                ? _value.availableExercises
                : availableExercises // ignore: cast_nullable_to_non_nullable
                      as List<Exercise>,
            isLoadingExercises: null == isLoadingExercises
                ? _value.isLoadingExercises
                : isLoadingExercises // ignore: cast_nullable_to_non_nullable
                      as bool,
            isSaving: null == isSaving
                ? _value.isSaving
                : isSaving // ignore: cast_nullable_to_non_nullable
                      as bool,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkoutCreateStateImplCopyWith<$Res>
    implements $WorkoutCreateStateCopyWith<$Res> {
  factory _$$WorkoutCreateStateImplCopyWith(
    _$WorkoutCreateStateImpl value,
    $Res Function(_$WorkoutCreateStateImpl) then,
  ) = __$$WorkoutCreateStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? editingWorkoutId,
    String title,
    String description,
    bool isTemplate,
    DateTime? scheduledFor,
    List<WorkoutScheduleDay> scheduledDays,
    int? durationMinutes,
    WorkoutDifficulty? difficulty,
    WorkoutGoal? goal,
    WorkoutStatus status,
    String notes,
    List<WorkoutItem> items,
    List<Exercise> availableExercises,
    bool isLoadingExercises,
    bool isSaving,
    String? errorMessage,
  });
}

/// @nodoc
class __$$WorkoutCreateStateImplCopyWithImpl<$Res>
    extends _$WorkoutCreateStateCopyWithImpl<$Res, _$WorkoutCreateStateImpl>
    implements _$$WorkoutCreateStateImplCopyWith<$Res> {
  __$$WorkoutCreateStateImplCopyWithImpl(
    _$WorkoutCreateStateImpl _value,
    $Res Function(_$WorkoutCreateStateImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? editingWorkoutId = freezed,
    Object? title = null,
    Object? description = null,
    Object? isTemplate = null,
    Object? scheduledFor = freezed,
    Object? scheduledDays = null,
    Object? durationMinutes = freezed,
    Object? difficulty = freezed,
    Object? goal = freezed,
    Object? status = null,
    Object? notes = null,
    Object? items = null,
    Object? availableExercises = null,
    Object? isLoadingExercises = null,
    Object? isSaving = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$WorkoutCreateStateImpl(
        editingWorkoutId: freezed == editingWorkoutId
            ? _value.editingWorkoutId
            : editingWorkoutId // ignore: cast_nullable_to_non_nullable
                  as String?,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        isTemplate: null == isTemplate
            ? _value.isTemplate
            : isTemplate // ignore: cast_nullable_to_non_nullable
                  as bool,
        scheduledFor: freezed == scheduledFor
            ? _value.scheduledFor
            : scheduledFor // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        scheduledDays: null == scheduledDays
            ? _value._scheduledDays
            : scheduledDays // ignore: cast_nullable_to_non_nullable
                  as List<WorkoutScheduleDay>,
        durationMinutes: freezed == durationMinutes
            ? _value.durationMinutes
            : durationMinutes // ignore: cast_nullable_to_non_nullable
                  as int?,
        difficulty: freezed == difficulty
            ? _value.difficulty
            : difficulty // ignore: cast_nullable_to_non_nullable
                  as WorkoutDifficulty?,
        goal: freezed == goal
            ? _value.goal
            : goal // ignore: cast_nullable_to_non_nullable
                  as WorkoutGoal?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as WorkoutStatus,
        notes: null == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String,
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<WorkoutItem>,
        availableExercises: null == availableExercises
            ? _value._availableExercises
            : availableExercises // ignore: cast_nullable_to_non_nullable
                  as List<Exercise>,
        isLoadingExercises: null == isLoadingExercises
            ? _value.isLoadingExercises
            : isLoadingExercises // ignore: cast_nullable_to_non_nullable
                  as bool,
        isSaving: null == isSaving
            ? _value.isSaving
            : isSaving // ignore: cast_nullable_to_non_nullable
                  as bool,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$WorkoutCreateStateImpl implements _WorkoutCreateState {
  const _$WorkoutCreateStateImpl({
    this.editingWorkoutId,
    this.title = '',
    this.description = '',
    this.isTemplate = false,
    this.scheduledFor,
    final List<WorkoutScheduleDay> scheduledDays = const [],
    this.durationMinutes,
    this.difficulty,
    this.goal,
    this.status = WorkoutStatus.draft,
    this.notes = '',
    final List<WorkoutItem> items = const [],
    final List<Exercise> availableExercises = const [],
    this.isLoadingExercises = false,
    this.isSaving = false,
    this.errorMessage,
  }) : _scheduledDays = scheduledDays,
       _items = items,
       _availableExercises = availableExercises;

  @override
  final String? editingWorkoutId;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final bool isTemplate;
  @override
  final DateTime? scheduledFor;
  final List<WorkoutScheduleDay> _scheduledDays;
  @override
  @JsonKey()
  List<WorkoutScheduleDay> get scheduledDays {
    if (_scheduledDays is EqualUnmodifiableListView) return _scheduledDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scheduledDays);
  }

  @override
  final int? durationMinutes;
  @override
  final WorkoutDifficulty? difficulty;
  @override
  final WorkoutGoal? goal;
  @override
  @JsonKey()
  final WorkoutStatus status;
  @override
  @JsonKey()
  final String notes;
  final List<WorkoutItem> _items;
  @override
  @JsonKey()
  List<WorkoutItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  final List<Exercise> _availableExercises;
  @override
  @JsonKey()
  List<Exercise> get availableExercises {
    if (_availableExercises is EqualUnmodifiableListView)
      return _availableExercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableExercises);
  }

  @override
  @JsonKey()
  final bool isLoadingExercises;
  @override
  @JsonKey()
  final bool isSaving;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'WorkoutCreateState(editingWorkoutId: $editingWorkoutId, title: $title, description: $description, isTemplate: $isTemplate, scheduledFor: $scheduledFor, scheduledDays: $scheduledDays, durationMinutes: $durationMinutes, difficulty: $difficulty, goal: $goal, status: $status, notes: $notes, items: $items, availableExercises: $availableExercises, isLoadingExercises: $isLoadingExercises, isSaving: $isSaving, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutCreateStateImpl &&
            (identical(other.editingWorkoutId, editingWorkoutId) ||
                other.editingWorkoutId == editingWorkoutId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isTemplate, isTemplate) ||
                other.isTemplate == isTemplate) &&
            (identical(other.scheduledFor, scheduledFor) ||
                other.scheduledFor == scheduledFor) &&
            const DeepCollectionEquality().equals(
              other._scheduledDays,
              _scheduledDays,
            ) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.goal, goal) || other.goal == goal) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality().equals(
              other._availableExercises,
              _availableExercises,
            ) &&
            (identical(other.isLoadingExercises, isLoadingExercises) ||
                other.isLoadingExercises == isLoadingExercises) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    editingWorkoutId,
    title,
    description,
    isTemplate,
    scheduledFor,
    const DeepCollectionEquality().hash(_scheduledDays),
    durationMinutes,
    difficulty,
    goal,
    status,
    notes,
    const DeepCollectionEquality().hash(_items),
    const DeepCollectionEquality().hash(_availableExercises),
    isLoadingExercises,
    isSaving,
    errorMessage,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutCreateStateImplCopyWith<_$WorkoutCreateStateImpl> get copyWith =>
      __$$WorkoutCreateStateImplCopyWithImpl<_$WorkoutCreateStateImpl>(
        this,
        _$identity,
      );
}

abstract class _WorkoutCreateState implements WorkoutCreateState {
  const factory _WorkoutCreateState({
    final String? editingWorkoutId,
    final String title,
    final String description,
    final bool isTemplate,
    final DateTime? scheduledFor,
    final List<WorkoutScheduleDay> scheduledDays,
    final int? durationMinutes,
    final WorkoutDifficulty? difficulty,
    final WorkoutGoal? goal,
    final WorkoutStatus status,
    final String notes,
    final List<WorkoutItem> items,
    final List<Exercise> availableExercises,
    final bool isLoadingExercises,
    final bool isSaving,
    final String? errorMessage,
  }) = _$WorkoutCreateStateImpl;

  @override
  String? get editingWorkoutId;
  @override
  String get title;
  @override
  String get description;
  @override
  bool get isTemplate;
  @override
  DateTime? get scheduledFor;
  @override
  List<WorkoutScheduleDay> get scheduledDays;
  @override
  int? get durationMinutes;
  @override
  WorkoutDifficulty? get difficulty;
  @override
  WorkoutGoal? get goal;
  @override
  WorkoutStatus get status;
  @override
  String get notes;
  @override
  List<WorkoutItem> get items;
  @override
  List<Exercise> get availableExercises;
  @override
  bool get isLoadingExercises;
  @override
  bool get isSaving;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$WorkoutCreateStateImplCopyWith<_$WorkoutCreateStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
