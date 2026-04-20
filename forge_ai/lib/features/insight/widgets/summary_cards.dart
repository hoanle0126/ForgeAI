import 'package:flutter/material.dart';
import '../models/insight_summary.dart';

class SummaryCards extends StatelessWidget {
  final InsightSummary summary;

  const SummaryCards({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildCard('Total Volume', '${summary.totalVolume}', Icons.fitness_center),
        const SizedBox(width: 16),
        _buildCard('Workouts', '${summary.workoutsThisWeek}', Icons.calendar_today),
      ],
    );
  }

  Widget _buildCard(String title, String value, IconData icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 24, color: Colors.blue),
            const SizedBox(height: 8),
            Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(title, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
