import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/dashboard/models/dashboard_home_summary.dart';
import 'package:forge_ai/features/dashboard/providers/dashboard_home_provider.dart';
import 'package:forge_ai/features/dashboard/widgets/home/ai_readiness_card.dart';
import 'package:forge_ai/features/dashboard/widgets/home/dashboard_top_header_row.dart';
import 'package:forge_ai/features/dashboard/widgets/home/page_greeting_title.dart';
import 'package:forge_ai/features/dashboard/widgets/home/stats_grid_row.dart';
import 'package:forge_ai/features/dashboard/widgets/home/weekly_progress_row.dart';
import 'package:forge_ai/features/dashboard/widgets/workout/hero_workout_card.dart';

class DashboardHomeScreen extends ConsumerWidget {
  const DashboardHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeSummaryAsync = ref.watch(dashboardHomeProvider);
    final homeSummary =
        homeSummaryAsync.valueOrNull ?? DashboardHomeSummary.fallback;

    return Scaffold(
      backgroundColor: AppColors.warmIvory,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppSpacing.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: AppSpacing.md),
              const DashboardTopHeaderRow(),
              const SizedBox(height: AppSpacing.lg),
              PageGreetingTitle(
                greetingLine: homeSummary.greetingLine,
                athleteAlias: homeSummary.athleteAlias,
              ),
              const SizedBox(height: AppSpacing.base),
              AiReadinessCard(
                readinessScore: homeSummary.readinessScore,
                readinessMessage: homeSummary.readinessMessage,
              ),
              const SizedBox(height: AppSpacing.base),
              const HeroWorkoutCard(),
              const SizedBox(height: AppSpacing.base),
              const WeeklyProgressRow(),
              const SizedBox(height: AppSpacing.base),
              StatsGridRow(
                volumeValue: homeSummary.volumeValue,
                volumeUnit: homeSummary.volumeUnit,
                streakDays: homeSummary.streakDays,
              ),
              const SizedBox(height: AppSpacing.xxl),
            ],
          ),
        ),
      ),
    );
  }
}
