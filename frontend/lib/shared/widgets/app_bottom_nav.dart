import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

part 'app_bottom_nav_item.dart';

class AppBottomNav extends StatelessWidget {
  const AppBottomNav({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  static final _destinations = [
    _NavDestination(
      label: 'HOME',
      icon: PhosphorIcons.house(PhosphorIconsStyle.regular),
      activeIcon: PhosphorIcons.house(PhosphorIconsStyle.fill),
    ),
    _NavDestination(
      label: 'TRAINING',
      icon: PhosphorIcons.barbell(PhosphorIconsStyle.regular),
      activeIcon: PhosphorIcons.barbell(PhosphorIconsStyle.fill),
    ),
    _NavDestination(
      label: 'INSIGHTS',
      icon: PhosphorIcons.chartLineUp(PhosphorIconsStyle.regular),
      activeIcon: PhosphorIcons.chartLineUp(PhosphorIconsStyle.fill),
    ),
    _NavDestination(
      label: 'PROFILE',
      icon: PhosphorIcons.user(PhosphorIconsStyle.regular),
      activeIcon: PhosphorIcons.user(PhosphorIconsStyle.fill),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.base,
          AppSpacing.sm,
          AppSpacing.base,
          AppSpacing.sm,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.textDark,
            borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
            border: Border.all(
              color: AppColors.cardWhite.withValues(alpha: 0.08),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.textDark.withValues(alpha: 0.18),
                blurRadius: AppSpacing.lg,
                offset: const Offset(0, -AppSpacing.sm),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.sm),
            child: Row(
              children: [
                for (var index = 0; index < _destinations.length; index++)
                  Expanded(
                    child: _NavItem(
                      destination: _destinations[index],
                      isSelected: selectedIndex == index,
                      onTap: () => onDestinationSelected(index),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
