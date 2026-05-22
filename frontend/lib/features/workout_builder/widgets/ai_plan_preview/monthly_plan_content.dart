import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/workout_builder/models/monthly_workout_plan.dart';
import 'package:forge_ai/features/workout_builder/widgets/ai_plan_preview/ai_quote_block.dart';
import 'package:forge_ai/features/workout_builder/widgets/ai_plan_preview/monthly_block_summary_card.dart';
import 'package:forge_ai/features/workout_builder/widgets/ai_plan_preview/monthly_template_list.dart';
import 'package:forge_ai/features/workout_builder/widgets/ai_plan_preview/timeline_section.dart';

class MonthlyPlanContent extends StatelessWidget {
  const MonthlyPlanContent({super.key, required this.plan});

  final AiMonthlyWorkoutPlan plan;

  @override
  Widget build(BuildContext context) {
    final coachQuote = plan.coachNotes.isNotEmpty
        ? plan.coachNotes.first
        : plan.readinessAdjustment.reason;

    return Column(
      children: [
        MonthlyBlockSummaryCard(plan: plan),
        const SizedBox(height: AppSpacing.xxl),
        TimelineSection(plan: plan),
        const SizedBox(height: AppSpacing.xl),
        MonthlyTemplateList(plan: plan),
        const SizedBox(height: AppSpacing.xl),
        AiQuoteBlock(quote: coachQuote),
      ],
    );
  }
}
