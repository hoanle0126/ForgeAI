import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class WeeklyPlanDetailCard extends StatelessWidget {
  const WeeklyPlanDetailCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.accentColor,
    required this.hasWorkout,
    this.isSelected = false,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final Color? accentColor;
  final bool hasWorkout;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final reduceMotion = MediaQuery.disableAnimationsOf(context);
    final duration = reduceMotion ? Duration.zero : Durations.medium2;
    final color = accentColor ?? AppColors.textDisabled;

    return AnimatedSwitcher(
      duration: duration,
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeOutCubic,
      transitionBuilder: (child, animation) {
        final offset = Tween<Offset>(
          begin: const Offset(0, 0.06),
          end: Offset.zero,
        ).animate(animation);

        return FadeTransition(
          opacity: animation,
          child: SlideTransition(position: offset, child: child),
        );
      },
      child: AppCard(
        key: ValueKey('$title-$subtitle'),
        hasShadow: false,
        borderRadius: AppSpacing.radiusLg,
        padding: const EdgeInsets.all(AppSpacing.base),
        color: isSelected && hasWorkout
            ? color.withValues(alpha: 0.08)
            : AppColors.cardWhite,
        onTap: onTap,
        child: Row(
          children: [
            Container(
              width: AppSpacing.xxl,
              height: AppSpacing.xxl,
              decoration: BoxDecoration(
                color: color.withValues(alpha: hasWorkout ? 0.10 : 0.12),
                borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              ),
              child: Center(
                child: PhosphorIcon(
                  hasWorkout
                      ? PhosphorIcons.lightning(PhosphorIconsStyle.fill)
                      : PhosphorIcons.calendarDots(),
                  color: color,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTypography.bodySemiBold.copyWith(
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.bodySmall.copyWith(height: 1.35),
                  ),
                ],
              ),
            ),
            if (onTap != null) ...[
              const SizedBox(width: AppSpacing.sm),
              PhosphorIcon(
                isSelected
                    ? PhosphorIcons.checkCircle(PhosphorIconsStyle.fill)
                    : PhosphorIcons.caretRight(),
                color: isSelected ? color : AppColors.textDisabled,
                size: 20,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
