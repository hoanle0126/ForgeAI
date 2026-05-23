import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class TrainingStatisticsTopBar extends StatelessWidget {
  const TrainingStatisticsTopBar({super.key, required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onBack,
          icon: PhosphorIcon(PhosphorIcons.caretLeft()),
          color: AppColors.textDark,
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(child: Text('Training Statistics', style: AppTypography.h3)),
      ],
    );
  }
}
