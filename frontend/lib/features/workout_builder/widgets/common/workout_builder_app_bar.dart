import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/core/router/app_router.dart';
import 'package:go_router/go_router.dart';

class WorkoutBuilderAppBar extends StatelessWidget {
  const WorkoutBuilderAppBar({
    super.key,
    this.step,
    this.totalSteps,
    required this.title,
    this.progressLabel,
    this.fallbackRoute = AppRoutes.training,
    this.onSkip,
    this.showSkip = true,
  });

  final int? step;
  final int? totalSteps;
  final String title;
  final String? progressLabel;
  final String fallbackRoute;
  final VoidCallback? onSkip;
  final bool showSkip;

  @override
  Widget build(BuildContext context) {
    final resolvedProgressLabel = _resolvedProgressLabel;

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
                        context.go(fallbackRoute);
                      }
                    },
                  ),
                  if (resolvedProgressLabel != null) ...[
                    const SizedBox(width: AppSpacing.xs),
                    Text(
                      resolvedProgressLabel,
                      style: AppTypography.labelUppercase.copyWith(
                        color: AppColors.textDisabled,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0,
                      ),
                    ),
                  ],
                ],
              ),

              // Right Component: Skip Button
              if (showSkip)
                GestureDetector(
                  onTap: onSkip ?? () => context.go(AppRoutes.training),
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
                const SizedBox(width: AppSpacing.xxxl),
            ],
          ),

          // Center Component: Unified Title
          Text(title, style: AppTypography.h3.copyWith(fontSize: 18)),
        ],
      ),
    );
  }

  String? get _resolvedProgressLabel {
    if (progressLabel != null) return progressLabel;
    if (step == null || totalSteps == null) return null;
    return 'Step $step of $totalSteps';
  }
}
