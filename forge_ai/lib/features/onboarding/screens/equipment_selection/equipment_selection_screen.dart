import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/onboarding/providers/onboarding_provider.dart';
import 'package:forge_ai/features/onboarding/widgets/common/onboarding_app_bar.dart';
import 'package:forge_ai/features/onboarding/widgets/equipment_selection/equipment_grid.dart';
import 'package:forge_ai/features/onboarding/widgets/equipment_selection/equipment_scaling_promo.dart';
import 'package:forge_ai/features/onboarding/widgets/equipment_selection/equipment_selection_action_bar.dart';

class EquipmentSelectionScreen extends ConsumerWidget {
  const EquipmentSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedEquipment = ref.watch(selectedEquipmentProvider);

    return Scaffold(
      backgroundColor: AppColors.warmIvory,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const OnboardingAppBar(step: 2, totalSteps: 5, title: 'Equipment'),
            Expanded(
              child: SingleChildScrollView(
                padding: AppSpacing.screenPadding.copyWith(
                  bottom: AppSpacing.xxl,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: AppSpacing.base),
                    Text(
                          'What equipment do you\nhave?',
                          style: AppTypography.h1.copyWith(
                            fontSize: 32,
                            height: 1.0,
                            letterSpacing: -1.0,
                          ),
                        )
                        .animate()
                        .fadeIn(duration: 400.ms)
                        .slideY(begin: 0.2, end: 0),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                          "Select all that apply — we'll build around it",
                          style: AppTypography.bodyLarge.copyWith(
                            color: AppColors.textDisabled,
                            height: 1.4,
                          ),
                        )
                        .animate()
                        .fadeIn(delay: 100.ms, duration: 400.ms)
                        .slideY(begin: 0.2, end: 0),
                    const SizedBox(height: AppSpacing.xl),
                    const EquipmentGrid(),
                    const SizedBox(height: AppSpacing.xl),
                    const EquipmentScalingPromo()
                        .animate()
                        .fadeIn(delay: 600.ms)
                        .moveY(begin: 20, end: 0),
                  ],
                ),
              ),
            ),
            EquipmentSelectionActionBar(selectedEquipment: selectedEquipment),
          ],
        ),
      ),
    );
  }
}
