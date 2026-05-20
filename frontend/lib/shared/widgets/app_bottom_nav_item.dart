part of 'app_bottom_nav.dart';

class _NavDestination {
  const _NavDestination({
    required this.label,
    required this.icon,
    required this.activeIcon,
  });

  final String label;
  final IconData icon;
  final IconData activeIcon;
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.destination,
    required this.isSelected,
    required this.onTap,
  });

  final _NavDestination destination;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final foregroundColor = isSelected
        ? AppColors.sportOrange
        : AppColors.cardWhite.withValues(alpha: 0.58);

    return Material(
      color: AppColors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOutCubic,
          height: AppSpacing.xxxl + AppSpacing.sm,
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.cardWhite : AppColors.transparent,
            borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
            border: Border.all(
              color: isSelected
                  ? AppColors.sportOrange.withValues(alpha: 0.28)
                  : AppColors.transparent,
            ),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: AppColors.sportOrange.withValues(alpha: 0.18),
                      blurRadius: AppSpacing.base,
                      offset: const Offset(0, AppSpacing.xs),
                    ),
                  ]
                : null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _NavIconWell(
                destination: destination,
                foregroundColor: foregroundColor,
                isSelected: isSelected,
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                destination.label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTypography.labelUppercase.copyWith(
                  color: foregroundColor,
                  fontSize: 10,
                  fontWeight: isSelected ? FontWeight.w800 : FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavIconWell extends StatelessWidget {
  const _NavIconWell({
    required this.destination,
    required this.foregroundColor,
    required this.isSelected,
  });

  final _NavDestination destination;
  final Color foregroundColor;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOutCubic,
      width: AppSpacing.xl,
      height: AppSpacing.xl,
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.sportOrange
            : AppColors.cardWhite.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
      ),
      child: Icon(
        isSelected ? destination.activeIcon : destination.icon,
        color: isSelected ? AppColors.cardWhite : foregroundColor,
        size: AppSpacing.lg,
      ),
    );
  }
}
