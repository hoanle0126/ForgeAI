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
  List<MuscleAnalysis> get muscleAnalyses => throw _privateConstructorUsedError;
  List<InsightMessage> get messages => throw _privateConstructorUsedError;
  String get selectedMuscleId => throw _privateConstructorUsedError;
  AtlasSide get activeAtlasSide => throw _privateConstructorUsedError;
  bool get isChatPanelOpen => throw _privateConstructorUsedError;

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
  $Res call(
      {List<MuscleData> muscleData,
      List<MuscleAnalysis> muscleAnalyses,
      List<InsightMessage> messages,
      String selectedMuscleId,
      AtlasSide activeAtlasSide,
      bool isChatPanelOpen});
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
    Object? muscleAnalyses = null,
    Object? messages = null,
    Object? selectedMuscleId = null,
    Object? activeAtlasSide = null,
    Object? isChatPanelOpen = null,
  }) {
    return _then(_value.copyWith(
      muscleData: null == muscleData
          ? _value.muscleData
          : muscleData // ignore: cast_nullable_to_non_nullable
              as List<MuscleData>,
      muscleAnalyses: null == muscleAnalyses
          ? _value.muscleAnalyses
          : muscleAnalyses // ignore: cast_nullable_to_non_nullable
              as List<MuscleAnalysis>,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<InsightMessage>,
      selectedMuscleId: null == selectedMuscleId
          ? _value.selectedMuscleId
          : selectedMuscleId // ignore: cast_nullable_to_non_nullable
              as String,
      activeAtlasSide: null == activeAtlasSide
          ? _value.activeAtlasSide
          : activeAtlasSide // ignore: cast_nullable_to_non_nullable
              as AtlasSide,
      isChatPanelOpen: null == isChatPanelOpen
          ? _value.isChatPanelOpen
          : isChatPanelOpen // ignore: cast_nullable_to_non_nullable
              as bool,
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
  $Res call(
      {List<MuscleData> muscleData,
      List<MuscleAnalysis> muscleAnalyses,
      List<InsightMessage> messages,
      String selectedMuscleId,
      AtlasSide activeAtlasSide,
      bool isChatPanelOpen});
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
    Object? muscleAnalyses = null,
    Object? messages = null,
    Object? selectedMuscleId = null,
    Object? activeAtlasSide = null,
    Object? isChatPanelOpen = null,
  }) {
    return _then(_$InsightStateImpl(
      muscleData: null == muscleData
          ? _value._muscleData
          : muscleData // ignore: cast_nullable_to_non_nullable
              as List<MuscleData>,
      muscleAnalyses: null == muscleAnalyses
          ? _value._muscleAnalyses
          : muscleAnalyses // ignore: cast_nullable_to_non_nullable
              as List<MuscleAnalysis>,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<InsightMessage>,
      selectedMuscleId: null == selectedMuscleId
          ? _value.selectedMuscleId
          : selectedMuscleId // ignore: cast_nullable_to_non_nullable
              as String,
      activeAtlasSide: null == activeAtlasSide
          ? _value.activeAtlasSide
          : activeAtlasSide // ignore: cast_nullable_to_non_nullable
              as AtlasSide,
      isChatPanelOpen: null == isChatPanelOpen
          ? _value.isChatPanelOpen
          : isChatPanelOpen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$InsightStateImpl implements _InsightState {
  const _$InsightStateImpl(
      {required final List<MuscleData> muscleData,
      required final List<MuscleAnalysis> muscleAnalyses,
      required final List<InsightMessage> messages,
      required this.selectedMuscleId,
      this.activeAtlasSide = AtlasSide.front,
      this.isChatPanelOpen = false})
      : _muscleData = muscleData,
        _muscleAnalyses = muscleAnalyses,
        _messages = messages;

  final List<MuscleData> _muscleData;
  @override
  List<MuscleData> get muscleData {
    if (_muscleData is EqualUnmodifiableListView) return _muscleData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_muscleData);
  }

  final List<MuscleAnalysis> _muscleAnalyses;
  @override
  List<MuscleAnalysis> get muscleAnalyses {
    if (_muscleAnalyses is EqualUnmodifiableListView) return _muscleAnalyses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_muscleAnalyses);
  }

  final List<InsightMessage> _messages;
  @override
  List<InsightMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  final String selectedMuscleId;
  @override
  @JsonKey()
  final AtlasSide activeAtlasSide;
  @override
  @JsonKey()
  final bool isChatPanelOpen;

  @override
  String toString() {
    return 'InsightState(muscleData: $muscleData, muscleAnalyses: $muscleAnalyses, messages: $messages, selectedMuscleId: $selectedMuscleId, activeAtlasSide: $activeAtlasSide, isChatPanelOpen: $isChatPanelOpen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InsightStateImpl &&
            const DeepCollectionEquality()
                .equals(other._muscleData, _muscleData) &&
            const DeepCollectionEquality()
                .equals(other._muscleAnalyses, _muscleAnalyses) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.selectedMuscleId, selectedMuscleId) ||
                other.selectedMuscleId == selectedMuscleId) &&
            (identical(other.activeAtlasSide, activeAtlasSide) ||
                other.activeAtlasSide == activeAtlasSide) &&
            (identical(other.isChatPanelOpen, isChatPanelOpen) ||
                other.isChatPanelOpen == isChatPanelOpen));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_muscleData),
      const DeepCollectionEquality().hash(_muscleAnalyses),
      const DeepCollectionEquality().hash(_messages),
      selectedMuscleId,
      activeAtlasSide,
      isChatPanelOpen);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InsightStateImplCopyWith<_$InsightStateImpl> get copyWith =>
      __$$InsightStateImplCopyWithImpl<_$InsightStateImpl>(this, _$identity);
}

abstract class _InsightState implements InsightState {
  const factory _InsightState(
      {required final List<MuscleData> muscleData,
      required final List<MuscleAnalysis> muscleAnalyses,
      required final List<InsightMessage> messages,
      required final String selectedMuscleId,
      final AtlasSide activeAtlasSide,
      final bool isChatPanelOpen}) = _$InsightStateImpl;

  @override
  List<MuscleData> get muscleData;
  @override
  List<MuscleAnalysis> get muscleAnalyses;
  @override
  List<InsightMessage> get messages;
  @override
  String get selectedMuscleId;
  @override
  AtlasSide get activeAtlasSide;
  @override
  bool get isChatPanelOpen;
  @override
  @JsonKey(ignore: true)
  _$$InsightStateImplCopyWith<_$InsightStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
