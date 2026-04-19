import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/onboarding/providers/onboarding_provider.dart';

class PreferredTimeGrid extends ConsumerWidget {
  const PreferredTimeGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTime = ref.watch(preferredTimeProvider);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 64,
        mainAxisSpacing: AppSpacing.md,
        crossAxisSpacing: AppSpacing.md,
      ),
      itemCount: PreferredTime.values.length,
      itemBuilder: (context, index) {
        final time = PreferredTime.values[index];
        final isSelected = selectedTime == time;
        return GestureDetector(
          onTap: () => ref.read(preferredTimeProvider.notifier).select(time),
          child: AnimatedContainer(
            duration: 200.ms,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.sportOrange : AppColors.inputBg,
              borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  time.icon,
                  size: 18,
                  color: isSelected ? AppColors.cardWhite : AppColors.textDark,
                ),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  time.label,
                  style: AppTypography.bodyMedium.copyWith(
                    color: isSelected
                        ? AppColors.cardWhite
                        : AppColors.textDark,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
