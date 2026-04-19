import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/onboarding/widgets/ai_plan_preview/timeline_phase_content.dart';

class TimelinePhase extends StatelessWidget {
  const TimelinePhase({
    super.key,
    required this.phase,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.color,
    this.isFirst = false,
    this.isLast = false,
  });

  final String phase;
  final String title;
  final String subtitle;
  final String description;
  final Color color;
  final bool isFirst;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: AppSpacing.xl,
            child: Column(
              children: [
                Expanded(child: _TimelineLine(isHidden: isFirst)),
                _TimelineDot(color: color),
                Expanded(flex: 5, child: _TimelineLine(isHidden: isLast)),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: Container(
                padding: const EdgeInsets.all(AppSpacing.lg),
                decoration: BoxDecoration(
                  color: AppColors.cardWhite,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
                  border: Border(left: BorderSide(color: color, width: 4)),
                ),
                child: TimelinePhaseContent(
                  phase: phase,
                  title: title,
                  subtitle: subtitle,
                  description: description,
                  color: color,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TimelineLine extends StatelessWidget {
  const _TimelineLine({required this.isHidden});

  final bool isHidden;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      color: isHidden ? AppColors.transparent : AppColors.border,
    );
  }
}

class _TimelineDot extends StatelessWidget {
  const _TimelineDot({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        shape: BoxShape.circle,
      ),
      child: Container(
        width: AppSpacing.sm,
        height: AppSpacing.sm,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
