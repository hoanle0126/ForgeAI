import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class InsightAiEntryButton extends StatelessWidget {
  const InsightAiEntryButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      key: const ValueKey('insight-ai-entry'),
      tooltip: 'Ask AI',
      style: IconButton.styleFrom(
        backgroundColor: AppColors.aiBlue,
        foregroundColor: AppColors.cardWhite,
        minimumSize: const Size(AppSpacing.xxxl, AppSpacing.xxxl),
      ),
      onPressed: onPressed,
      icon: Icon(PhosphorIcons.sparkle(PhosphorIconsStyle.fill)),
    );
  }
}
