import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'insight_dashboard_tab.dart';
import 'insight_chat_tab.dart';

class InsightScreen extends StatelessWidget {
  const InsightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.warmIvory,
        appBar: AppBar(
          backgroundColor: AppColors.warmIvory,
          elevation: 0,
          title: Text('Insights', style: AppTypography.h2),
          bottom: TabBar(
            labelColor: AppColors.sportOrange,
            unselectedLabelColor: AppColors.textDisabled,
            indicatorColor: AppColors.sportOrange,
            labelStyle: AppTypography.bodySemiBold,
            tabs: const [
              Tab(text: 'Anatomy'),
              Tab(text: 'Ask AI'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            InsightDashboardTab(),
            InsightChatTab(),
          ],
        ),
      ),
    );
  }
}
