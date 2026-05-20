import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/nutrition/models/nutrition_adjustment_message.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';

class NutritionAdjustmentChatCard extends StatelessWidget {
  const NutritionAdjustmentChatCard({super.key, required this.messages});

  final List<NutritionAdjustmentMessage> messages;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: messages.isEmpty
            ? [
                Text(
                  'Ask ForgeAI for a meal adjustment.',
                  style: AppTypography.bodyMedium,
                ),
              ]
            : [
                for (final message in messages) ...[
                  Align(
                    alignment: message.isUser
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: _MessageBubble(message: message),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                ],
              ],
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  const _MessageBubble({required this.message});

  final NutritionAdjustmentMessage message;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: message.isUser ? AppColors.sportOrange : AppColors.inputBg,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Text(
          message.text,
          style: AppTypography.bodyMedium.copyWith(
            color: message.isUser ? AppColors.cardWhite : AppColors.textDark,
          ),
        ),
      ),
    );
  }
}
