import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/dashboard/widgets/home/ai_readiness_card.dart';
import 'package:forge_ai/features/dashboard/widgets/home/dashboard_top_header_row.dart';
import 'package:forge_ai/features/dashboard/widgets/home/page_greeting_title.dart';
import 'package:forge_ai/features/dashboard/widgets/home/stats_grid_row.dart';
import 'package:forge_ai/features/dashboard/widgets/home/weekly_progress_row.dart';
import 'package:forge_ai/features/dashboard/widgets/nutrition/nutrition_overview_card.dart';
import 'package:forge_ai/features/dashboard/widgets/workout/hero_workout_card.dart';

class DashboardHomeScreen extends StatelessWidget {
  const DashboardHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.warmIvory,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppSpacing.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: AppSpacing.md),
              DashboardTopHeaderRow(),
              SizedBox(height: AppSpacing.lg),
              PageGreetingTitle(),
              SizedBox(height: AppSpacing.base),
              AiReadinessCard(),
              SizedBox(height: AppSpacing.base),
              HeroWorkoutCard(),
              SizedBox(height: AppSpacing.base),
              NutritionOverviewCard(),
              SizedBox(height: AppSpacing.base),
              WeeklyProgressRow(),
              SizedBox(height: AppSpacing.base),
              StatsGridRow(),
              SizedBox(height: AppSpacing.xxl),
            ],
          ),
        ),
      ),
    );
  }
}
