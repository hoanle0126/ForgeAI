// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrition_food_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

NutritionFoodItem _$NutritionFoodItemFromJson(Map<String, dynamic> json) {
  return _NutritionFoodItem.fromJson(json);
}

/// @nodoc
mixin _$NutritionFoodItem {
  String get name => throw _privateConstructorUsedError;
  String get detail => throw _privateConstructorUsedError;
  int get calories => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NutritionFoodItemCopyWith<NutritionFoodItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NutritionFoodItemCopyWith<$Res> {
  factory $NutritionFoodItemCopyWith(
    NutritionFoodItem value,
    $Res Function(NutritionFoodItem) then,
  ) = _$NutritionFoodItemCopyWithImpl<$Res, NutritionFoodItem>;
  @useResult
  $Res call({String name, String detail, int calories});
}

/// @nodoc
class _$NutritionFoodItemCopyWithImpl<$Res, $Val extends NutritionFoodItem>
    implements $NutritionFoodItemCopyWith<$Res> {
  _$NutritionFoodItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? detail = null,
    Object? calories = null,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            detail: null == detail
                ? _value.detail
                : detail // ignore: cast_nullable_to_non_nullable
                      as String,
            calories: null == calories
                ? _value.calories
                : calories // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NutritionFoodItemImplCopyWith<$Res>
    implements $NutritionFoodItemCopyWith<$Res> {
  factory _$$NutritionFoodItemImplCopyWith(
    _$NutritionFoodItemImpl value,
    $Res Function(_$NutritionFoodItemImpl) then,
  ) = __$$NutritionFoodItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String detail, int calories});
}

/// @nodoc
class __$$NutritionFoodItemImplCopyWithImpl<$Res>
    extends _$NutritionFoodItemCopyWithImpl<$Res, _$NutritionFoodItemImpl>
    implements _$$NutritionFoodItemImplCopyWith<$Res> {
  __$$NutritionFoodItemImplCopyWithImpl(
    _$NutritionFoodItemImpl _value,
    $Res Function(_$NutritionFoodItemImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? detail = null,
    Object? calories = null,
  }) {
    return _then(
      _$NutritionFoodItemImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        detail: null == detail
            ? _value.detail
            : detail // ignore: cast_nullable_to_non_nullable
                  as String,
        calories: null == calories
            ? _value.calories
            : calories // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NutritionFoodItemImpl implements _NutritionFoodItem {
  const _$NutritionFoodItemImpl({
    required this.name,
    required this.detail,
    required this.calories,
  });

  factory _$NutritionFoodItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$NutritionFoodItemImplFromJson(json);

  @override
  final String name;
  @override
  final String detail;
  @override
  final int calories;

  @override
  String toString() {
    return 'NutritionFoodItem(name: $name, detail: $detail, calories: $calories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NutritionFoodItemImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.calories, calories) ||
                other.calories == calories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, detail, calories);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NutritionFoodItemImplCopyWith<_$NutritionFoodItemImpl> get copyWith =>
      __$$NutritionFoodItemImplCopyWithImpl<_$NutritionFoodItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$NutritionFoodItemImplToJson(this);
  }
}

abstract class _NutritionFoodItem implements NutritionFoodItem {
  const factory _NutritionFoodItem({
    required final String name,
    required final String detail,
    required final int calories,
  }) = _$NutritionFoodItemImpl;

  factory _NutritionFoodItem.fromJson(Map<String, dynamic> json) =
      _$NutritionFoodItemImpl.fromJson;

  @override
  String get name;
  @override
  String get detail;
  @override
  int get calories;
  @override
  @JsonKey(ignore: true)
  _$$NutritionFoodItemImplCopyWith<_$NutritionFoodItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
