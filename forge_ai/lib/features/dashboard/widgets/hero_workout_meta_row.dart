import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';

class HeroWorkoutMetaRow extends StatelessWidget {
  const HeroWorkoutMetaRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _HeroPill(
          child: Text(
            'TODAY\'S FOCUS',
            style: AppTypography.labelUppercase.copyWith(
              color: AppColors.textDark,
              fontWeight: FontWeight.w800,
              fontSize: 10,
            ),
          ),
        ),
        _HeroPill(
          radius: AppSpacing.radiusSm,
          child: Text('28m', style: AppTypography.statSmall),
        ),
      ],
    );
  }
}

class _HeroPill extends StatelessWidget {
  const _HeroPill({required this.child, this.radius = AppSpacing.radiusFull});

  final Widget child;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: AppColors.cardWhite,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: child,
    );
  }
}
