import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/router/app_router.dart';
import 'package:forge_ai/features/nutrition/widgets/nutrition_ai_chat_fab.dart';
import 'package:forge_ai/features/nutrition/widgets/nutrition_day_timeline.dart';
import 'package:forge_ai/features/nutrition/widgets/nutrition_screen_header.dart';
import 'package:forge_ai/features/nutrition/widgets/nutrition_week_strip.dart';
import 'package:forge_ai/features/nutrition/widgets/today_nutrition_summary_card.dart';
import 'package:go_router/go_router.dart';

class NutritionScreen extends StatelessWidget {
  const NutritionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.warmIvory,
      floatingActionButton: NutritionAiChatFab(
        onPressed: () => context.push(AppRoutes.nutritionChat),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          padding: AppSpacing.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: AppSpacing.md),
              NutritionScreenHeader(),
              SizedBox(height: AppSpacing.lg),
              NutritionWeekStrip(),
              SizedBox(height: AppSpacing.base),
              TodayNutritionSummaryCard(),
              SizedBox(height: AppSpacing.lg),
              NutritionDayTimeline(),
              SizedBox(height: AppSpacing.xxxl),
              SizedBox(height: AppSpacing.xxxl),
            ],
          ),
        ),
      ),
    );
  }
}
