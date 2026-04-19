import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class DashboardShellScreen extends StatelessWidget {
  const DashboardShellScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.cardWhite,
          border: Border(
            top: BorderSide(
              color: AppColors.textDisabled.withValues(alpha: 0.2),
              width: 1,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.textDark.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: NavigationBarTheme(
          data: NavigationBarThemeData(
            elevation: 0,
            indicatorColor: AppColors.transparent,
            backgroundColor: AppColors.cardWhite,
            labelTextStyle: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return AppTypography.labelUppercase.copyWith(
                  color: AppColors.sportOrange,
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                );
              }
              return AppTypography.labelUppercase.copyWith(
                color: AppColors.textDisabled,
                fontSize: 10,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              );
            }),
            iconTheme: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return const IconThemeData(
                  color: AppColors.sportOrange,
                  size: 24,
                );
              }
              return const IconThemeData(
                color: AppColors.textDisabled,
                size: 24,
              );
            }),
          ),
          child: NavigationBar(
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: _goBranch,
            destinations: [
              NavigationDestination(
                icon: Icon(PhosphorIcons.house(PhosphorIconsStyle.fill)),
                label: 'HOME',
              ),
              NavigationDestination(
                icon: Icon(PhosphorIcons.barbell(PhosphorIconsStyle.fill)),
                label: 'TRAINING',
              ),
              NavigationDestination(
                icon: Icon(PhosphorIcons.chartLineUp(PhosphorIconsStyle.fill)),
                label: 'INSIGHTS',
              ),
              NavigationDestination(
                icon: Icon(PhosphorIcons.user(PhosphorIconsStyle.fill)),
                label: 'PROFILE',
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
