import 'package:forge_ai/features/nutrition/models/nutrition_food_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'nutrition_meal.freezed.dart';
part 'nutrition_meal.g.dart';

@freezed
class NutritionMeal with _$NutritionMeal {
  const factory NutritionMeal({
    required String label,
    required String time,
    required int calories,
    required int proteinGrams,
    required int carbsGrams,
    required int fatGrams,
    required List<NutritionFoodItem> items,
  }) = _NutritionMeal;

  factory NutritionMeal.fromJson(Map<String, dynamic> json) =>
      _$NutritionMealFromJson(json);
}
