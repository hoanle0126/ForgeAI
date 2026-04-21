import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/insight/models/insight_models.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';

class InsightCard extends StatelessWidget {
  final InsightMessage message;
  const InsightCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    if (message.isUser) {
      return Align(
        alignment: Alignment.centerRight,
        child: Container(
          margin: const EdgeInsets.only(bottom: 16, left: 40),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.sportOrange,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            message.content,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.cardWhite,
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 16, right: 20),
      child: AppCard(
        color: AppColors.cardWhite.withValues(alpha: 0.9),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.smart_toy, color: AppColors.aiBlue, size: 20),
                const SizedBox(width: 8),
                Text('AI Insight', style: AppTypography.labelUppercase),
              ],
            ),
            const SizedBox(height: 12),
            Text(message.content, style: AppTypography.bodyMedium),
            if (message.hasChart) ...[
              const SizedBox(height: 16),
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: AppColors.warmIvory,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(child: Text('Mini Chart Placeholder')),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
