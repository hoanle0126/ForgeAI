import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/dashboard/widgets/home/dashboard_top_header_row.dart';
import 'package:forge_ai/features/dashboard/widgets/home/page_greeting_title.dart';
import 'package:forge_ai/features/dashboard/widgets/home/performance_snapshot_card.dart';
import 'package:forge_ai/features/dashboard/widgets/home/today_plan_section.dart';
import 'package:forge_ai/features/dashboard/widgets/home/weekly_progress_row.dart';
import 'package:forge_ai/features/dashboard/widgets/nutrition/nutrition_overview_card.dart';

class WideDashboardHomeLayout extends StatelessWidget {
  const WideDashboardHomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: AppSpacing.lg),
        DashboardTopHeaderRow(),
        SizedBox(height: AppSpacing.xl),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  PageGreetingTitle(),
                  SizedBox(height: AppSpacing.xl),
                  TodayPlanSection(),
                ],
              ),
            ),
            SizedBox(width: AppSpacing.lg),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 88),
                  NutritionOverviewCard(),
                  SizedBox(height: AppSpacing.sm),
                  WeeklyProgressRow(),
                  SizedBox(height: AppSpacing.base),
                  PerformanceSnapshotCard(),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: AppSpacing.xxl),
      ],
    );
  }
}
