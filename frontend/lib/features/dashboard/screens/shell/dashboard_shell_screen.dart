import 'package:flutter/material.dart';
import 'package:forge_ai/shared/widgets/app_bottom_nav.dart';
import 'package:go_router/go_router.dart';

class DashboardShellScreen extends StatelessWidget {
  const DashboardShellScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: AppBottomNav(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: _goBranch,
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
