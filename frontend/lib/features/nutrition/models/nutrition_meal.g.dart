// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition_meal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NutritionMealImpl _$$NutritionMealImplFromJson(Map<String, dynamic> json) =>
    _$NutritionMealImpl(
      label: json['label'] as String,
      time: json['time'] as String,
      calories: (json['calories'] as num).toInt(),
      proteinGrams: (json['proteinGrams'] as num).toInt(),
      carbsGrams: (json['carbsGrams'] as num).toInt(),
      fatGrams: (json['fatGrams'] as num).toInt(),
      items: (json['items'] as List<dynamic>)
          .map((e) => NutritionFoodItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$NutritionMealImplToJson(_$NutritionMealImpl instance) =>
    <String, dynamic>{
      'label': instance.label,
      'time': instance.time,
      'calories': instance.calories,
      'proteinGrams': instance.proteinGrams,
      'carbsGrams': instance.carbsGrams,
      'fatGrams': instance.fatGrams,
      'items': instance.items,
    };
