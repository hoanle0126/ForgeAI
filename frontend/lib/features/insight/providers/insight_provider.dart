// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:forge_ai/features/auth/providers/auth_provider.dart';
import 'package:forge_ai/features/insight/models/insight_models.dart';
import 'package:forge_ai/features/insight/repositories/insight_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'insight_provider.freezed.dart';
part 'insight_provider.g.dart';

final insightRepositoryProvider = Provider<InsightRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return ApiInsightRepository(apiClient);
});

@freezed
class InsightState with _$InsightState {
  const factory InsightState({
    required List<MuscleData> muscleData,
    required List<MuscleAnalysis> muscleAnalyses,
    required List<InsightMessage> messages,
    required String selectedMuscleId,
    @Default(AtlasSide.front) AtlasSide activeAtlasSide,
    @Default(false) bool isChatPanelOpen,
  }) = _InsightState;
}

@riverpod
class InsightNotifier extends _$InsightNotifier {
  @override
  FutureOr<InsightState> build() async {
    final repository = ref.watch(insightRepositoryProvider);
    final overview = await repository.fetchOverview();

    return InsightState(
      muscleData: overview.muscleData,
      muscleAnalyses: overview.muscleAnalyses,
      selectedMuscleId: overview.selectedMuscleId,
      messages: overview.messages,
    );
  }

  void selectMuscle(String id) {
    final currentState = state.valueOrNull;
    if (currentState == null) return;

    state = AsyncData(currentState.copyWith(selectedMuscleId: id));
  }

  void setAtlasSide(AtlasSide side) {
    final currentState = state.valueOrNull;
    if (currentState == null) return;

    state = AsyncData(currentState.copyWith(activeAtlasSide: side));
  }

  void setChatPanelOpen(bool isOpen) {
    final currentState = state.valueOrNull;
    if (currentState == null) return;

    state = AsyncData(currentState.copyWith(isChatPanelOpen: isOpen));
  }

  MuscleAnalysis analysisForMuscle(String id) {
    final currentState = state.valueOrNull;
    final analyses = currentState?.muscleAnalyses ?? const <MuscleAnalysis>[];

    for (final analysis in analyses) {
      if (analysis.muscleId == id) return analysis;
    }

    return _fallbackAnalysis(id);
  }

  Future<void> sendMessage(String text) async {
    final currentState = state.valueOrNull;
    if (currentState == null) return;

    final prompt = text.trim();
    if (prompt.isEmpty) return;

    final userMessage = InsightMessage(
      id: DateTime.now().toIso8601String(),
      content: prompt,
      isUser: true,
    );
    state = AsyncData(
      currentState.copyWith(messages: [...currentState.messages, userMessage]),
    );

    final latest = state.valueOrNull ?? currentState;
    try {
      final repository = ref.read(insightRepositoryProvider);
      final reply = await repository.sendChatMessage(
        prompt: prompt,
        selectedMuscleId: latest.selectedMuscleId,
      );
      final stateAfterReply = state.valueOrNull ?? latest;
      state = AsyncData(
        stateAfterReply.copyWith(
          messages: [...stateAfterReply.messages, reply],
        ),
      );
    } catch (_) {
      final stateAfterFailure = state.valueOrNull ?? latest;
      final fallback = InsightMessage(
        id: DateTime.now()
            .add(const Duration(milliseconds: 1))
            .toIso8601String(),
        content:
            'Unable to reach AI insight service right now. Please try again.',
        isUser: false,
      );
      state = AsyncData(
        stateAfterFailure.copyWith(
          messages: [...stateAfterFailure.messages, fallback],
        ),
      );
    }
  }

  MuscleAnalysis _fallbackAnalysis(String muscleId) {
    return MuscleAnalysis(
      muscleId: muscleId,
      displayName: 'Unknown muscle',
      status: MuscleTrainingStatus.neutral,
      volume: 0,
      rpe: 0,
      trendPercent: 0,
      fatigueScore: 0,
      recommendation: 'No analysis is available for this muscle yet.',
    );
  }
}
