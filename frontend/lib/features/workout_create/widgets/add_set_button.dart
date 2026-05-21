import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AddSetButton extends StatelessWidget {
  const AddSetButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PhosphorIcon(
              PhosphorIcons.plus(),
              color: AppColors.sportOrange,
              size: 16,
            ),
            const SizedBox(width: AppSpacing.xs),
            Text(
              'Add Set',
              style: AppTypography.bodySemiBold.copyWith(
                color: AppColors.sportOrange,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
