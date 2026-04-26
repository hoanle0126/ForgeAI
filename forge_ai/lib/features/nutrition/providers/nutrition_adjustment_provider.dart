import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/features/nutrition/models/nutrition_adjustment_message.dart';
import 'package:forge_ai/features/nutrition/providers/nutrition_plan_provider.dart';

final nutritionAdjustmentMessagesProvider =
    NotifierProvider<
      NutritionAdjustmentMessagesNotifier,
      List<NutritionAdjustmentMessage>
    >(NutritionAdjustmentMessagesNotifier.new);

class NutritionAdjustmentMessagesNotifier
    extends Notifier<List<NutritionAdjustmentMessage>> {
  @override
  List<NutritionAdjustmentMessage> build() => const [];

  void sendPrompt(String value) {
    final prompt = value.trim();
    if (prompt.isEmpty) return;

    final day = ref.read(selectedNutritionDayProvider);
    state = [
      ...state,
      NutritionAdjustmentMessage(text: prompt, isUser: true),
      NutritionAdjustmentMessage(
        text:
            'Adjusted dinner while keeping ${day.proteinGrams}g protein and '
            '${day.totalCalories} kcal as the daily guardrails.',
        isUser: false,
      ),
    ];
  }
}
