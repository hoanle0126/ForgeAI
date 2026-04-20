// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'insight_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InsightState {
  List<MuscleData> get muscleData => throw _privateConstructorUsedError;
  List<InsightMessage> get messages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InsightStateCopyWith<InsightState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InsightStateCopyWith<$Res> {
  factory $InsightStateCopyWith(
          InsightState value, $Res Function(InsightState) then) =
      _$InsightStateCopyWithImpl<$Res, InsightState>;
  @useResult
  $Res call({List<MuscleData> muscleData, List<InsightMessage> messages});
}

/// @nodoc
class _$InsightStateCopyWithImpl<$Res, $Val extends InsightState>
    implements $InsightStateCopyWith<$Res> {
  _$InsightStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? muscleData = null,
    Object? messages = null,
  }) {
    return _then(_value.copyWith(
      muscleData: null == muscleData
          ? _value.muscleData
          : muscleData // ignore: cast_nullable_to_non_nullable
              as List<MuscleData>,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<InsightMessage>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InsightStateImplCopyWith<$Res>
    implements $InsightStateCopyWith<$Res> {
  factory _$$InsightStateImplCopyWith(
          _$InsightStateImpl value, $Res Function(_$InsightStateImpl) then) =
      __$$InsightStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MuscleData> muscleData, List<InsightMessage> messages});
}

/// @nodoc
class __$$InsightStateImplCopyWithImpl<$Res>
    extends _$InsightStateCopyWithImpl<$Res, _$InsightStateImpl>
    implements _$$InsightStateImplCopyWith<$Res> {
  __$$InsightStateImplCopyWithImpl(
      _$InsightStateImpl _value, $Res Function(_$InsightStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? muscleData = null,
    Object? messages = null,
  }) {
    return _then(_$InsightStateImpl(
      muscleData: null == muscleData
          ? _value._muscleData
          : muscleData // ignore: cast_nullable_to_non_nullable
              as List<MuscleData>,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<InsightMessage>,
    ));
  }
}

/// @nodoc

class _$InsightStateImpl implements _InsightState {
  const _$InsightStateImpl(
      {required final List<MuscleData> muscleData,
      required final List<InsightMessage> messages})
      : _muscleData = muscleData,
        _messages = messages;

  final List<MuscleData> _muscleData;
  @override
  List<MuscleData> get muscleData {
    if (_muscleData is EqualUnmodifiableListView) return _muscleData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_muscleData);
  }

  final List<InsightMessage> _messages;
  @override
  List<InsightMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'InsightState(muscleData: $muscleData, messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InsightStateImpl &&
            const DeepCollectionEquality()
                .equals(other._muscleData, _muscleData) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_muscleData),
      const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InsightStateImplCopyWith<_$InsightStateImpl> get copyWith =>
      __$$InsightStateImplCopyWithImpl<_$InsightStateImpl>(this, _$identity);
}

abstract class _InsightState implements InsightState {
  const factory _InsightState(
      {required final List<MuscleData> muscleData,
      required final List<InsightMessage> messages}) = _$InsightStateImpl;

  @override
  List<MuscleData> get muscleData;
  @override
  List<InsightMessage> get messages;
  @override
  @JsonKey(ignore: true)
  _$$InsightStateImplCopyWith<_$InsightStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
