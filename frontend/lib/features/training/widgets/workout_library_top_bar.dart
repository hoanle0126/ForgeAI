import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class WorkoutLibraryTopBar extends StatelessWidget {
  const WorkoutLibraryTopBar({
    super.key,
    required this.onBack,
    required this.onCreate,
  });

  final VoidCallback onBack;
  final VoidCallback onCreate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.screenPadding.add(
        const EdgeInsets.only(top: AppSpacing.base, bottom: AppSpacing.md),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: onBack,
            icon: PhosphorIcon(PhosphorIcons.caretLeft()),
            color: AppColors.textDark,
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(child: Text('Workout Library', style: AppTypography.h2)),
          TextButton.icon(
            onPressed: onCreate,
            style: TextButton.styleFrom(
              foregroundColor: AppColors.sportOrange,
              textStyle: AppTypography.bodySemiBold,
            ),
            icon: Icon(PhosphorIcons.plus(), size: 18),
            label: Text(
              'Create',
              style: AppTypography.bodySemiBold.copyWith(
                color: AppColors.sportOrange,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
