import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/dashboard/widgets/home/dashboard_top_header_row.dart';
import 'package:forge_ai/features/dashboard/widgets/home/page_greeting_title.dart';
import 'package:forge_ai/features/dashboard/widgets/home/performance_snapshot_card.dart';
import 'package:forge_ai/features/dashboard/widgets/home/today_plan_section.dart';
import 'package:forge_ai/features/dashboard/widgets/home/weekly_progress_row.dart';
import 'package:forge_ai/features/dashboard/widgets/nutrition/nutrition_overview_card.dart';

class CompactDashboardHomeLayout extends StatelessWidget {
  const CompactDashboardHomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: AppSpacing.md),
        DashboardTopHeaderRow(),
        SizedBox(height: AppSpacing.lg),
        PageGreetingTitle(),
        SizedBox(height: AppSpacing.xl),
        TodayPlanSection(),
        SizedBox(height: AppSpacing.lg),
        NutritionOverviewCard(),
        SizedBox(height: AppSpacing.sm),
        WeeklyProgressRow(),
        SizedBox(height: AppSpacing.base),
        PerformanceSnapshotCard(),
        SizedBox(height: AppSpacing.xxl),
      ],
    );
  }
}
