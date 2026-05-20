// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition_day_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NutritionDayPlanImpl _$$NutritionDayPlanImplFromJson(
  Map<String, dynamic> json,
) => _$NutritionDayPlanImpl(
  weekdayLabel: json['weekdayLabel'] as String,
  dayNumber: (json['dayNumber'] as num).toInt(),
  strategyTitle: json['strategyTitle'] as String,
  strategySummary: json['strategySummary'] as String,
  totalCalories: (json['totalCalories'] as num).toInt(),
  proteinGrams: (json['proteinGrams'] as num).toInt(),
  carbsGrams: (json['carbsGrams'] as num).toInt(),
  fatGrams: (json['fatGrams'] as num).toInt(),
  meals: (json['meals'] as List<dynamic>)
      .map((e) => NutritionMeal.fromJson(e as Map<String, dynamic>))
      .toList(),
  isToday: json['isToday'] as bool? ?? false,
  isUpdated: json['isUpdated'] as bool? ?? false,
);

Map<String, dynamic> _$$NutritionDayPlanImplToJson(
  _$NutritionDayPlanImpl instance,
) => <String, dynamic>{
  'weekdayLabel': instance.weekdayLabel,
  'dayNumber': instance.dayNumber,
  'strategyTitle': instance.strategyTitle,
  'strategySummary': instance.strategySummary,
  'totalCalories': instance.totalCalories,
  'proteinGrams': instance.proteinGrams,
  'carbsGrams': instance.carbsGrams,
  'fatGrams': instance.fatGrams,
  'meals': instance.meals,
  'isToday': instance.isToday,
  'isUpdated': instance.isUpdated,
};
