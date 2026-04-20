import 'package:flutter/material.dart';
import 'insight_dashboard_tab.dart';
import 'insight_chat_tab.dart';

class InsightScreen extends StatelessWidget {
  const InsightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('AI Insight'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Dashboard', icon: Icon(Icons.dashboard)),
              Tab(text: 'Ask AI', icon: Icon(Icons.smart_toy)),
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
