import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/router/app_router.dart';
import 'package:forge_ai/features/nutrition/widgets/nutrition_day_timeline.dart';
import 'package:forge_ai/features/nutrition/widgets/nutrition_screen_header.dart';
import 'package:forge_ai/features/nutrition/widgets/nutrition_week_strip.dart';
import 'package:forge_ai/features/nutrition/widgets/today_nutrition_summary_card.dart';
import 'package:go_router/go_router.dart';

class NutritionScreen extends StatelessWidget {
  const NutritionScreen({super.key});

  static const double _wideBreakpoint = 840;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.warmIvory,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth >= _wideBreakpoint) {
              return const _NutritionWideLayout();
            }
            return const _NutritionMobileLayout();
          },
        ),
      ),
    );
  }
}

class _NutritionMobileLayout extends StatelessWidget {
  const _NutritionMobileLayout();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: AppSpacing.screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: AppSpacing.md),
          NutritionScreenHeader(
            onChatPressed: () => context.push(AppRoutes.nutritionChat),
          ),
          const SizedBox(height: AppSpacing.lg),
          const NutritionWeekStrip(),
          const SizedBox(height: AppSpacing.base),
          const TodayNutritionSummaryCard(),
          const SizedBox(height: AppSpacing.lg),
          const NutritionDayTimeline(),
          const SizedBox(height: AppSpacing.xxxl),
          const SizedBox(height: AppSpacing.xxxl),
        ],
      ),
    );
  }
}

class _NutritionWideLayout extends StatelessWidget {
  const _NutritionWideLayout();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xxl,
        vertical: AppSpacing.lg,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                NutritionScreenHeader(
                  onChatPressed: () => context.push(AppRoutes.nutritionChat),
                ),
                const SizedBox(height: AppSpacing.xl),
                const NutritionWeekStrip(),
                const SizedBox(height: AppSpacing.xl),
                const NutritionDayTimeline(),
                const SizedBox(height: AppSpacing.xxxl),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.xxxl),
          const Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 12,
                ), // Canh chỉnh chiều cao tương đối với cột trái
                TodayNutritionSummaryCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
