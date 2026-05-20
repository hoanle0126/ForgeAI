// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrition_adjustment_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

NutritionAdjustmentMessage _$NutritionAdjustmentMessageFromJson(
  Map<String, dynamic> json,
) {
  return _NutritionAdjustmentMessage.fromJson(json);
}

/// @nodoc
mixin _$NutritionAdjustmentMessage {
  String get text => throw _privateConstructorUsedError;
  bool get isUser => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NutritionAdjustmentMessageCopyWith<NutritionAdjustmentMessage>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NutritionAdjustmentMessageCopyWith<$Res> {
  factory $NutritionAdjustmentMessageCopyWith(
    NutritionAdjustmentMessage value,
    $Res Function(NutritionAdjustmentMessage) then,
  ) =
      _$NutritionAdjustmentMessageCopyWithImpl<
        $Res,
        NutritionAdjustmentMessage
      >;
  @useResult
  $Res call({String text, bool isUser});
}

/// @nodoc
class _$NutritionAdjustmentMessageCopyWithImpl<
  $Res,
  $Val extends NutritionAdjustmentMessage
>
    implements $NutritionAdjustmentMessageCopyWith<$Res> {
  _$NutritionAdjustmentMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? text = null, Object? isUser = null}) {
    return _then(
      _value.copyWith(
            text: null == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                      as String,
            isUser: null == isUser
                ? _value.isUser
                : isUser // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NutritionAdjustmentMessageImplCopyWith<$Res>
    implements $NutritionAdjustmentMessageCopyWith<$Res> {
  factory _$$NutritionAdjustmentMessageImplCopyWith(
    _$NutritionAdjustmentMessageImpl value,
    $Res Function(_$NutritionAdjustmentMessageImpl) then,
  ) = __$$NutritionAdjustmentMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, bool isUser});
}

/// @nodoc
class __$$NutritionAdjustmentMessageImplCopyWithImpl<$Res>
    extends
        _$NutritionAdjustmentMessageCopyWithImpl<
          $Res,
          _$NutritionAdjustmentMessageImpl
        >
    implements _$$NutritionAdjustmentMessageImplCopyWith<$Res> {
  __$$NutritionAdjustmentMessageImplCopyWithImpl(
    _$NutritionAdjustmentMessageImpl _value,
    $Res Function(_$NutritionAdjustmentMessageImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? text = null, Object? isUser = null}) {
    return _then(
      _$NutritionAdjustmentMessageImpl(
        text: null == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String,
        isUser: null == isUser
            ? _value.isUser
            : isUser // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NutritionAdjustmentMessageImpl implements _NutritionAdjustmentMessage {
  const _$NutritionAdjustmentMessageImpl({
    required this.text,
    required this.isUser,
  });

  factory _$NutritionAdjustmentMessageImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$NutritionAdjustmentMessageImplFromJson(json);

  @override
  final String text;
  @override
  final bool isUser;

  @override
  String toString() {
    return 'NutritionAdjustmentMessage(text: $text, isUser: $isUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NutritionAdjustmentMessageImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.isUser, isUser) || other.isUser == isUser));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text, isUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NutritionAdjustmentMessageImplCopyWith<_$NutritionAdjustmentMessageImpl>
  get copyWith =>
      __$$NutritionAdjustmentMessageImplCopyWithImpl<
        _$NutritionAdjustmentMessageImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NutritionAdjustmentMessageImplToJson(this);
  }
}

abstract class _NutritionAdjustmentMessage
    implements NutritionAdjustmentMessage {
  const factory _NutritionAdjustmentMessage({
    required final String text,
    required final bool isUser,
  }) = _$NutritionAdjustmentMessageImpl;

  factory _NutritionAdjustmentMessage.fromJson(Map<String, dynamic> json) =
      _$NutritionAdjustmentMessageImpl.fromJson;

  @override
  String get text;
  @override
  bool get isUser;
  @override
  @JsonKey(ignore: true)
  _$$NutritionAdjustmentMessageImplCopyWith<_$NutritionAdjustmentMessageImpl>
  get copyWith => throw _privateConstructorUsedError;
}
