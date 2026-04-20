import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/features/insight/providers/insight_provider.dart';

void main() {
  test('InsightNotifier initial state and add message', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final subscription = container.listen(insightNotifierProvider, (_, __) {});

    final state = await container.read(insightNotifierProvider.future);
    expect(state.muscleData.isNotEmpty, true);
    expect(state.messages.length, 1);

    await container.read(insightNotifierProvider.notifier).sendMessage('Hello');
    
    final updatedState = await container.read(insightNotifierProvider.future);
    expect(updatedState.messages.length, 3); // Initial + User + AI
  });
}
