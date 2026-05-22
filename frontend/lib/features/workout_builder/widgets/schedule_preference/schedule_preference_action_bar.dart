import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/core/router/app_router.dart';
import 'package:forge_ai/features/workout_builder/providers/workout_builder_provider.dart';
import 'package:forge_ai/shared/widgets/app_button.dart';
import 'package:go_router/go_router.dart';

class SchedulePreferenceActionBar extends ConsumerWidget {
  const SchedulePreferenceActionBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final days = ref.watch(selectedDaysProvider);
    final time = ref.watch(preferredTimeProvider);
    final isValid =
        days.length == workoutBuilderMonthlyTrainingDays && time != null;
    final helperText = time == null
        ? 'Choose a preferred training time to continue.'
        : 'Select exactly 4 training days to build the month 1 block.';

    return Padding(
      padding: const EdgeInsets.only(
        left: AppSpacing.lg,
        right: AppSpacing.lg,
        bottom: AppSpacing.xl,
        top: AppSpacing.base,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (!isValid) ...[
            Text(
              helperText,
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textDisabled,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
          ],
          AppButton(
            text: 'Build Month 1 Plan',
            trailingIcon: Icons.auto_awesome,
            onPressed: isValid
                ? () => context.push(AppRoutes.workoutBuilderPreview)
                : null,
          ),
        ],
      ),
    );
  }
}
