import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/insight/widgets/insight_ai_entry_button.dart';

class InsightHeader extends StatelessWidget {
  const InsightHeader({super.key, required this.onChatPressed});

  final VoidCallback onChatPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Insights', style: AppTypography.h2),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'Muscle load and recovery map',
                style: AppTypography.bodyMedium,
              ),
            ],
          ),
        ),
        InsightAiEntryButton(onPressed: onChatPressed),
      ],
    );
  }
}
