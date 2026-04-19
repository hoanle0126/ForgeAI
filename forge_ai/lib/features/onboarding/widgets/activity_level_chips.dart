import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/onboarding/providers/onboarding_provider.dart';

class ActivityLevelChips extends ConsumerWidget {
  const ActivityLevelChips({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(activityLevelProvider);

    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: ActivityLevel.values.map((level) {
        final isSelected = selected == level;
        return GestureDetector(
          onTap: () => ref.read(activityLevelProvider.notifier).select(level),
          child: AnimatedContainer(
            duration: 200.ms,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.md,
            ),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.sportOrange : AppColors.inputBg,
              borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
            ),
            child: Text(
              level.title,
              style: AppTypography.bodyMedium.copyWith(
                color: isSelected ? AppColors.cardWhite : AppColors.textDark,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
