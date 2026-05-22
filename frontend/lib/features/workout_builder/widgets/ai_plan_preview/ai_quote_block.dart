import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';

class AiQuoteBlock extends StatelessWidget {
  const AiQuoteBlock({
    super.key,
    required this.quote,
    this.signature = '— COACH FORGEAI',
  });

  final String quote;
  final String signature;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          border: Border(left: BorderSide(color: AppColors.aiBlue, width: 4)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: AppSpacing.base),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '"$quote"',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textDark.withValues(alpha: 0.8),
                  fontStyle: FontStyle.italic,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                signature,
                textAlign: TextAlign.right,
                style: AppTypography.labelUppercase.copyWith(
                  color: AppColors.aiBlue,
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
