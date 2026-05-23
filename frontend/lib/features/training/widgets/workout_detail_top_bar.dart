import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class WorkoutDetailTopBar extends StatelessWidget {
  const WorkoutDetailTopBar({
    super.key,
    required this.onBack,
    required this.onEdit,
    required this.onDelete,
  });

  final VoidCallback onBack;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

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
        Expanded(child: Text('Workout Detail', style: AppTypography.h3)),
        IconButton(
          onPressed: onEdit,
          icon: PhosphorIcon(PhosphorIcons.pencilSimple()),
          color: AppColors.textDark,
          tooltip: 'Edit workout',
        ),
        IconButton(
          onPressed: onDelete,
          icon: PhosphorIcon(PhosphorIcons.trash()),
          color: AppColors.sportOrange,
          tooltip: 'Delete workout',
        ),
      ],
    );
  }
}
