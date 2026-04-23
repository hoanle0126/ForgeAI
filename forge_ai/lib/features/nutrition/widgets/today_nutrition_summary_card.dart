import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/nutrition/providers/nutrition_plan_provider.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';

class TodayNutritionSummaryCard extends ConsumerWidget {
  const TodayNutritionSummaryCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final day = ref.watch(selectedNutritionDayProvider);
    final target = day.totalCalories;
    // In a real scenario, you'd calculate this:
    const consumed = 1250; // Placeholder for now
    final remaining = target - consumed;

    return AppCard(
      color: AppColors.textDark,
      padding: EdgeInsets.zero,
      hasShadow: false,
      child: Stack(
        children: [
          // Content
          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Tag
                Row(
                  children: [
                    const Icon(Icons.track_changes, color: AppColors.sportOrange, size: 14),
                    const SizedBox(width: 6),
                    Text(
                      'DAILY TARGET',
                      style: AppTypography.labelUppercase.copyWith(
                        color: AppColors.sportOrange,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.md),
                
                // Stats Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('$target', style: AppTypography.statLarge.copyWith(color: AppColors.cardWhite, fontSize: 32)),
                        Text('kcal • Maintenance', style: AppTypography.label.copyWith(color: AppColors.cardWhite.withValues(alpha: 0.7))),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('${remaining > 0 ? remaining : 0}', style: AppTypography.statLarge.copyWith(color: AppColors.sportOrange, fontSize: 24)),
                        Text('Remaining', style: AppTypography.label.copyWith(color: AppColors.cardWhite.withValues(alpha: 0.7))),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),
                
                // Macros
                const _MacroProgressRow(label: 'PRO', value: '145g', color: AppColors.aiBlue, progress: 0.75),
                const SizedBox(height: AppSpacing.md),
                const _MacroProgressRow(label: 'CARB', value: '220g', color: AppColors.energy, progress: 0.4),
                const SizedBox(height: AppSpacing.md),
                const _MacroProgressRow(label: 'FAT', value: '65g', color: AppColors.sportOrange, progress: 0.6),
              ],
            ),
          ),
          // Banner
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.sportOrange, Color(0xFFFF7A45)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(AppSpacing.radiusMd),
                ),
              ),
              child: Text(
                'AI ADAPTED',
                style: AppTypography.labelUppercase.copyWith(
                  color: AppColors.cardWhite,
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MacroProgressRow extends StatelessWidget {
  const _MacroProgressRow({
    required this.label,
    required this.value,
    required this.color,
    required this.progress,
  });

  final String label;
  final String value;
  final Color color;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 35,
          child: Text(
            label,
            style: AppTypography.labelUppercase.copyWith(color: color, fontSize: 12),
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Container(
            height: 6,
            decoration: BoxDecoration(
              color: AppColors.cardWhite.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(3),
            ),
            alignment: Alignment.centerLeft,
            child: FractionallySizedBox(
              widthFactor: progress.clamp(0.0, 1.0),
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        SizedBox(
          width: 45,
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: AppTypography.statSmall.copyWith(color: AppColors.cardWhite, fontSize: 12),
          ),
        ),
      ],
    );
  }
}
