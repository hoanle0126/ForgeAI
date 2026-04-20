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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MuscleData _$MuscleDataFromJson(Map<String, dynamic> json) {
  return _MuscleData.fromJson(json);
}

/// @nodoc
mixin _$MuscleData {
  String get id =>
      throw _privateConstructorUsedError; // corresponds to flutter_body_atlas IDs
  double get volume => throw _privateConstructorUsedError;
  double get rpe => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MuscleDataCopyWith<MuscleData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MuscleDataCopyWith<$Res> {
  factory $MuscleDataCopyWith(
          MuscleData value, $Res Function(MuscleData) then) =
      _$MuscleDataCopyWithImpl<$Res, MuscleData>;
  @useResult
  $Res call({String id, double volume, double rpe});
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
  }) {
    return _then(_value.copyWith(
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MuscleDataImplCopyWith<$Res>
    implements $MuscleDataCopyWith<$Res> {
  factory _$$MuscleDataImplCopyWith(
          _$MuscleDataImpl value, $Res Function(_$MuscleDataImpl) then) =
      __$$MuscleDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, double volume, double rpe});
}

/// @nodoc
class __$$MuscleDataImplCopyWithImpl<$Res>
    extends _$MuscleDataCopyWithImpl<$Res, _$MuscleDataImpl>
    implements _$$MuscleDataImplCopyWith<$Res> {
  __$$MuscleDataImplCopyWithImpl(
      _$MuscleDataImpl _value, $Res Function(_$MuscleDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? volume = null,
    Object? rpe = null,
  }) {
    return _then(_$MuscleDataImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MuscleDataImpl implements _MuscleData {
  const _$MuscleDataImpl(
      {required this.id, required this.volume, required this.rpe});

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
  String toString() {
    return 'MuscleData(id: $id, volume: $volume, rpe: $rpe)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MuscleDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.volume, volume) || other.volume == volume) &&
            (identical(other.rpe, rpe) || other.rpe == rpe));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, volume, rpe);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MuscleDataImplCopyWith<_$MuscleDataImpl> get copyWith =>
      __$$MuscleDataImplCopyWithImpl<_$MuscleDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MuscleDataImplToJson(
      this,
    );
  }
}

abstract class _MuscleData implements MuscleData {
  const factory _MuscleData(
      {required final String id,
      required final double volume,
      required final double rpe}) = _$MuscleDataImpl;

  factory _MuscleData.fromJson(Map<String, dynamic> json) =
      _$MuscleDataImpl.fromJson;

  @override
  String get id;
  @override // corresponds to flutter_body_atlas IDs
  double get volume;
  @override
  double get rpe;
  @override
  @JsonKey(ignore: true)
  _$$MuscleDataImplCopyWith<_$MuscleDataImpl> get copyWith =>
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
          InsightMessage value, $Res Function(InsightMessage) then) =
      _$InsightMessageCopyWithImpl<$Res, InsightMessage>;
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
    return _then(_value.copyWith(
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InsightMessageImplCopyWith<$Res>
    implements $InsightMessageCopyWith<$Res> {
  factory _$$InsightMessageImplCopyWith(_$InsightMessageImpl value,
          $Res Function(_$InsightMessageImpl) then) =
      __$$InsightMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String content, bool isUser, bool hasChart});
}

/// @nodoc
class __$$InsightMessageImplCopyWithImpl<$Res>
    extends _$InsightMessageCopyWithImpl<$Res, _$InsightMessageImpl>
    implements _$$InsightMessageImplCopyWith<$Res> {
  __$$InsightMessageImplCopyWithImpl(
      _$InsightMessageImpl _value, $Res Function(_$InsightMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? isUser = null,
    Object? hasChart = null,
  }) {
    return _then(_$InsightMessageImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InsightMessageImpl implements _InsightMessage {
  const _$InsightMessageImpl(
      {required this.id,
      required this.content,
      required this.isUser,
      this.hasChart = false});

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
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InsightMessageImplToJson(
      this,
    );
  }
}

abstract class _InsightMessage implements InsightMessage {
  const factory _InsightMessage(
      {required final String id,
      required final String content,
      required final bool isUser,
      final bool hasChart}) = _$InsightMessageImpl;

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
