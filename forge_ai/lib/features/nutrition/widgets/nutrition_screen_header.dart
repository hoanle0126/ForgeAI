import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';

class NutritionScreenHeader extends StatelessWidget {
  const NutritionScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Meals', style: AppTypography.h1),
        const SizedBox(height: AppSpacing.xs),
        Text('Your AI-built weekly meal plan', style: AppTypography.bodyMedium),
      ],
    );
  }
}
