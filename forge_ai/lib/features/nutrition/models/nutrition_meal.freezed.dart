// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrition_meal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

NutritionMeal _$NutritionMealFromJson(Map<String, dynamic> json) {
  return _NutritionMeal.fromJson(json);
}

/// @nodoc
mixin _$NutritionMeal {
  String get label => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;
  int get calories => throw _privateConstructorUsedError;
  int get proteinGrams => throw _privateConstructorUsedError;
  int get carbsGrams => throw _privateConstructorUsedError;
  int get fatGrams => throw _privateConstructorUsedError;
  List<NutritionFoodItem> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NutritionMealCopyWith<NutritionMeal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NutritionMealCopyWith<$Res> {
  factory $NutritionMealCopyWith(
    NutritionMeal value,
    $Res Function(NutritionMeal) then,
  ) = _$NutritionMealCopyWithImpl<$Res, NutritionMeal>;
  @useResult
  $Res call({
    String label,
    String time,
    int calories,
    int proteinGrams,
    int carbsGrams,
    int fatGrams,
    List<NutritionFoodItem> items,
  });
}

/// @nodoc
class _$NutritionMealCopyWithImpl<$Res, $Val extends NutritionMeal>
    implements $NutritionMealCopyWith<$Res> {
  _$NutritionMealCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? time = null,
    Object? calories = null,
    Object? proteinGrams = null,
    Object? carbsGrams = null,
    Object? fatGrams = null,
    Object? items = null,
  }) {
    return _then(
      _value.copyWith(
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
            time: null == time
                ? _value.time
                : time // ignore: cast_nullable_to_non_nullable
                      as String,
            calories: null == calories
                ? _value.calories
                : calories // ignore: cast_nullable_to_non_nullable
                      as int,
            proteinGrams: null == proteinGrams
                ? _value.proteinGrams
                : proteinGrams // ignore: cast_nullable_to_non_nullable
                      as int,
            carbsGrams: null == carbsGrams
                ? _value.carbsGrams
                : carbsGrams // ignore: cast_nullable_to_non_nullable
                      as int,
            fatGrams: null == fatGrams
                ? _value.fatGrams
                : fatGrams // ignore: cast_nullable_to_non_nullable
                      as int,
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<NutritionFoodItem>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NutritionMealImplCopyWith<$Res>
    implements $NutritionMealCopyWith<$Res> {
  factory _$$NutritionMealImplCopyWith(
    _$NutritionMealImpl value,
    $Res Function(_$NutritionMealImpl) then,
  ) = __$$NutritionMealImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String label,
    String time,
    int calories,
    int proteinGrams,
    int carbsGrams,
    int fatGrams,
    List<NutritionFoodItem> items,
  });
}

/// @nodoc
class __$$NutritionMealImplCopyWithImpl<$Res>
    extends _$NutritionMealCopyWithImpl<$Res, _$NutritionMealImpl>
    implements _$$NutritionMealImplCopyWith<$Res> {
  __$$NutritionMealImplCopyWithImpl(
    _$NutritionMealImpl _value,
    $Res Function(_$NutritionMealImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? time = null,
    Object? calories = null,
    Object? proteinGrams = null,
    Object? carbsGrams = null,
    Object? fatGrams = null,
    Object? items = null,
  }) {
    return _then(
      _$NutritionMealImpl(
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        time: null == time
            ? _value.time
            : time // ignore: cast_nullable_to_non_nullable
                  as String,
        calories: null == calories
            ? _value.calories
            : calories // ignore: cast_nullable_to_non_nullable
                  as int,
        proteinGrams: null == proteinGrams
            ? _value.proteinGrams
            : proteinGrams // ignore: cast_nullable_to_non_nullable
                  as int,
        carbsGrams: null == carbsGrams
            ? _value.carbsGrams
            : carbsGrams // ignore: cast_nullable_to_non_nullable
                  as int,
        fatGrams: null == fatGrams
            ? _value.fatGrams
            : fatGrams // ignore: cast_nullable_to_non_nullable
                  as int,
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<NutritionFoodItem>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NutritionMealImpl implements _NutritionMeal {
  const _$NutritionMealImpl({
    required this.label,
    required this.time,
    required this.calories,
    required this.proteinGrams,
    required this.carbsGrams,
    required this.fatGrams,
    required final List<NutritionFoodItem> items,
  }) : _items = items;

  factory _$NutritionMealImpl.fromJson(Map<String, dynamic> json) =>
      _$$NutritionMealImplFromJson(json);

  @override
  final String label;
  @override
  final String time;
  @override
  final int calories;
  @override
  final int proteinGrams;
  @override
  final int carbsGrams;
  @override
  final int fatGrams;
  final List<NutritionFoodItem> _items;
  @override
  List<NutritionFoodItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'NutritionMeal(label: $label, time: $time, calories: $calories, proteinGrams: $proteinGrams, carbsGrams: $carbsGrams, fatGrams: $fatGrams, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NutritionMealImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.calories, calories) ||
                other.calories == calories) &&
            (identical(other.proteinGrams, proteinGrams) ||
                other.proteinGrams == proteinGrams) &&
            (identical(other.carbsGrams, carbsGrams) ||
                other.carbsGrams == carbsGrams) &&
            (identical(other.fatGrams, fatGrams) ||
                other.fatGrams == fatGrams) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    label,
    time,
    calories,
    proteinGrams,
    carbsGrams,
    fatGrams,
    const DeepCollectionEquality().hash(_items),
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NutritionMealImplCopyWith<_$NutritionMealImpl> get copyWith =>
      __$$NutritionMealImplCopyWithImpl<_$NutritionMealImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NutritionMealImplToJson(this);
  }
}

abstract class _NutritionMeal implements NutritionMeal {
  const factory _NutritionMeal({
    required final String label,
    required final String time,
    required final int calories,
    required final int proteinGrams,
    required final int carbsGrams,
    required final int fatGrams,
    required final List<NutritionFoodItem> items,
  }) = _$NutritionMealImpl;

  factory _NutritionMeal.fromJson(Map<String, dynamic> json) =
      _$NutritionMealImpl.fromJson;

  @override
  String get label;
  @override
  String get time;
  @override
  int get calories;
  @override
  int get proteinGrams;
  @override
  int get carbsGrams;
  @override
  int get fatGrams;
  @override
  List<NutritionFoodItem> get items;
  @override
  @JsonKey(ignore: true)
  _$$NutritionMealImplCopyWith<_$NutritionMealImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
