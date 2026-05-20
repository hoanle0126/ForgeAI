import 'package:forge_ai/features/nutrition/models/nutrition_meal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'nutrition_day_plan.freezed.dart';
part 'nutrition_day_plan.g.dart';

@freezed
class NutritionDayPlan with _$NutritionDayPlan {
  const factory NutritionDayPlan({
    required String weekdayLabel,
    required int dayNumber,
    required String strategyTitle,
    required String strategySummary,
    required int totalCalories,
    required int proteinGrams,
    required int carbsGrams,
    required int fatGrams,
    required List<NutritionMeal> meals,
    @Default(false) bool isToday,
    @Default(false) bool isUpdated,
  }) = _NutritionDayPlan;

  factory NutritionDayPlan.fromJson(Map<String, dynamic> json) =>
      _$NutritionDayPlanFromJson(json);
}
