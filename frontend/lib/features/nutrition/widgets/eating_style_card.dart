import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';

class EatingStyleCard extends StatelessWidget {
  const EatingStyleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      hasShadow: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Eating Style', style: AppTypography.h3),
          const SizedBox(height: AppSpacing.base),
          const Row(
            children: [
              Expanded(
                child: _StyleChip(label: 'HIGH PROTEIN', isSelected: true),
              ),
              SizedBox(width: AppSpacing.sm),
              Expanded(child: _StyleChip(label: 'BALANCED')),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          const Row(
            children: [
              Expanded(child: _StyleChip(label: 'LEAN CUT')),
              SizedBox(width: AppSpacing.sm),
              Expanded(child: _StyleChip(label: 'RECOVERY')),
            ],
          ),
          const SizedBox(height: AppSpacing.base),
          Text(
            'ForgeAI will bias meal timing and macro targets around this style.',
            style: AppTypography.bodySmall.copyWith(height: 1.4),
          ),
        ],
      ),
    );
  }
}

class _StyleChip extends StatelessWidget {
  const _StyleChip({required this.label, this.isSelected = false});

  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSpacing.xxl,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.sportOrangeLight : AppColors.inputBg,
        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
        border: Border.all(
          color: isSelected ? AppColors.sportOrange : AppColors.transparent,
        ),
      ),
      child: Text(
        label,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppTypography.labelUppercase.copyWith(
          color: isSelected ? AppColors.sportOrange : AppColors.textMuted,
          fontSize: 10,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
