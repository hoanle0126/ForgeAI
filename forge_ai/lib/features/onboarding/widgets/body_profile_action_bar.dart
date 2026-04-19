import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/router/app_router.dart';
import 'package:forge_ai/features/onboarding/providers/onboarding_provider.dart';
import 'package:forge_ai/shared/widgets/app_button.dart';
import 'package:go_router/go_router.dart';

class BodyProfileActionBar extends ConsumerWidget {
  const BodyProfileActionBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = ref.watch(heightProvider);
    final weight = ref.watch(weightProvider);
    final age = ref.watch(ageProvider);
    final activityLevel = ref.watch(activityLevelProvider);
    final isValid =
        height.isNotEmpty &&
        weight.isNotEmpty &&
        age.isNotEmpty &&
        activityLevel != null;

    return Padding(
      padding: const EdgeInsets.only(
        left: AppSpacing.lg,
        right: AppSpacing.lg,
        bottom: AppSpacing.xl,
        top: AppSpacing.base,
      ),
      child: AppButton(
        text: 'Continue',
        trailingIcon: Icons.arrow_forward,
        onPressed: isValid
            ? () => context.push(AppRoutes.schedulePreference)
            : null,
      ),
    );
  }
}
