import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/nutrition/providers/nutrition_plan_provider.dart';
import 'package:forge_ai/features/nutrition/widgets/nutrition_meal_card.dart';

class NutritionDayTimeline extends ConsumerWidget {
  const NutritionDayTimeline({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final day = ref.watch(selectedNutritionDayProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var index = 0; index < day.meals.length; index++) ...[
          NutritionMealGroup(meal: day.meals[index]),
          if (index != day.meals.length - 1)
            const SizedBox(height: AppSpacing.xl),
        ],
      ],
    );
  }
}
