import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:go_router/go_router.dart';

class OnboardingAppBar extends StatelessWidget {
  const OnboardingAppBar({
    super.key,
    required this.step,
    required this.totalSteps,
    required this.title,
    this.onSkip,
    this.showSkip = true,
  });

  final int step;
  final int totalSteps;
  final String title;
  final VoidCallback? onSkip;
  final bool showSkip;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.base,
        vertical: AppSpacing.sm,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left Component: Back Button & Step Progress
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColors.textDark,
                    ),
                    onPressed: () {
                      if (context.canPop()) {
                        context.pop();
                      } else {
                        // Web fallback if navigating directly via URL
                        context.go('/');
                      }
                    },
                  ),
                  const SizedBox(width: AppSpacing.xs),
                  Text(
                    'Step $step of $totalSteps',
                    style: AppTypography.labelUppercase.copyWith(
                      color: AppColors.textDisabled,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0,
                    ),
                  ),
                ],
              ),

              // Right Component: Skip Button
              if (showSkip)
                GestureDetector(
                  onTap: onSkip,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.sm,
                      vertical: AppSpacing.xs,
                    ),
                    child: Text(
                      'Skip',
                      style: AppTypography.labelUppercase.copyWith(
                        color: AppColors.sportOrange,
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                )
              else
                const SizedBox(width: 48), // Padding equivalent for symmetry
            ],
          ),

          // Center Component: Unified Title
          Text(title, style: AppTypography.h3.copyWith(fontSize: 18)),
        ],
      ),
    );
  }
}
