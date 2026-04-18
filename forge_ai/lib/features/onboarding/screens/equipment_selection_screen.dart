import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/core/router/app_router.dart';
import 'package:forge_ai/features/onboarding/providers/onboarding_provider.dart';
import 'package:forge_ai/features/onboarding/widgets/equipment_card.dart';
import 'package:forge_ai/features/onboarding/widgets/onboarding_app_bar.dart';
import 'package:forge_ai/shared/widgets/app_button.dart';
import 'package:go_router/go_router.dart';

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

                    // Headline
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
                            height: 1.4,
                            color: AppColors.textDisabled,
                          ),
                        )
                        .animate()
                        .fadeIn(delay: 100.ms, duration: 400.ms)
                        .slideY(begin: 0.2, end: 0),

                    const SizedBox(height: AppSpacing.xl),

                    // Equipment Grid
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 120, // Lock the height!
                            mainAxisSpacing: AppSpacing.md,
                            crossAxisSpacing: AppSpacing.md,
                          ),
                      itemCount: Equipment.values.length,
                      itemBuilder: (context, index) {
                        final equipment = Equipment.values[index];
                        return EquipmentCard(
                              title: equipment.title,
                              icon: equipment.icon,
                              isSelected: selectedEquipment.contains(equipment),
                              onTap: () {
                                ref
                                    .read(selectedEquipmentProvider.notifier)
                                    .toggle(equipment);
                              },
                            )
                            .animate()
                            .fadeIn(
                              delay: Duration(milliseconds: 200 + index * 50),
                            )
                            .slideY(begin: 0.1, end: 0);
                      },
                    ),

                    const SizedBox(height: AppSpacing.xl),

                    // Precision Scaling Promo
                    Container(
                      padding: const EdgeInsets.all(AppSpacing.lg),
                      decoration: BoxDecoration(
                        color: AppColors.cardWhite,
                        borderRadius: BorderRadius.circular(
                          AppSpacing.radiusLg,
                        ),
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            right: -10,
                            bottom: -10,
                            child: Text(
                              'AI.v2',
                              style: AppTypography.h1.copyWith(
                                fontSize: 60,
                                color: AppColors.sportOrange.withValues(
                                  alpha: 0.1,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Precision Scaling',
                                style: AppTypography.h3,
                              ),
                              const SizedBox(height: AppSpacing.sm),
                              Text(
                                'ForgeAI adjusts load\nrecommendations based\non your available kit.',
                                style: AppTypography.bodyMedium.copyWith(
                                  color: AppColors.textDisabled,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ).animate().fadeIn(delay: 600.ms).moveY(begin: 20, end: 0),
                  ],
                ),
              ),
            ),
            _buildBottomActionBar(context, selectedEquipment),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomActionBar(
    BuildContext context,
    Set<Equipment> selectedEquipment,
  ) {
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
        onPressed: selectedEquipment.isNotEmpty
            ? () {
                context.push(AppRoutes.bodyProfile);
              }
            : null,
      ),
    );
  }
}
