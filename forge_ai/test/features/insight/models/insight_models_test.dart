import 'package:flutter_test/flutter_test.dart';
import 'package:forge_ai/features/insight/models/muscle_status.dart';
import 'package:forge_ai/features/insight/models/insight_summary.dart';
import 'package:forge_ai/features/insight/models/chat_message.dart';

void main() {
  group('Insight Models', () {
    test('MuscleStatus instantiation', () {
      const status = MuscleStatus(name: 'Chest', fatigueLevel: 8.5);
      expect(status.name, 'Chest');
      expect(status.fatigueLevel, 8.5);
      expect(status.isOverloaded, true);
    });

    test('InsightSummary instantiation', () {
      const summary = InsightSummary(
        totalVolume: 15000,
        workoutsThisWeek: 4,
        caloriesBurned: 2100,
        muscleStatuses: [MuscleStatus(name: 'Chest', fatigueLevel: 8.5)],
      );
      expect(summary.totalVolume, 15000);
      expect(summary.workoutsThisWeek, 4);
    });

    test('ChatMessage instantiation', () {
      final message = ChatMessage(id: '1', text: 'Hello', isUser: true, timestamp: DateTime(2026));
      expect(message.text, 'Hello');
      expect(message.isUser, true);
    });
  });
}
