import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/insight/widgets/insight_chat_content.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class InsightChatSidePanel extends StatelessWidget {
  const InsightChatSidePanel({super.key, required this.onClose});

  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Text('AI coach', style: AppTypography.h3)),
              IconButton(
                tooltip: 'Close',
                onPressed: onClose,
                icon: Icon(PhosphorIcons.x()),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          const Expanded(child: InsightChatContent()),
        ],
      ),
    );
  }
}
