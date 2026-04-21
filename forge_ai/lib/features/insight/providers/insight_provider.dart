import 'package:forge_ai/features/insight/models/insight_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'insight_provider.freezed.dart';
part 'insight_provider.g.dart';

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
    final analyses = _mockMuscleAnalyses();

    return InsightState(
      muscleData: _mockMuscleData(),
      muscleAnalyses: analyses,
      selectedMuscleId: analyses.first.muscleId,
      messages: const [
        InsightMessage(
          id: '0',
          content:
              'Chest load is high this week. A pull or lower-body session is the best next move.',
          isUser: false,
        ),
      ],
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
    final analyses = currentState?.muscleAnalyses ?? _mockMuscleAnalyses();

    for (final analysis in analyses) {
      if (analysis.muscleId == id) return analysis;
    }

    return MuscleAnalysis(
      muscleId: id,
      displayName: 'Unknown muscle',
      status: MuscleTrainingStatus.neutral,
      volume: 0,
      rpe: 0,
      trendPercent: 0,
      fatigueScore: 0,
      recommendation: 'No analysis is available for this muscle yet.',
    );
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
    final latestState = state.valueOrNull ?? currentState;
    final aiMsg = InsightMessage(
      id: DateTime.now().toIso8601String(),
      content:
          'I analyzed "$text" against your muscle balance. Chest remains high fatigue, while back volume can be increased safely.',
      isUser: false,
      hasChart: true,
    );
    state = AsyncData(
      latestState.copyWith(messages: [...latestState.messages, aiMsg]),
    );
  }

  List<MuscleData> _mockMuscleData() {
    return const [
      MuscleData(
        id: 'pectoralis_major_r',
        volume: 15000,
        rpe: 8.5,
        status: MuscleTrainingStatus.overloaded,
      ),
      MuscleData(
        id: 'pectoralis_major_l',
        volume: 15000,
        rpe: 8.5,
        status: MuscleTrainingStatus.overloaded,
      ),
      MuscleData(
        id: 'latissimus_dorsi_r',
        volume: 9600,
        rpe: 6.3,
        status: MuscleTrainingStatus.moderate,
      ),
      MuscleData(
        id: 'latissimus_dorsi_l',
        volume: 9400,
        rpe: 6.1,
        status: MuscleTrainingStatus.moderate,
      ),
      MuscleData(
        id: 'rectus_abdominis_1',
        volume: 5200,
        rpe: 4.0,
        status: MuscleTrainingStatus.recovered,
      ),
      MuscleData(
        id: 'rectus_femoris_r',
        volume: 12600,
        rpe: 7.1,
        status: MuscleTrainingStatus.moderate,
      ),
      MuscleData(
        id: 'rectus_femoris_l',
        volume: 12400,
        rpe: 7.0,
        status: MuscleTrainingStatus.moderate,
      ),
      MuscleData(
        id: 'gluteus_maximus_r',
        volume: 7800,
        rpe: 5.2,
        status: MuscleTrainingStatus.recovered,
      ),
      MuscleData(
        id: 'gluteus_maximus_l',
        volume: 7600,
        rpe: 5.1,
        status: MuscleTrainingStatus.recovered,
      ),
    ];
  }

  List<MuscleAnalysis> _mockMuscleAnalyses() {
    return const [
      MuscleAnalysis(
        muscleId: 'pectoralis_major_r',
        displayName: 'Chest',
        status: MuscleTrainingStatus.overloaded,
        volume: 15000,
        rpe: 8.5,
        trendPercent: 18,
        fatigueScore: 76,
        recommendation:
            'Reduce pressing volume today and rotate to pull or lower-body work.',
        loadTrend: [
          ChartPoint(label: 'W1', value: 9200),
          ChartPoint(label: 'W2', value: 10400),
          ChartPoint(label: 'W3', value: 12600),
          ChartPoint(label: 'W4', value: 15000),
        ],
        exerciseContributions: [
          ExerciseContribution(exerciseName: 'Bench press', volume: 6400),
          ExerciseContribution(exerciseName: 'Incline press', volume: 4200),
          ExerciseContribution(exerciseName: 'Cable fly', volume: 2600),
          ExerciseContribution(exerciseName: 'Push-up', volume: 1800),
        ],
        recoveryBalance: [
          ChartPoint(label: 'Load', value: 76),
          ChartPoint(label: 'Recovery', value: 42),
        ],
      ),
      MuscleAnalysis(
        muscleId: 'latissimus_dorsi_r',
        displayName: 'Back',
        status: MuscleTrainingStatus.moderate,
        volume: 9600,
        rpe: 6.3,
        trendPercent: 7,
        fatigueScore: 48,
        recommendation:
            'Back is ready for more volume. Add rows or pull-downs next.',
        loadTrend: [
          ChartPoint(label: 'W1', value: 7600),
          ChartPoint(label: 'W2', value: 8200),
          ChartPoint(label: 'W3', value: 8900),
          ChartPoint(label: 'W4', value: 9600),
        ],
        exerciseContributions: [
          ExerciseContribution(exerciseName: 'Lat pull-down', volume: 3900),
          ExerciseContribution(exerciseName: 'Seated row', volume: 3200),
          ExerciseContribution(exerciseName: 'Pull-up', volume: 2500),
        ],
        recoveryBalance: [
          ChartPoint(label: 'Load', value: 48),
          ChartPoint(label: 'Recovery', value: 68),
        ],
      ),
      MuscleAnalysis(
        muscleId: 'rectus_femoris_r',
        displayName: 'Quads',
        status: MuscleTrainingStatus.moderate,
        volume: 12600,
        rpe: 7.1,
        trendPercent: 11,
        fatigueScore: 58,
        recommendation:
            'Quad load is productive. Keep intensity stable before adding sets.',
        loadTrend: [
          ChartPoint(label: 'W1', value: 9800),
          ChartPoint(label: 'W2', value: 11100),
          ChartPoint(label: 'W3', value: 11800),
          ChartPoint(label: 'W4', value: 12600),
        ],
        exerciseContributions: [
          ExerciseContribution(exerciseName: 'Back squat', volume: 5200),
          ExerciseContribution(exerciseName: 'Leg press', volume: 4400),
          ExerciseContribution(exerciseName: 'Lunge', volume: 3000),
        ],
        recoveryBalance: [
          ChartPoint(label: 'Load', value: 58),
          ChartPoint(label: 'Recovery', value: 54),
        ],
      ),
    ];
  }
}
