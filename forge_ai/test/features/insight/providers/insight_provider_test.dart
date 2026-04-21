import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forge_ai/features/insight/models/insight_models.dart';
import 'package:forge_ai/features/insight/providers/insight_provider.dart';

void main() {
  ProviderContainer createContainer() {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    container.listen(insightNotifierProvider, (previous, next) {});
    return container;
  }

  test('initial state includes anatomy, analysis, and chat data', () async {
    final container = createContainer();

    final state = await container.read(insightNotifierProvider.future);

    expect(state.muscleData.length, greaterThanOrEqualTo(6));
    expect(state.muscleAnalyses.length, greaterThanOrEqualTo(3));
    expect(state.messages, isNotEmpty);
    expect(state.activeAtlasSide, AtlasSide.front);
    expect(state.selectedMuscleId, isNotEmpty);
  });

  test('selectMuscle updates selected muscle id', () async {
    final container = createContainer();
    await container.read(insightNotifierProvider.future);

    container
        .read(insightNotifierProvider.notifier)
        .selectMuscle('latissimus_dorsi_r');

    final state = container.read(insightNotifierProvider).valueOrNull;
    expect(state?.selectedMuscleId, 'latissimus_dorsi_r');
  });

  test('setAtlasSide updates active atlas side', () async {
    final container = createContainer();
    await container.read(insightNotifierProvider.future);

    container
        .read(insightNotifierProvider.notifier)
        .setAtlasSide(AtlasSide.back);

    final state = container.read(insightNotifierProvider).valueOrNull;
    expect(state?.activeAtlasSide, AtlasSide.back);
  });

  test('analysisForMuscle returns known analysis and safe fallback', () async {
    final container = createContainer();
    await container.read(insightNotifierProvider.future);
    final notifier = container.read(insightNotifierProvider.notifier);

    final known = notifier.analysisForMuscle('pectoralis_major_r');
    final fallback = notifier.analysisForMuscle('unknown_muscle');

    expect(known.muscleId, 'pectoralis_major_r');
    expect(known.status, MuscleTrainingStatus.overloaded);
    expect(fallback.muscleId, 'unknown_muscle');
    expect(fallback.status, MuscleTrainingStatus.neutral);
    expect(fallback.exerciseContributions, isEmpty);
  });

  test('sendMessage appends user and AI messages', () async {
    final container = createContainer();
    final initial = await container.read(insightNotifierProvider.future);

    await container.read(insightNotifierProvider.notifier).sendMessage('Hello');

    final updated = await container.read(insightNotifierProvider.future);
    expect(updated.messages.length, initial.messages.length + 2);
    expect(updated.messages[updated.messages.length - 2].isUser, true);
    expect(updated.messages.last.isUser, false);
  });
}
