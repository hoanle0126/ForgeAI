// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition_food_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NutritionFoodItemImpl _$$NutritionFoodItemImplFromJson(
  Map<String, dynamic> json,
) => _$NutritionFoodItemImpl(
  name: json['name'] as String,
  detail: json['detail'] as String,
  calories: (json['calories'] as num).toInt(),
);

Map<String, dynamic> _$$NutritionFoodItemImplToJson(
  _$NutritionFoodItemImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'detail': instance.detail,
  'calories': instance.calories,
};
