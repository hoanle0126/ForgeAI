import 'package:forge_ai/features/insight/models/insight_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'insight_provider.freezed.dart';
part 'insight_provider.g.dart';

@freezed
class InsightState with _$InsightState {
  const factory InsightState({
    required List<MuscleData> muscleData,
    required List<InsightMessage> messages,
  }) = _InsightState;
}

@riverpod
class InsightNotifier extends _$InsightNotifier {
  @override
  FutureOr<InsightState> build() async {
    final mockMuscleData = [
      const MuscleData(id: 'pectoralis_major_r', volume: 15000, rpe: 8.5),
      const MuscleData(id: 'pectoralis_major_l', volume: 15000, rpe: 8.5),
      const MuscleData(id: 'rectus_abdominis', volume: 5000, rpe: 4.0),
    ];
    const initialMessage = InsightMessage(
      id: '0',
      content:
          '**Phân tích tuần qua:**\nCơ ngực của bạn đang có dấu hiệu quá tải (RPE 8.5). Bạn nên tập chân hoặc nghỉ ngơi.',
      isUser: false,
    );
    return InsightState(muscleData: mockMuscleData, messages: [initialMessage]);
  }

  Future<void> sendMessage(String text) async {
    final currentState = state.valueOrNull;
    if (currentState == null) return;

    final userMsg = InsightMessage(
      id: DateTime.now().toString(),
      content: text,
      isUser: true,
    );
    state = AsyncData(
      currentState.copyWith(messages: [...currentState.messages, userMsg]),
    );

    await Future<void>.delayed(const Duration(milliseconds: 300));
    final aiMsg = InsightMessage(
      id: DateTime.now().toString(),
      content: 'Tôi đã phân tích yêu cầu: "$text". Dưới đây là biểu đồ:',
      isUser: false,
      hasChart: true,
    );
    state = AsyncData(
      currentState.copyWith(
        messages: [...currentState.messages, userMsg, aiMsg],
      ),
    );
  }
}
