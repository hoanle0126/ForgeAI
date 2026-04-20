import 'package:flutter/material.dart';
import '../models/muscle_status.dart';

class MuscleHeatMap extends StatelessWidget {
  final List<MuscleStatus> statuses;

  const MuscleHeatMap({super.key, required this.statuses});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const Text('Muscle Heat Map', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          // Simple placeholder for the visual heat map
          Wrap(
            spacing: 8,
            children: statuses.map((s) => Chip(
              label: Text(s.name),
              backgroundColor: s.isOverloaded ? Colors.red[300] : Colors.green[300],
            )).toList(),
          ),
        ],
      ),
    );
  }
}
