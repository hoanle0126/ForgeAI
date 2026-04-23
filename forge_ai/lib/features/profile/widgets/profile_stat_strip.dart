import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProfileStatStrip extends StatelessWidget {
  const ProfileStatStrip({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Row(
        children: [
          Expanded(
            child: _ProfileMetric(
              icon: PhosphorIcons.fire(PhosphorIconsStyle.fill),
              value: '12',
              label: 'STREAK',
              color: AppColors.sportOrange,
            ),
          ),
          const _VerticalDivider(),
          Expanded(
            child: _ProfileMetric(
              icon: PhosphorIcons.barbell(PhosphorIconsStyle.fill),
              value: '42',
              label: 'SESSIONS',
              color: AppColors.textDark,
            ),
          ),
          const _VerticalDivider(),
          Expanded(
            child: _ProfileMetric(
              icon: PhosphorIcons.chartLineUp(PhosphorIconsStyle.fill),
              value: '+18%',
              label: 'VOLUME',
              color: AppColors.success,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileMetric extends StatelessWidget {
  const _ProfileMetric({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  final IconData icon;
  final String value;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(height: AppSpacing.sm),
        Text(value, style: AppTypography.statMedium.copyWith(color: color)),
        const SizedBox(height: AppSpacing.xs),
        Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTypography.labelUppercase.copyWith(
            fontSize: 10,
            letterSpacing: 0.7,
          ),
        ),
      ],
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  const _VerticalDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: AppSpacing.xxxl,
      color: AppColors.border,
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
    );
  }
}
