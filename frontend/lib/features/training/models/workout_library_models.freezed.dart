// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_library_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WorkoutLibraryWorkout _$WorkoutLibraryWorkoutFromJson(
  Map<String, dynamic> json,
) {
  return _WorkoutLibraryWorkout.fromJson(json);
}

/// @nodoc
mixin _$WorkoutLibraryWorkout {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool get isTemplate => throw _privateConstructorUsedError;
  DateTime? get scheduledFor => throw _privateConstructorUsedError;
  List<TrainingWorkoutScheduleDay> get scheduledDays =>
      throw _privateConstructorUsedError;
  int? get durationMinutes => throw _privateConstructorUsedError;
  TrainingWorkoutDifficulty? get difficulty =>
      throw _privateConstructorUsedError;
  TrainingWorkoutGoal? get goal => throw _privateConstructorUsedError;
  TrainingWorkoutStatus get status => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  List<WorkoutLibraryItem> get items => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkoutLibraryWorkoutCopyWith<WorkoutLibraryWorkout> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutLibraryWorkoutCopyWith<$Res> {
  factory $WorkoutLibraryWorkoutCopyWith(
    WorkoutLibraryWorkout value,
    $Res Function(WorkoutLibraryWorkout) then,
  ) = _$WorkoutLibraryWorkoutCopyWithImpl<$Res, WorkoutLibraryWorkout>;
  @useResult
  $Res call({
    String id,
    String title,
    String? description,
    bool isTemplate,
    DateTime? scheduledFor,
    List<TrainingWorkoutScheduleDay> scheduledDays,
    int? durationMinutes,
    TrainingWorkoutDifficulty? difficulty,
    TrainingWorkoutGoal? goal,
    TrainingWorkoutStatus status,
    String? notes,
    List<WorkoutLibraryItem> items,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$WorkoutLibraryWorkoutCopyWithImpl<
  $Res,
  $Val extends WorkoutLibraryWorkout
>
    implements $WorkoutLibraryWorkoutCopyWith<$Res> {
  _$WorkoutLibraryWorkoutCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
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
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
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
                      as List<TrainingWorkoutScheduleDay>,
            durationMinutes: freezed == durationMinutes
                ? _value.durationMinutes
                : durationMinutes // ignore: cast_nullable_to_non_nullable
                      as int?,
            difficulty: freezed == difficulty
                ? _value.difficulty
                : difficulty // ignore: cast_nullable_to_non_nullable
                      as TrainingWorkoutDifficulty?,
            goal: freezed == goal
                ? _value.goal
                : goal // ignore: cast_nullable_to_non_nullable
                      as TrainingWorkoutGoal?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as TrainingWorkoutStatus,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<WorkoutLibraryItem>,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkoutLibraryWorkoutImplCopyWith<$Res>
    implements $WorkoutLibraryWorkoutCopyWith<$Res> {
  factory _$$WorkoutLibraryWorkoutImplCopyWith(
    _$WorkoutLibraryWorkoutImpl value,
    $Res Function(_$WorkoutLibraryWorkoutImpl) then,
  ) = __$$WorkoutLibraryWorkoutImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String? description,
    bool isTemplate,
    DateTime? scheduledFor,
    List<TrainingWorkoutScheduleDay> scheduledDays,
    int? durationMinutes,
    TrainingWorkoutDifficulty? difficulty,
    TrainingWorkoutGoal? goal,
    TrainingWorkoutStatus status,
    String? notes,
    List<WorkoutLibraryItem> items,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$$WorkoutLibraryWorkoutImplCopyWithImpl<$Res>
    extends
        _$WorkoutLibraryWorkoutCopyWithImpl<$Res, _$WorkoutLibraryWorkoutImpl>
    implements _$$WorkoutLibraryWorkoutImplCopyWith<$Res> {
  __$$WorkoutLibraryWorkoutImplCopyWithImpl(
    _$WorkoutLibraryWorkoutImpl _value,
    $Res Function(_$WorkoutLibraryWorkoutImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
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
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$WorkoutLibraryWorkoutImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
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
                  as List<TrainingWorkoutScheduleDay>,
        durationMinutes: freezed == durationMinutes
            ? _value.durationMinutes
            : durationMinutes // ignore: cast_nullable_to_non_nullable
                  as int?,
        difficulty: freezed == difficulty
            ? _value.difficulty
            : difficulty // ignore: cast_nullable_to_non_nullable
                  as TrainingWorkoutDifficulty?,
        goal: freezed == goal
            ? _value.goal
            : goal // ignore: cast_nullable_to_non_nullable
                  as TrainingWorkoutGoal?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as TrainingWorkoutStatus,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<WorkoutLibraryItem>,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutLibraryWorkoutImpl extends _WorkoutLibraryWorkout {
  const _$WorkoutLibraryWorkoutImpl({
    required this.id,
    required this.title,
    this.description,
    this.isTemplate = false,
    this.scheduledFor,
    final List<TrainingWorkoutScheduleDay> scheduledDays = const [],
    this.durationMinutes,
    this.difficulty,
    this.goal,
    this.status = TrainingWorkoutStatus.draft,
    this.notes,
    final List<WorkoutLibraryItem> items = const [],
    this.createdAt,
    this.updatedAt,
  }) : _scheduledDays = scheduledDays,
       _items = items,
       super._();

  factory _$WorkoutLibraryWorkoutImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutLibraryWorkoutImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String? description;
  @override
  @JsonKey()
  final bool isTemplate;
  @override
  final DateTime? scheduledFor;
  final List<TrainingWorkoutScheduleDay> _scheduledDays;
  @override
  @JsonKey()
  List<TrainingWorkoutScheduleDay> get scheduledDays {
    if (_scheduledDays is EqualUnmodifiableListView) return _scheduledDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scheduledDays);
  }

  @override
  final int? durationMinutes;
  @override
  final TrainingWorkoutDifficulty? difficulty;
  @override
  final TrainingWorkoutGoal? goal;
  @override
  @JsonKey()
  final TrainingWorkoutStatus status;
  @override
  final String? notes;
  final List<WorkoutLibraryItem> _items;
  @override
  @JsonKey()
  List<WorkoutLibraryItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'WorkoutLibraryWorkout(id: $id, title: $title, description: $description, isTemplate: $isTemplate, scheduledFor: $scheduledFor, scheduledDays: $scheduledDays, durationMinutes: $durationMinutes, difficulty: $difficulty, goal: $goal, status: $status, notes: $notes, items: $items, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutLibraryWorkoutImpl &&
            (identical(other.id, id) || other.id == id) &&
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
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
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
    createdAt,
    updatedAt,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutLibraryWorkoutImplCopyWith<_$WorkoutLibraryWorkoutImpl>
  get copyWith =>
      __$$WorkoutLibraryWorkoutImplCopyWithImpl<_$WorkoutLibraryWorkoutImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutLibraryWorkoutImplToJson(this);
  }
}

abstract class _WorkoutLibraryWorkout extends WorkoutLibraryWorkout {
  const factory _WorkoutLibraryWorkout({
    required final String id,
    required final String title,
    final String? description,
    final bool isTemplate,
    final DateTime? scheduledFor,
    final List<TrainingWorkoutScheduleDay> scheduledDays,
    final int? durationMinutes,
    final TrainingWorkoutDifficulty? difficulty,
    final TrainingWorkoutGoal? goal,
    final TrainingWorkoutStatus status,
    final String? notes,
    final List<WorkoutLibraryItem> items,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) = _$WorkoutLibraryWorkoutImpl;
  const _WorkoutLibraryWorkout._() : super._();

  factory _WorkoutLibraryWorkout.fromJson(Map<String, dynamic> json) =
      _$WorkoutLibraryWorkoutImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String? get description;
  @override
  bool get isTemplate;
  @override
  DateTime? get scheduledFor;
  @override
  List<TrainingWorkoutScheduleDay> get scheduledDays;
  @override
  int? get durationMinutes;
  @override
  TrainingWorkoutDifficulty? get difficulty;
  @override
  TrainingWorkoutGoal? get goal;
  @override
  TrainingWorkoutStatus get status;
  @override
  String? get notes;
  @override
  List<WorkoutLibraryItem> get items;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$WorkoutLibraryWorkoutImplCopyWith<_$WorkoutLibraryWorkoutImpl>
  get copyWith => throw _privateConstructorUsedError;
}

WorkoutLibraryItem _$WorkoutLibraryItemFromJson(Map<String, dynamic> json) {
  return _WorkoutLibraryItem.fromJson(json);
}

/// @nodoc
mixin _$WorkoutLibraryItem {
  String? get id => throw _privateConstructorUsedError;
  String? get exerciseId => throw _privateConstructorUsedError;
  String get exerciseNameSnapshot => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;
  int? get restSeconds => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  List<WorkoutLibrarySet> get sets => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkoutLibraryItemCopyWith<WorkoutLibraryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutLibraryItemCopyWith<$Res> {
  factory $WorkoutLibraryItemCopyWith(
    WorkoutLibraryItem value,
    $Res Function(WorkoutLibraryItem) then,
  ) = _$WorkoutLibraryItemCopyWithImpl<$Res, WorkoutLibraryItem>;
  @useResult
  $Res call({
    String? id,
    String? exerciseId,
    String exerciseNameSnapshot,
    int order,
    int? restSeconds,
    String? notes,
    List<WorkoutLibrarySet> sets,
  });
}

/// @nodoc
class _$WorkoutLibraryItemCopyWithImpl<$Res, $Val extends WorkoutLibraryItem>
    implements $WorkoutLibraryItemCopyWith<$Res> {
  _$WorkoutLibraryItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? exerciseId = freezed,
    Object? exerciseNameSnapshot = null,
    Object? order = null,
    Object? restSeconds = freezed,
    Object? notes = freezed,
    Object? sets = null,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            exerciseId: freezed == exerciseId
                ? _value.exerciseId
                : exerciseId // ignore: cast_nullable_to_non_nullable
                      as String?,
            exerciseNameSnapshot: null == exerciseNameSnapshot
                ? _value.exerciseNameSnapshot
                : exerciseNameSnapshot // ignore: cast_nullable_to_non_nullable
                      as String,
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
                      as List<WorkoutLibrarySet>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkoutLibraryItemImplCopyWith<$Res>
    implements $WorkoutLibraryItemCopyWith<$Res> {
  factory _$$WorkoutLibraryItemImplCopyWith(
    _$WorkoutLibraryItemImpl value,
    $Res Function(_$WorkoutLibraryItemImpl) then,
  ) = __$$WorkoutLibraryItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    String? exerciseId,
    String exerciseNameSnapshot,
    int order,
    int? restSeconds,
    String? notes,
    List<WorkoutLibrarySet> sets,
  });
}

/// @nodoc
class __$$WorkoutLibraryItemImplCopyWithImpl<$Res>
    extends _$WorkoutLibraryItemCopyWithImpl<$Res, _$WorkoutLibraryItemImpl>
    implements _$$WorkoutLibraryItemImplCopyWith<$Res> {
  __$$WorkoutLibraryItemImplCopyWithImpl(
    _$WorkoutLibraryItemImpl _value,
    $Res Function(_$WorkoutLibraryItemImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? exerciseId = freezed,
    Object? exerciseNameSnapshot = null,
    Object? order = null,
    Object? restSeconds = freezed,
    Object? notes = freezed,
    Object? sets = null,
  }) {
    return _then(
      _$WorkoutLibraryItemImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        exerciseId: freezed == exerciseId
            ? _value.exerciseId
            : exerciseId // ignore: cast_nullable_to_non_nullable
                  as String?,
        exerciseNameSnapshot: null == exerciseNameSnapshot
            ? _value.exerciseNameSnapshot
            : exerciseNameSnapshot // ignore: cast_nullable_to_non_nullable
                  as String,
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
                  as List<WorkoutLibrarySet>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutLibraryItemImpl extends _WorkoutLibraryItem {
  const _$WorkoutLibraryItemImpl({
    this.id,
    this.exerciseId,
    required this.exerciseNameSnapshot,
    required this.order,
    this.restSeconds,
    this.notes,
    final List<WorkoutLibrarySet> sets = const [],
  }) : _sets = sets,
       super._();

  factory _$WorkoutLibraryItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutLibraryItemImplFromJson(json);

  @override
  final String? id;
  @override
  final String? exerciseId;
  @override
  final String exerciseNameSnapshot;
  @override
  final int order;
  @override
  final int? restSeconds;
  @override
  final String? notes;
  final List<WorkoutLibrarySet> _sets;
  @override
  @JsonKey()
  List<WorkoutLibrarySet> get sets {
    if (_sets is EqualUnmodifiableListView) return _sets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sets);
  }

  @override
  String toString() {
    return 'WorkoutLibraryItem(id: $id, exerciseId: $exerciseId, exerciseNameSnapshot: $exerciseNameSnapshot, order: $order, restSeconds: $restSeconds, notes: $notes, sets: $sets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutLibraryItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.exerciseId, exerciseId) ||
                other.exerciseId == exerciseId) &&
            (identical(other.exerciseNameSnapshot, exerciseNameSnapshot) ||
                other.exerciseNameSnapshot == exerciseNameSnapshot) &&
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
    id,
    exerciseId,
    exerciseNameSnapshot,
    order,
    restSeconds,
    notes,
    const DeepCollectionEquality().hash(_sets),
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutLibraryItemImplCopyWith<_$WorkoutLibraryItemImpl> get copyWith =>
      __$$WorkoutLibraryItemImplCopyWithImpl<_$WorkoutLibraryItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutLibraryItemImplToJson(this);
  }
}

abstract class _WorkoutLibraryItem extends WorkoutLibraryItem {
  const factory _WorkoutLibraryItem({
    final String? id,
    final String? exerciseId,
    required final String exerciseNameSnapshot,
    required final int order,
    final int? restSeconds,
    final String? notes,
    final List<WorkoutLibrarySet> sets,
  }) = _$WorkoutLibraryItemImpl;
  const _WorkoutLibraryItem._() : super._();

  factory _WorkoutLibraryItem.fromJson(Map<String, dynamic> json) =
      _$WorkoutLibraryItemImpl.fromJson;

  @override
  String? get id;
  @override
  String? get exerciseId;
  @override
  String get exerciseNameSnapshot;
  @override
  int get order;
  @override
  int? get restSeconds;
  @override
  String? get notes;
  @override
  List<WorkoutLibrarySet> get sets;
  @override
  @JsonKey(ignore: true)
  _$$WorkoutLibraryItemImplCopyWith<_$WorkoutLibraryItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WorkoutLibrarySet _$WorkoutLibrarySetFromJson(Map<String, dynamic> json) {
  return _WorkoutLibrarySet.fromJson(json);
}

/// @nodoc
mixin _$WorkoutLibrarySet {
  String? get id => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;
  int? get reps => throw _privateConstructorUsedError;
  double? get weightKg => throw _privateConstructorUsedError;
  int? get durationSeconds => throw _privateConstructorUsedError;
  int? get restSeconds => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkoutLibrarySetCopyWith<WorkoutLibrarySet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutLibrarySetCopyWith<$Res> {
  factory $WorkoutLibrarySetCopyWith(
    WorkoutLibrarySet value,
    $Res Function(WorkoutLibrarySet) then,
  ) = _$WorkoutLibrarySetCopyWithImpl<$Res, WorkoutLibrarySet>;
  @useResult
  $Res call({
    String? id,
    int order,
    int? reps,
    double? weightKg,
    int? durationSeconds,
    int? restSeconds,
    bool isCompleted,
  });
}

/// @nodoc
class _$WorkoutLibrarySetCopyWithImpl<$Res, $Val extends WorkoutLibrarySet>
    implements $WorkoutLibrarySetCopyWith<$Res> {
  _$WorkoutLibrarySetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? order = null,
    Object? reps = freezed,
    Object? weightKg = freezed,
    Object? durationSeconds = freezed,
    Object? restSeconds = freezed,
    Object? isCompleted = null,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
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
abstract class _$$WorkoutLibrarySetImplCopyWith<$Res>
    implements $WorkoutLibrarySetCopyWith<$Res> {
  factory _$$WorkoutLibrarySetImplCopyWith(
    _$WorkoutLibrarySetImpl value,
    $Res Function(_$WorkoutLibrarySetImpl) then,
  ) = __$$WorkoutLibrarySetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    int order,
    int? reps,
    double? weightKg,
    int? durationSeconds,
    int? restSeconds,
    bool isCompleted,
  });
}

/// @nodoc
class __$$WorkoutLibrarySetImplCopyWithImpl<$Res>
    extends _$WorkoutLibrarySetCopyWithImpl<$Res, _$WorkoutLibrarySetImpl>
    implements _$$WorkoutLibrarySetImplCopyWith<$Res> {
  __$$WorkoutLibrarySetImplCopyWithImpl(
    _$WorkoutLibrarySetImpl _value,
    $Res Function(_$WorkoutLibrarySetImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? order = null,
    Object? reps = freezed,
    Object? weightKg = freezed,
    Object? durationSeconds = freezed,
    Object? restSeconds = freezed,
    Object? isCompleted = null,
  }) {
    return _then(
      _$WorkoutLibrarySetImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
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
class _$WorkoutLibrarySetImpl extends _WorkoutLibrarySet {
  const _$WorkoutLibrarySetImpl({
    this.id,
    required this.order,
    this.reps,
    this.weightKg,
    this.durationSeconds,
    this.restSeconds,
    this.isCompleted = false,
  }) : super._();

  factory _$WorkoutLibrarySetImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutLibrarySetImplFromJson(json);

  @override
  final String? id;
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
    return 'WorkoutLibrarySet(id: $id, order: $order, reps: $reps, weightKg: $weightKg, durationSeconds: $durationSeconds, restSeconds: $restSeconds, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutLibrarySetImpl &&
            (identical(other.id, id) || other.id == id) &&
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
    id,
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
  _$$WorkoutLibrarySetImplCopyWith<_$WorkoutLibrarySetImpl> get copyWith =>
      __$$WorkoutLibrarySetImplCopyWithImpl<_$WorkoutLibrarySetImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutLibrarySetImplToJson(this);
  }
}

abstract class _WorkoutLibrarySet extends WorkoutLibrarySet {
  const factory _WorkoutLibrarySet({
    final String? id,
    required final int order,
    final int? reps,
    final double? weightKg,
    final int? durationSeconds,
    final int? restSeconds,
    final bool isCompleted,
  }) = _$WorkoutLibrarySetImpl;
  const _WorkoutLibrarySet._() : super._();

  factory _WorkoutLibrarySet.fromJson(Map<String, dynamic> json) =
      _$WorkoutLibrarySetImpl.fromJson;

  @override
  String? get id;
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
  _$$WorkoutLibrarySetImplCopyWith<_$WorkoutLibrarySetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
