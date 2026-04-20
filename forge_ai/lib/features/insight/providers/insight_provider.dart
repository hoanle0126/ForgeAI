import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/chat_message.dart';
import '../models/insight_summary.dart';
import '../models/muscle_status.dart';

part 'insight_provider.freezed.dart';
part 'insight_provider.g.dart';

@freezed
class InsightState with _$InsightState {
  const factory InsightState({
    required InsightSummary summary,
    required List<ChatMessage> messages,
  }) = _InsightState;
}

@riverpod
class InsightNotifier extends _$InsightNotifier {
  @override
  FutureOr<InsightState> build() async {
    // Mock initial data
    const summary = InsightSummary(
      totalVolume: 15000,
      workoutsThisWeek: 4,
      caloriesBurned: 2100,
      muscleStatuses: [
        MuscleStatus(name: 'Chest', fatigueLevel: 8.5),
        MuscleStatus(name: 'Legs', fatigueLevel: 3.0),
      ],
    );

    final initialMessage = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: 'Dựa trên RPE tuần qua, cơ ngực của bạn đang có dấu hiệu quá tải (Đỏ). Bạn nên dành hôm nay để tập chân hoặc Cardio nhẹ nhàng.',
      isUser: false,
      timestamp: DateTime.now(),
    );

    return InsightState(summary: summary, messages: [initialMessage]);
  }

  Future<void> sendMessage(String text) async {
    final currentState = state.valueOrNull;
    if (currentState == null) return;

    final userMessage = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: text,
      isUser: true,
      timestamp: DateTime.now(),
    );

    state = AsyncData(currentState.copyWith(
      messages: [...currentState.messages, userMessage],
    ));

    // Simulate AI delay and response
    await Future.delayed(const Duration(milliseconds: 500));

    final updatedState = state.valueOrNull;
    if (updatedState == null) return;

    final aiMessage = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: 'Đây là câu trả lời mô phỏng từ AI cho: "$text"',
      isUser: false,
      timestamp: DateTime.now(),
    );

    state = AsyncData(updatedState.copyWith(
      messages: [...updatedState.messages, aiMessage],
    ));
  }
}
