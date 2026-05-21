import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SelectorSheetHeader extends StatelessWidget {
  const SelectorSheetHeader({super.key, required this.onCreateExercise});

  final VoidCallback onCreateExercise;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.screenPadding,
      child: Row(
        children: [
          Expanded(child: Text('Select Exercise', style: AppTypography.h3)),
          TextButton.icon(
            onPressed: onCreateExercise,
            style: TextButton.styleFrom(
              foregroundColor: AppColors.sportOrange,
              textStyle: AppTypography.bodySemiBold,
            ),
            icon: Icon(PhosphorIcons.plus(), size: 18),
            label: Text(
              'New',
              style: AppTypography.bodySemiBold.copyWith(
                color: AppColors.sportOrange,
              ),
            ),
          ),
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: PhosphorIcon(PhosphorIcons.x(), color: AppColors.textMuted),
          ),
        ],
      ),
    );
  }
}
