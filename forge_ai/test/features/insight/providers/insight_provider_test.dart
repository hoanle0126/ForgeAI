import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/features/insight/providers/insight_provider.dart';
import 'package:forge_ai/features/insight/models/chat_message.dart';

void main() {
  test('InsightProvider initializes with mock data and can add messages', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    
    final subscription = container.listen(insightNotifierProvider, (_, __) {});

    // Initial state should have summary and initial AI message
    final state = await container.read(insightNotifierProvider.future);
    expect(state.summary.workoutsThisWeek, 4);
    expect(state.messages.length, 1);
    expect(state.messages.first.isUser, false);

    // Add user message
    await container.read(insightNotifierProvider.notifier).sendMessage('Hello AI');
    
    final updatedState = await container.read(insightNotifierProvider.future);
    print('Messages count: ${updatedState.messages.length}');
    expect(updatedState.messages.length, 3); // Initial + User + AI Reply
    expect(updatedState.messages[1].text, 'Hello AI');
    expect(updatedState.messages[1].isUser, true);
    expect(updatedState.messages[2].isUser, false);
  });
}
