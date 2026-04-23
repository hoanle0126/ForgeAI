import 'package:freezed_annotation/freezed_annotation.dart';

part 'nutrition_food_item.freezed.dart';
part 'nutrition_food_item.g.dart';

@freezed
class NutritionFoodItem with _$NutritionFoodItem {
  const factory NutritionFoodItem({
    required String name,
    required String detail,
    required int calories,
  }) = _NutritionFoodItem;

  factory NutritionFoodItem.fromJson(Map<String, dynamic> json) =>
      _$NutritionFoodItemFromJson(json);
}
