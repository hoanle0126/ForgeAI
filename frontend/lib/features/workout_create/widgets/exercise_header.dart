import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ExerciseHeader extends StatelessWidget {
  const ExerciseHeader({
    super.key,
    required this.index,
    required this.name,
    required this.onRemove,
  });

  final int index;
  final String name;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.base),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: AppColors.sportOrangeLight,
              borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
            ),
            child: Center(
              child: Text(
                '${index + 1}',
                style: AppTypography.bodySemiBold.copyWith(
                  color: AppColors.sportOrange,
                ),
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Text(
              name,
              style: AppTypography.bodySemiBold.copyWith(
                color: AppColors.textDark,
                fontSize: 16,
              ),
            ),
          ),
          IconButton(
            onPressed: onRemove,
            icon: PhosphorIcon(
              PhosphorIcons.trash(),
              color: AppColors.textMuted,
              size: 20,
            ),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }
}
