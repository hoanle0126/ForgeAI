import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class NutritionAdjustmentInputBar extends StatelessWidget {
  const NutritionAdjustmentInputBar({
    super.key,
    required this.controller,
    required this.onSubmitted,
  });

  final TextEditingController controller;
  final VoidCallback onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            style: AppTypography.bodySemiBold.copyWith(
              color: AppColors.textDark,
            ),
            decoration: InputDecoration(
              hintText: 'Tell ForgeAI what to adjust',
              hintStyle: AppTypography.bodyMedium,
              filled: true,
              fillColor: AppColors.inputBg,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                borderSide: BorderSide.none,
              ),
            ),
            onSubmitted: (_) => onSubmitted(),
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        IconButton.filled(
          onPressed: onSubmitted,
          icon: Icon(PhosphorIcons.arrowUp(PhosphorIconsStyle.bold)),
          style: IconButton.styleFrom(backgroundColor: AppColors.sportOrange),
        ),
      ],
    );
  }
}
