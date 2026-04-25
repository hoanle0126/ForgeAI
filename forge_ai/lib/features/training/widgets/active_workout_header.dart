import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ActiveWorkoutHeader extends StatelessWidget {
  const ActiveWorkoutHeader({
    super.key,
    required this.title,
    required this.onClose,
  });

  final String title;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 48,
          height: 48,
          child: Material(
            color: AppColors.cardWhite,
            borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
            child: InkWell(
              onTap: onClose,
              borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
              child: Icon(
                PhosphorIcons.x(PhosphorIconsStyle.bold),
                color: AppColors.textDark,
                size: 20,
              ),
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.base),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'LIVE SESSION',
                style: AppTypography.labelUppercase.copyWith(
                  color: AppColors.sportOrange,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTypography.h3,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
