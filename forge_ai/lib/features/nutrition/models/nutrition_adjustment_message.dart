import 'package:freezed_annotation/freezed_annotation.dart';

part 'nutrition_adjustment_message.freezed.dart';
part 'nutrition_adjustment_message.g.dart';

@freezed
class NutritionAdjustmentMessage with _$NutritionAdjustmentMessage {
  const factory NutritionAdjustmentMessage({
    required String text,
    required bool isUser,
  }) = _NutritionAdjustmentMessage;

  factory NutritionAdjustmentMessage.fromJson(Map<String, dynamic> json) =>
      _$NutritionAdjustmentMessageFromJson(json);
}
