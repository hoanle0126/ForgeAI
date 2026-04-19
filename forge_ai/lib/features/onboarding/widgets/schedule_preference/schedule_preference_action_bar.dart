import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/router/app_router.dart';
import 'package:forge_ai/features/onboarding/providers/onboarding_provider.dart';
import 'package:forge_ai/shared/widgets/app_button.dart';
import 'package:go_router/go_router.dart';

class SchedulePreferenceActionBar extends ConsumerWidget {
  const SchedulePreferenceActionBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final days = ref.watch(selectedDaysProvider);
    final time = ref.watch(preferredTimeProvider);
    final isValid = days.isNotEmpty && time != null;

    return Padding(
      padding: const EdgeInsets.only(
        left: AppSpacing.lg,
        right: AppSpacing.lg,
        bottom: AppSpacing.xl,
        top: AppSpacing.base,
      ),
      child: AppButton(
        text: 'Continue',
        onPressed: isValid ? () => context.push(AppRoutes.aiPlanPreview) : null,
      ),
    );
  }
}
