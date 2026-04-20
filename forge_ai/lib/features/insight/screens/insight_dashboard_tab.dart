import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/insight_provider.dart';
import '../widgets/anatomy_view.dart';
import '../widgets/trend_chart.dart';

class InsightDashboardTab extends ConsumerWidget {
  const InsightDashboardTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateAsync = ref.watch(insightNotifierProvider);

    return stateAsync.when(
      data: (state) => SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AnatomyView(data: state.muscleData),
            const SizedBox(height: 24),
            const TrendChart(),
          ],
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
    );
  }
}
