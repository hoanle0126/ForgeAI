import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';

class GoalSelectionHeader extends StatelessWidget {
  const GoalSelectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RichText(
          text: TextSpan(
            style: AppTypography.h1.copyWith(
              fontSize: 48,
              height: 1.0,
              letterSpacing: -1.5,
            ),
            children: [
              const TextSpan(text: "What's your\n"),
              TextSpan(
                text: 'goal?',
                style: AppTypography.h1.copyWith(
                  color: AppColors.sportOrange,
                  fontSize: 48,
                  height: 1.0,
                  letterSpacing: -1.5,
                ),
              ),
            ],
          ),
        ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.2, end: 0),
        const SizedBox(height: AppSpacing.md),
        Text(
              "We'll personalize your training\nplan based on your focus.",
              style: AppTypography.bodyLarge.copyWith(height: 1.4),
            )
            .animate()
            .fadeIn(delay: 100.ms, duration: 400.ms)
            .slideY(begin: 0.2, end: 0),
      ],
    );
  }
}
