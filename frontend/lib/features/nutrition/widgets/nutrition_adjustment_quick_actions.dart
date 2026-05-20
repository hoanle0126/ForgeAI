import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';

class NutritionAdjustmentQuickActions extends StatelessWidget {
  const NutritionAdjustmentQuickActions({
    super.key,
    required this.onPromptSelected,
  });

  final ValueChanged<String> onPromptSelected;

  @override
  Widget build(BuildContext context) {
    const prompts = ['Raise protein', 'Lower calories', 'Make dinner lighter'];

    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: [
        for (final prompt in prompts)
          ActionChip(
            label: Text(prompt, style: AppTypography.bodySemiBold),
            backgroundColor: AppColors.sportOrangeLight,
            side: BorderSide.none,
            onPressed: () => onPromptSelected(prompt),
          ),
      ],
    );
  }
}
