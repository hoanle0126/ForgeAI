import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/insight/models/insight_models.dart';

class InsightAtlasSideControl extends StatelessWidget {
  const InsightAtlasSideControl({
    super.key,
    required this.activeSide,
    required this.onChanged,
  });

  final AtlasSide activeSide;
  final ValueChanged<AtlasSide> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xs),
      decoration: BoxDecoration(
        color: AppColors.inputBg,
        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _SideButton(
            label: 'FRONT',
            isSelected: activeSide == AtlasSide.front,
            onTap: () => onChanged(AtlasSide.front),
          ),
          _SideButton(
            label: 'BACK',
            isSelected: activeSide == AtlasSide.back,
            onTap: () => onChanged(AtlasSide.back),
          ),
        ],
      ),
    );
  }
}

class _SideButton extends StatelessWidget {
  const _SideButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.sportOrange : AppColors.transparent,
          borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
        ),
        child: Text(
          label,
          style: AppTypography.labelUppercase.copyWith(
            color: isSelected ? AppColors.cardWhite : AppColors.textMuted,
          ),
        ),
      ),
    );
  }
}
