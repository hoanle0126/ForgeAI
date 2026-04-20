import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/insight_provider.dart';
import '../widgets/muscle_heat_map.dart';
import '../widgets/summary_cards.dart';

class InsightDashboardTab extends ConsumerWidget {
  const InsightDashboardTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateAsync = ref.watch(insightNotifierProvider);

    return stateAsync.when(
      data: (state) => ListView(
        padding: const EdgeInsets.all(16),
        children: [
          MuscleHeatMap(statuses: state.summary.muscleStatuses),
          const SizedBox(height: 24),
          SummaryCards(summary: state.summary),
        ],
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err')),
    );
  }
}
