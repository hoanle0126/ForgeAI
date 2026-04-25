import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/nutrition/providers/nutrition_plan_provider.dart';
import 'package:forge_ai/features/nutrition/widgets/macro_progress_row.dart';
import 'package:forge_ai/features/nutrition/widgets/nutrition_ai_adapted_badge.dart';
import 'package:forge_ai/features/nutrition/widgets/nutrition_daily_target_label.dart';
import 'package:forge_ai/features/nutrition/widgets/nutrition_target_summary_row.dart';

class TodayNutritionSummaryCard extends ConsumerWidget {
  const TodayNutritionSummaryCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final day = ref.watch(selectedNutritionDayProvider);
    final target = day.totalCalories;
    const consumed = 1250; // Placeholder
    final rem = target - consumed;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.textDark,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        image: const DecorationImage(
          image: AssetImage('assets/images/dark_gym.png'),
          fit: BoxFit.cover,
          opacity: 0.28,
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const NutritionDailyTargetLabel(),
                const SizedBox(height: AppSpacing.md),
                NutritionTargetSummaryRow(
                  target: target,
                  remaining: rem > 0 ? rem : 0,
                ),
                const SizedBox(height: AppSpacing.lg),
                const MacroProgressRow(
                  label: 'PRO',
                  value: '145g',
                  color: AppColors.aiBlue,
                  progress: 0.75,
                ),
                const SizedBox(height: AppSpacing.md),
                const MacroProgressRow(
                  label: 'CARB',
                  value: '220g',
                  color: AppColors.energy,
                  progress: 0.4,
                ),
                const SizedBox(height: AppSpacing.md),
                const MacroProgressRow(
                  label: 'FAT',
                  value: '65g',
                  color: AppColors.sportOrange,
                  progress: 0.6,
                ),
              ],
            ),
          ),
          const NutritionAiAdaptedBadge(),
        ],
      ),
    );
  }
}
