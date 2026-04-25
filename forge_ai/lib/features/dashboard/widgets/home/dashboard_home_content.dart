import 'package:flutter/material.dart';
import 'package:forge_ai/features/dashboard/widgets/home/comfort_dashboard_home_layout.dart';
import 'package:forge_ai/features/dashboard/widgets/home/compact_dashboard_home_layout.dart';
import 'package:forge_ai/features/dashboard/widgets/home/wide_dashboard_home_layout.dart';

class DashboardHomeContent extends StatelessWidget {
  const DashboardHomeContent({
    super.key,
    required this.isCompact,
    required this.isWide,
  });

  final bool isCompact;
  final bool isWide;

  @override
  Widget build(BuildContext context) {
    if (isWide) {
      return const WideDashboardHomeLayout(
        key: ValueKey('dashboard-home-wide-layout'),
      );
    }

    if (isCompact) {
      return const CompactDashboardHomeLayout(
        key: ValueKey('dashboard-home-compact-layout'),
      );
    }

    return const ComfortDashboardHomeLayout(
      key: ValueKey('dashboard-home-comfort-layout'),
    );
  }
}
