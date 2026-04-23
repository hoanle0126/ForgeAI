import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';

class NutritionChatScreen extends StatelessWidget {
  const NutritionChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.warmIvory,
      appBar: AppBar(backgroundColor: AppColors.warmIvory, elevation: 0),
      body: Padding(
        padding: AppSpacing.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSpacing.base),
            Text('Adjust with AI', style: AppTypography.h2),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'Use AI to recalculate today\'s meals or rebuild your weekly plan.',
              style: AppTypography.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
