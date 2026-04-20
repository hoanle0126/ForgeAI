// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'muscle_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MuscleStatus _$MuscleStatusFromJson(Map<String, dynamic> json) {
  return _MuscleStatus.fromJson(json);
}

/// @nodoc
mixin _$MuscleStatus {
  String get name => throw _privateConstructorUsedError;
  double get fatigueLevel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MuscleStatusCopyWith<MuscleStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MuscleStatusCopyWith<$Res> {
  factory $MuscleStatusCopyWith(
          MuscleStatus value, $Res Function(MuscleStatus) then) =
      _$MuscleStatusCopyWithImpl<$Res, MuscleStatus>;
  @useResult
  $Res call({String name, double fatigueLevel});
}

/// @nodoc
class _$MuscleStatusCopyWithImpl<$Res, $Val extends MuscleStatus>
    implements $MuscleStatusCopyWith<$Res> {
  _$MuscleStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? fatigueLevel = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      fatigueLevel: null == fatigueLevel
          ? _value.fatigueLevel
          : fatigueLevel // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MuscleStatusImplCopyWith<$Res>
    implements $MuscleStatusCopyWith<$Res> {
  factory _$$MuscleStatusImplCopyWith(
          _$MuscleStatusImpl value, $Res Function(_$MuscleStatusImpl) then) =
      __$$MuscleStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, double fatigueLevel});
}

/// @nodoc
class __$$MuscleStatusImplCopyWithImpl<$Res>
    extends _$MuscleStatusCopyWithImpl<$Res, _$MuscleStatusImpl>
    implements _$$MuscleStatusImplCopyWith<$Res> {
  __$$MuscleStatusImplCopyWithImpl(
      _$MuscleStatusImpl _value, $Res Function(_$MuscleStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? fatigueLevel = null,
  }) {
    return _then(_$MuscleStatusImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      fatigueLevel: null == fatigueLevel
          ? _value.fatigueLevel
          : fatigueLevel // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MuscleStatusImpl extends _MuscleStatus {
  const _$MuscleStatusImpl({required this.name, required this.fatigueLevel})
      : super._();

  factory _$MuscleStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$MuscleStatusImplFromJson(json);

  @override
  final String name;
  @override
  final double fatigueLevel;

  @override
  String toString() {
    return 'MuscleStatus(name: $name, fatigueLevel: $fatigueLevel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MuscleStatusImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.fatigueLevel, fatigueLevel) ||
                other.fatigueLevel == fatigueLevel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, fatigueLevel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MuscleStatusImplCopyWith<_$MuscleStatusImpl> get copyWith =>
      __$$MuscleStatusImplCopyWithImpl<_$MuscleStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MuscleStatusImplToJson(
      this,
    );
  }
}

abstract class _MuscleStatus extends MuscleStatus {
  const factory _MuscleStatus(
      {required final String name,
      required final double fatigueLevel}) = _$MuscleStatusImpl;
  const _MuscleStatus._() : super._();

  factory _MuscleStatus.fromJson(Map<String, dynamic> json) =
      _$MuscleStatusImpl.fromJson;

  @override
  String get name;
  @override
  double get fatigueLevel;
  @override
  @JsonKey(ignore: true)
  _$$MuscleStatusImplCopyWith<_$MuscleStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
