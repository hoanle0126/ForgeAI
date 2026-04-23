import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/insight/widgets/insight_ai_entry_button.dart';

class NutritionScreenHeader extends StatelessWidget {
  const NutritionScreenHeader({super.key, required this.onChatPressed});

  final VoidCallback onChatPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Meals', style: AppTypography.h1),
              const SizedBox(height: AppSpacing.xs),
              Text('Your AI-built weekly meal plan',
                  style: AppTypography.bodyMedium),
            ],
          ),
        ),
        InsightAiEntryButton(onPressed: onChatPressed),
      ],
    );
  }
}
