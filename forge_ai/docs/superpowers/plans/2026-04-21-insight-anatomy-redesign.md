# Insight Anatomy Redesign Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Replace the current two-tab Insight experience with a responsive premium 2D anatomy analytics screen, muscle detail analysis, and secondary AI chat entry.

**Architecture:** Reuse the existing `insight` feature, `flutter_body_atlas`, `fl_chart`, Riverpod, Freezed, and ForgeAI design system. Extend the current provider/model instead of creating disconnected state, then build focused feature widgets for anatomy, metrics, preview sheet, analysis panel, charts, and chat entry. Mobile uses atlas-first layout; tablet/desktop uses a two-column workbench.

**Tech Stack:** Flutter, flutter_riverpod, riverpod_annotation, freezed, json_serializable, go_router, flutter_body_atlas, fl_chart, phosphor_flutter, ForgeAI custom lints.

---

## Pre-Flight Notes

The worktree already has modified Insight/router/test files. Before implementing any task, inspect the existing diff and preserve unrelated user changes. Do not use destructive git commands.

Run:

```bash
git status --short
git diff -- lib/features/insight lib/core/router/app_router.dart test/features/insight/providers/insight_provider_test.dart
```

Expected: existing local modifications are visible. Treat them as user changes unless the current task explicitly edits the same code.

Final verification must run from the project root:

```bash
./tool/check.sh
```

## File Structure

Modify:

- `lib/features/insight/models/insight_models.dart`: add Freezed models for atlas side, muscle status, chart points, exercise contribution, and detailed muscle analysis.
- `lib/features/insight/providers/insight_provider.dart`: extend `InsightState` and `InsightNotifier` with selected muscle, active side, analysis lookup, and current mock data.
- `test/features/insight/providers/insight_provider_test.dart`: replace the basic provider test with behavior tests for selection, atlas side, analysis lookup, unknown fallback, and chat.
- `lib/features/insight/screens/insight_screen.dart`: replace tabs with responsive anatomy dashboard.
- `lib/core/router/app_router.dart`: add centralized route constants and GoRouter entries for muscle detail and mobile chat.
- `lib/features/insight/screens/insight_chat_tab.dart`: refactor into reusable chat content or keep as implementation detail for the new chat screen/panel.
- `lib/features/insight/widgets/anatomy_view.dart`: replace the current two-view row with a reusable anatomy panel or retire it after creating `InsightAnatomyPanel`.
- `lib/features/insight/widgets/trend_chart.dart`: retire or refactor into focused chart widgets.
- `lib/features/insight/widgets/insight_card.dart`: reuse for chat cards where practical.

Create:

- `lib/features/insight/screens/muscle_detail_screen.dart`: full detail route for one muscle id.
- `lib/features/insight/screens/insight_chat_screen.dart`: mobile full-screen chat route.
- `lib/features/insight/widgets/insight_anatomy_panel.dart`: atlas renderer with side control, heatmap, and tap callback.
- `lib/features/insight/widgets/insight_metric_strip.dart`: quick metric row reused by dashboard and detail.
- `lib/features/insight/widgets/muscle_preview_sheet.dart`: mobile tap preview.
- `lib/features/insight/widgets/muscle_analysis_panel.dart`: balanced dashboard panel reused by wide workbench and detail screen.
- `lib/features/insight/widgets/muscle_load_trend_chart.dart`: line chart for load trend.
- `lib/features/insight/widgets/muscle_exercise_contribution_chart.dart`: bar chart for exercise contribution.
- `lib/features/insight/widgets/muscle_recovery_balance_chart.dart`: compact recovery/fatigue visualization.
- `lib/features/insight/widgets/insight_ai_entry_button.dart`: secondary AI chat action if existing `AppButton` is not ergonomic for icon-only entry.
- `lib/features/insight/widgets/insight_chat_content.dart`: reusable chat message list and input composer used by the route and wide panel.
- `test/features/insight/screens/insight_screen_test.dart`: widget tests for no tabs, mobile layout, and wide workbench.
- `test/features/insight/screens/muscle_detail_screen_test.dart`: widget tests for known and unknown muscle detail rendering.

Generated:

- `lib/features/insight/models/insight_models.freezed.dart`
- `lib/features/insight/models/insight_models.g.dart`
- `lib/features/insight/providers/insight_provider.freezed.dart`
- `lib/features/insight/providers/insight_provider.g.dart`

## Task 1: Extend Insight Models And Provider State

**Files:**
- Modify: `lib/features/insight/models/insight_models.dart`
- Modify: `lib/features/insight/providers/insight_provider.dart`
- Modify: `test/features/insight/providers/insight_provider_test.dart`
- Generated: `lib/features/insight/models/insight_models.freezed.dart`
- Generated: `lib/features/insight/models/insight_models.g.dart`
- Generated: `lib/features/insight/providers/insight_provider.freezed.dart`
- Generated: `lib/features/insight/providers/insight_provider.g.dart`

- [ ] **Step 1: Write failing provider tests**

Replace `test/features/insight/providers/insight_provider_test.dart` with:

```dart
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

    container.read(insightNotifierProvider.notifier).setAtlasSide(AtlasSide.back);

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
```

- [ ] **Step 2: Run provider tests and verify RED**

Run:

```bash
flutter test test/features/insight/providers/insight_provider_test.dart
```

Expected: FAIL because `AtlasSide`, `MuscleTrainingStatus`, `muscleAnalyses`, `activeAtlasSide`, `selectedMuscleId`, `selectMuscle`, `setAtlasSide`, and `analysisForMuscle` are not implemented yet.

- [ ] **Step 3: Replace model definitions**

Replace `lib/features/insight/models/insight_models.dart` with:

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'insight_models.freezed.dart';
part 'insight_models.g.dart';

enum AtlasSide { front, back }

enum MuscleTrainingStatus { recovered, moderate, overloaded, neutral }

@freezed
class ChartPoint with _$ChartPoint {
  const factory ChartPoint({
    required String label,
    required double value,
  }) = _ChartPoint;

  factory ChartPoint.fromJson(Map<String, dynamic> json) =>
      _$ChartPointFromJson(json);
}

@freezed
class ExerciseContribution with _$ExerciseContribution {
  const factory ExerciseContribution({
    required String exerciseName,
    required double volume,
  }) = _ExerciseContribution;

  factory ExerciseContribution.fromJson(Map<String, dynamic> json) =>
      _$ExerciseContributionFromJson(json);
}

@freezed
class MuscleData with _$MuscleData {
  const factory MuscleData({
    required String id,
    required double volume,
    required double rpe,
    @Default(MuscleTrainingStatus.neutral) MuscleTrainingStatus status,
  }) = _MuscleData;

  factory MuscleData.fromJson(Map<String, dynamic> json) =>
      _$MuscleDataFromJson(json);
}

@freezed
class MuscleAnalysis with _$MuscleAnalysis {
  const factory MuscleAnalysis({
    required String muscleId,
    required String displayName,
    required MuscleTrainingStatus status,
    required double volume,
    required double rpe,
    required double trendPercent,
    required int fatigueScore,
    required String recommendation,
    @Default(<ChartPoint>[]) List<ChartPoint> loadTrend,
    @Default(<ExerciseContribution>[])
    List<ExerciseContribution> exerciseContributions,
    @Default(<ChartPoint>[]) List<ChartPoint> recoveryBalance,
  }) = _MuscleAnalysis;

  factory MuscleAnalysis.fromJson(Map<String, dynamic> json) =>
      _$MuscleAnalysisFromJson(json);
}

@freezed
class InsightMessage with _$InsightMessage {
  const factory InsightMessage({
    required String id,
    required String content,
    required bool isUser,
    @Default(false) bool hasChart,
  }) = _InsightMessage;

  factory InsightMessage.fromJson(Map<String, dynamic> json) =>
      _$InsightMessageFromJson(json);
}
```

- [ ] **Step 4: Replace provider implementation**

Replace `lib/features/insight/providers/insight_provider.dart` with:

```dart
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
      id: DateTime.now().toIso8601String(),
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
```

- [ ] **Step 5: Generate Freezed and Riverpod code**

Run:

```bash
dart run build_runner build -d
```

Expected: exit 0 and generated files updated.

- [ ] **Step 6: Run provider tests and verify GREEN**

Run:

```bash
flutter test test/features/insight/providers/insight_provider_test.dart
```

Expected: PASS.

- [ ] **Step 7: Commit Task 1**

Run:

```bash
git add lib/features/insight/models/insight_models.dart lib/features/insight/models/insight_models.freezed.dart lib/features/insight/models/insight_models.g.dart lib/features/insight/providers/insight_provider.dart lib/features/insight/providers/insight_provider.freezed.dart lib/features/insight/providers/insight_provider.g.dart test/features/insight/providers/insight_provider_test.dart
git commit -m "feat(insight): extend anatomy analysis state"
```

Expected: commit includes only model/provider/generated/provider-test changes.

## Task 2: Build Responsive Insight Shell And Anatomy Panel

**Files:**
- Create: `test/features/insight/screens/insight_screen_test.dart`
- Modify: `lib/features/insight/screens/insight_screen.dart`
- Create: `lib/features/insight/widgets/insight_anatomy_panel.dart`
- Create: `lib/features/insight/widgets/insight_metric_strip.dart`
- Create: `lib/features/insight/widgets/insight_ai_entry_button.dart`

- [ ] **Step 1: Write failing widget tests for the new shell**

Create `test/features/insight/screens/insight_screen_test.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forge_ai/features/insight/screens/insight_screen.dart';

void main() {
  Widget buildSubject({required Size size}) {
    return ProviderScope(
      child: MaterialApp(
        home: MediaQuery(
          data: MediaQueryData(size: size),
          child: const InsightScreen(),
        ),
      ),
    );
  }

  testWidgets('InsightScreen does not render legacy tabs', (tester) async {
    await tester.pumpWidget(buildSubject(size: const Size(390, 844)));
    await tester.pumpAndSettle();

    expect(find.byType(TabBar), findsNothing);
    expect(find.text('Anatomy'), findsNothing);
    expect(find.text('Ask AI'), findsNothing);
    expect(find.text('Insights'), findsOneWidget);
  });

  testWidgets('mobile layout renders atlas-first structure', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(buildSubject(size: const Size(390, 844)));
    await tester.pumpAndSettle();

    expect(find.byKey(const ValueKey('insight-mobile-layout')), findsOneWidget);
    expect(find.byKey(const ValueKey('insight-wide-layout')), findsNothing);
    expect(find.byKey(const ValueKey('insight-anatomy-panel')), findsOneWidget);
    expect(find.byKey(const ValueKey('insight-metric-strip')), findsWidgets);
  });

  testWidgets('wide layout renders workbench structure', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1024, 768));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(buildSubject(size: const Size(1024, 768)));
    await tester.pumpAndSettle();

    expect(find.byKey(const ValueKey('insight-wide-layout')), findsOneWidget);
    expect(find.byKey(const ValueKey('insight-mobile-layout')), findsNothing);
    expect(find.byKey(const ValueKey('insight-anatomy-panel')), findsOneWidget);
    expect(find.byKey(const ValueKey('muscle-analysis-panel')), findsOneWidget);
  });
}
```

- [ ] **Step 2: Run shell widget tests and verify RED**

Run:

```bash
flutter test test/features/insight/screens/insight_screen_test.dart
```

Expected: FAIL because keys and the new responsive widgets do not exist yet.

- [ ] **Step 3: Create the metric strip widget**

Create `lib/features/insight/widgets/insight_metric_strip.dart`:

```dart
import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/insight/models/insight_models.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';

class InsightMetricStrip extends StatelessWidget {
  const InsightMetricStrip({
    super.key,
    required this.analysis,
  });

  final MuscleAnalysis analysis;

  @override
  Widget build(BuildContext context) {
    return Row(
      key: const ValueKey('insight-metric-strip'),
      children: [
        Expanded(
          child: _MetricTile(
            label: 'VOLUME',
            value: '${(analysis.volume / 1000).toStringAsFixed(1)}k',
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: _MetricTile(
            label: 'RPE',
            value: analysis.rpe.toStringAsFixed(1),
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: _MetricTile(
            label: 'TREND',
            value: '${analysis.trendPercent.toStringAsFixed(0)}%',
          ),
        ),
      ],
    );
  }
}

class _MetricTile extends StatelessWidget {
  const _MetricTile({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(AppSpacing.md),
      hasShadow: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppTypography.labelUppercase),
          const SizedBox(height: AppSpacing.xs),
          Text(
            value,
            style: AppTypography.statMedium.copyWith(
              color: AppColors.textDark,
            ),
          ),
        ],
      ),
    );
  }
}
```

- [ ] **Step 4: Create the AI entry button**

Create `lib/features/insight/widgets/insight_ai_entry_button.dart`:

```dart
import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class InsightAiEntryButton extends StatelessWidget {
  const InsightAiEntryButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      key: const ValueKey('insight-ai-entry'),
      tooltip: 'Ask AI',
      style: IconButton.styleFrom(
        backgroundColor: AppColors.aiBlue,
        foregroundColor: AppColors.cardWhite,
        minimumSize: const Size(AppSpacing.xxxl, AppSpacing.xxxl),
      ),
      onPressed: onPressed,
      icon: Icon(PhosphorIcons.sparkle(PhosphorIconsStyle.fill)),
    );
  }
}
```

- [ ] **Step 5: Create the anatomy panel**

Create `lib/features/insight/widgets/insight_anatomy_panel.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_body_atlas/flutter_body_atlas.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/insight/models/insight_models.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';

class InsightAnatomyPanel extends StatelessWidget {
  const InsightAnatomyPanel({
    super.key,
    required this.muscleData,
    required this.activeSide,
    required this.onSideChanged,
    required this.onMuscleTap,
  });

  final List<MuscleData> muscleData;
  final AtlasSide activeSide;
  final ValueChanged<AtlasSide> onSideChanged;
  final ValueChanged<String> onMuscleTap;

  @override
  Widget build(BuildContext context) {
    const resolver = MuscleResolver();
    final colorMapping = <MuscleInfo, Color?>{};

    for (final muscle in muscleData) {
      final muscleInfo = resolver.tryById(muscle.id);
      if (muscleInfo != null) {
        colorMapping[muscleInfo] = _colorForStatus(muscle.status);
      }
    }

    return AppCard(
      key: const ValueKey('insight-anatomy-panel'),
      padding: const EdgeInsets.all(AppSpacing.base),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Muscle map',
                  style: AppTypography.h3,
                ),
              ),
              _AtlasSideControl(
                activeSide: activeSide,
                onChanged: onSideChanged,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.base),
          SizedBox(
            height: 420,
            child: InteractiveViewer(
              minScale: 0.8,
              maxScale: 2.4,
              child: BodyAtlasView<MuscleInfo>(
                view: activeSide == AtlasSide.front
                    ? AtlasAsset.musclesFront
                    : AtlasAsset.musclesBack,
                resolver: resolver,
                colorMapping: colorMapping,
                hoverColor: (color) => color.withValues(alpha: 0.72),
                onTapElement: (muscle) => onMuscleTap(muscle.id),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Tap a muscle to inspect training load and recovery.',
            style: AppTypography.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Color _colorForStatus(MuscleTrainingStatus status) {
    return switch (status) {
      MuscleTrainingStatus.recovered => AppColors.success,
      MuscleTrainingStatus.moderate => AppColors.energy,
      MuscleTrainingStatus.overloaded => AppColors.sportOrange,
      MuscleTrainingStatus.neutral => AppColors.inputBg,
    };
  }
}

class _AtlasSideControl extends StatelessWidget {
  const _AtlasSideControl({
    required this.activeSide,
    required this.onChanged,
  });

  final AtlasSide activeSide;
  final ValueChanged<AtlasSide> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.inputBg,
        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
      ),
      padding: const EdgeInsets.all(AppSpacing.xs),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _SideButton(
            label: 'FRONT',
            isSelected: activeSide == AtlasSide.front,
            onTap: () => onChanged(AtlasSide.front),
          ),
          _SideButton(
            label: 'BACK',
            isSelected: activeSide == AtlasSide.back,
            onTap: () => onChanged(AtlasSide.back),
          ),
        ],
      ),
    );
  }
}

class _SideButton extends StatelessWidget {
  const _SideButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.sportOrange : AppColors.transparent,
          borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
        ),
        child: Text(
          label,
          style: AppTypography.labelUppercase.copyWith(
            color: isSelected ? AppColors.cardWhite : AppColors.textMuted,
          ),
        ),
      ),
    );
  }
}
```

- [ ] **Step 6: Replace `InsightScreen` with responsive shell**

Replace `lib/features/insight/screens/insight_screen.dart` with:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/core/router/app_router.dart';
import 'package:forge_ai/features/insight/models/insight_models.dart';
import 'package:forge_ai/features/insight/providers/insight_provider.dart';
import 'package:forge_ai/features/insight/widgets/insight_ai_entry_button.dart';
import 'package:forge_ai/features/insight/widgets/insight_anatomy_panel.dart';
import 'package:forge_ai/features/insight/widgets/insight_metric_strip.dart';
import 'package:forge_ai/features/insight/widgets/muscle_analysis_panel.dart';
import 'package:forge_ai/features/insight/widgets/muscle_preview_sheet.dart';
import 'package:go_router/go_router.dart';

class InsightScreen extends ConsumerWidget {
  const InsightScreen({super.key});

  static const double _wideBreakpoint = 720;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateAsync = ref.watch(insightNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.warmIvory,
      body: SafeArea(
        child: stateAsync.when(
          data: (state) => LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth >= _wideBreakpoint;
              final selectedAnalysis = ref
                  .read(insightNotifierProvider.notifier)
                  .analysisForMuscle(state.selectedMuscleId);

              if (isWide) {
                return _WideInsightLayout(
                  state: state,
                  selectedAnalysis: selectedAnalysis,
                );
              }

              return _MobileInsightLayout(
                state: state,
                selectedAnalysis: selectedAnalysis,
              );
            },
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(
            child: Text(
              'Unable to load insights.',
              style: AppTypography.bodyMedium,
            ),
          ),
        ),
      ),
    );
  }
}

class _MobileInsightLayout extends ConsumerWidget {
  const _MobileInsightLayout({
    required this.state,
    required this.selectedAnalysis,
  });

  final InsightState state;
  final MuscleAnalysis selectedAnalysis;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      key: const ValueKey('insight-mobile-layout'),
      padding: AppSpacing.screenPadding.copyWith(
        top: AppSpacing.base,
        bottom: AppSpacing.xl,
      ),
      children: [
        _InsightHeader(
          onChatPressed: () => context.go(AppRoutes.insightChat),
        ),
        const SizedBox(height: AppSpacing.base),
        InsightAnatomyPanel(
          muscleData: state.muscleData,
          activeSide: state.activeAtlasSide,
          onSideChanged: (side) {
            ref.read(insightNotifierProvider.notifier).setAtlasSide(side);
          },
          onMuscleTap: (id) {
            ref.read(insightNotifierProvider.notifier).selectMuscle(id);
            MusclePreviewSheet.show(context, id);
          },
        ),
        const SizedBox(height: AppSpacing.base),
        InsightMetricStrip(analysis: selectedAnalysis),
      ],
    );
  }
}

class _WideInsightLayout extends ConsumerWidget {
  const _WideInsightLayout({
    required this.state,
    required this.selectedAnalysis,
  });

  final InsightState state;
  final MuscleAnalysis selectedAnalysis;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      key: const ValueKey('insight-wide-layout'),
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 6,
            child: Column(
              children: [
                _InsightHeader(
                  onChatPressed: () {
                    ref
                        .read(insightNotifierProvider.notifier)
                        .setChatPanelOpen(true);
                  },
                ),
                const SizedBox(height: AppSpacing.base),
                Expanded(
                  child: InsightAnatomyPanel(
                    muscleData: state.muscleData,
                    activeSide: state.activeAtlasSide,
                    onSideChanged: (side) {
                      ref
                          .read(insightNotifierProvider.notifier)
                          .setAtlasSide(side);
                    },
                    onMuscleTap: (id) {
                      ref
                          .read(insightNotifierProvider.notifier)
                          .selectMuscle(id);
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.lg),
          Expanded(
            flex: 4,
            child: MuscleAnalysisPanel(
              analysis: selectedAnalysis,
              onViewAnalysis: () {
                context.go(AppRoutes.insightMuscleDetail(selectedAnalysis.muscleId));
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _InsightHeader extends StatelessWidget {
  const _InsightHeader({
    required this.onChatPressed,
  });

  final VoidCallback onChatPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Insights', style: AppTypography.h2),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'Muscle load and recovery map',
                style: AppTypography.bodyMedium,
              ),
            ],
          ),
        ),
        InsightAiEntryButton(onPressed: onChatPressed),
      ],
    );
  }
}
```

- [ ] **Step 7: Run tests and resolve missing imports after later widgets**

Run:

```bash
flutter test test/features/insight/screens/insight_screen_test.dart
```

Expected: may still FAIL because `MuscleAnalysisPanel` and `MusclePreviewSheet` are planned in later tasks. Continue to Task 3 before expecting green for this test.

- [ ] **Step 8: Commit only if tests for this task are green**

Do not commit this task until Task 3 creates the missing analysis panel and preview sheet and `insight_screen_test.dart` passes.

## Task 3: Add Preview Sheet, Analysis Panel, And Chart Widgets

**Files:**
- Create: `lib/features/insight/widgets/muscle_preview_sheet.dart`
- Create: `lib/features/insight/widgets/muscle_analysis_panel.dart`
- Create: `lib/features/insight/widgets/muscle_load_trend_chart.dart`
- Create: `lib/features/insight/widgets/muscle_exercise_contribution_chart.dart`
- Create: `lib/features/insight/widgets/muscle_recovery_balance_chart.dart`

- [ ] **Step 1: Create load trend chart**

Create `lib/features/insight/widgets/muscle_load_trend_chart.dart`:

```dart
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/features/insight/models/insight_models.dart';

class MuscleLoadTrendChart extends StatelessWidget {
  const MuscleLoadTrendChart({
    super.key,
    required this.points,
  });

  final List<ChartPoint> points;

  @override
  Widget build(BuildContext context) {
    final spots = [
      for (var index = 0; index < points.length; index += 1)
        FlSpot(index.toDouble(), points[index].value),
    ];

    return LineChart(
      LineChartData(
        gridData: const FlGridData(show: false),
        titlesData: const FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            color: AppColors.aiBlue,
            barWidth: 3,
            belowBarData: BarAreaData(
              show: true,
              color: AppColors.aiBlue.withValues(alpha: 0.16),
            ),
            dotData: const FlDotData(show: false),
          ),
        ],
      ),
    );
  }
}
```

- [ ] **Step 2: Create exercise contribution chart**

Create `lib/features/insight/widgets/muscle_exercise_contribution_chart.dart`:

```dart
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/features/insight/models/insight_models.dart';

class MuscleExerciseContributionChart extends StatelessWidget {
  const MuscleExerciseContributionChart({
    super.key,
    required this.contributions,
  });

  final List<ExerciseContribution> contributions;

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        gridData: const FlGridData(show: false),
        titlesData: const FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        barGroups: [
          for (var index = 0; index < contributions.length; index += 1)
            BarChartGroupData(
              x: index,
              barRods: [
                BarChartRodData(
                  toY: contributions[index].volume,
                  color: index == 0 ? AppColors.sportOrange : AppColors.aiBlue,
                  width: 18,
                  borderRadius: BorderRadius.circular(4),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
```

- [ ] **Step 3: Create recovery balance chart**

Create `lib/features/insight/widgets/muscle_recovery_balance_chart.dart`:

```dart
import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/insight/models/insight_models.dart';

class MuscleRecoveryBalanceChart extends StatelessWidget {
  const MuscleRecoveryBalanceChart({
    super.key,
    required this.points,
  });

  final List<ChartPoint> points;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final point in points) ...[
          Row(
            children: [
              SizedBox(
                width: 72,
                child: Text(point.label, style: AppTypography.label),
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                  child: LinearProgressIndicator(
                    value: (point.value / 100).clamp(0, 1),
                    minHeight: AppSpacing.sm,
                    backgroundColor: AppColors.inputBg,
                    color: point.label == 'Load'
                        ? AppColors.sportOrange
                        : AppColors.success,
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                point.value.toStringAsFixed(0),
                style: AppTypography.statSmall,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
        ],
      ],
    );
  }
}
```

- [ ] **Step 4: Create muscle analysis panel**

Create `lib/features/insight/widgets/muscle_analysis_panel.dart`:

```dart
import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/insight/models/insight_models.dart';
import 'package:forge_ai/features/insight/widgets/insight_metric_strip.dart';
import 'package:forge_ai/features/insight/widgets/muscle_exercise_contribution_chart.dart';
import 'package:forge_ai/features/insight/widgets/muscle_load_trend_chart.dart';
import 'package:forge_ai/features/insight/widgets/muscle_recovery_balance_chart.dart';
import 'package:forge_ai/shared/widgets/app_button.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';

class MuscleAnalysisPanel extends StatelessWidget {
  const MuscleAnalysisPanel({
    super.key,
    required this.analysis,
    this.onViewAnalysis,
    this.showViewAnalysisButton = true,
  });

  final MuscleAnalysis analysis;
  final VoidCallback? onViewAnalysis;
  final bool showViewAnalysisButton;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      key: const ValueKey('muscle-analysis-panel'),
      child: ListView(
        shrinkWrap: true,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('SELECTED MUSCLE', style: AppTypography.labelUppercase),
                    const SizedBox(height: AppSpacing.xs),
                    Text(analysis.displayName, style: AppTypography.h2),
                  ],
                ),
              ),
              _StatusBadge(status: analysis.status),
            ],
          ),
          const SizedBox(height: AppSpacing.base),
          InsightMetricStrip(analysis: analysis),
          const SizedBox(height: AppSpacing.base),
          _ChartCard(
            title: 'Load trend',
            child: MuscleLoadTrendChart(points: analysis.loadTrend),
          ),
          const SizedBox(height: AppSpacing.base),
          _ChartCard(
            title: 'Exercise contribution',
            child: MuscleExerciseContributionChart(
              contributions: analysis.exerciseContributions,
            ),
          ),
          const SizedBox(height: AppSpacing.base),
          _ChartCard(
            title: 'Recovery balance',
            child: MuscleRecoveryBalanceChart(points: analysis.recoveryBalance),
          ),
          const SizedBox(height: AppSpacing.base),
          AppCard(
            color: AppColors.inputBg,
            hasShadow: false,
            child: Text(
              analysis.recommendation,
              style: AppTypography.bodySemiBold,
            ),
          ),
          if (showViewAnalysisButton) ...[
            const SizedBox(height: AppSpacing.base),
            AppButton(
              text: 'View analysis',
              onPressed: onViewAnalysis,
            ),
          ],
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.status});

  final MuscleTrainingStatus status;

  @override
  Widget build(BuildContext context) {
    final label = switch (status) {
      MuscleTrainingStatus.recovered => 'READY',
      MuscleTrainingStatus.moderate => 'MODERATE',
      MuscleTrainingStatus.overloaded => 'OVERLOAD',
      MuscleTrainingStatus.neutral => 'NEUTRAL',
    };
    final color = switch (status) {
      MuscleTrainingStatus.recovered => AppColors.success,
      MuscleTrainingStatus.moderate => AppColors.energy,
      MuscleTrainingStatus.overloaded => AppColors.sportOrange,
      MuscleTrainingStatus.neutral => AppColors.textDisabled,
    };

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
      ),
      child: Text(
        label,
        style: AppTypography.labelUppercase.copyWith(color: color),
      ),
    );
  }
}

class _ChartCard extends StatelessWidget {
  const _ChartCard({
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      hasShadow: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTypography.h4),
          const SizedBox(height: AppSpacing.base),
          SizedBox(height: 160, child: child),
        ],
      ),
    );
  }
}
```

- [ ] **Step 5: Create muscle preview sheet**

Create `lib/features/insight/widgets/muscle_preview_sheet.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/core/router/app_router.dart';
import 'package:forge_ai/features/insight/providers/insight_provider.dart';
import 'package:forge_ai/features/insight/widgets/insight_metric_strip.dart';
import 'package:forge_ai/shared/widgets/app_button.dart';
import 'package:go_router/go_router.dart';

class MusclePreviewSheet extends ConsumerWidget {
  const MusclePreviewSheet({
    super.key,
    required this.muscleId,
  });

  final String muscleId;

  static Future<void> show(BuildContext context, String muscleId) {
    return showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.transparent,
      isScrollControlled: true,
      builder: (context) => MusclePreviewSheet(muscleId: muscleId),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final analysis = ref
        .read(insightNotifierProvider.notifier)
        .analysisForMuscle(muscleId);

    return Container(
      padding: const EdgeInsets.all(AppSpacing.base),
      decoration: const BoxDecoration(
        color: AppColors.cardWhite,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpacing.radiusXl),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: AppSpacing.xxl,
                height: AppSpacing.xs,
                decoration: BoxDecoration(
                  color: AppColors.border,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.base),
            Text(analysis.displayName, style: AppTypography.h2),
            const SizedBox(height: AppSpacing.xs),
            Text(analysis.recommendation, style: AppTypography.bodyMedium),
            const SizedBox(height: AppSpacing.base),
            InsightMetricStrip(analysis: analysis),
            const SizedBox(height: AppSpacing.base),
            AppButton(
              text: 'View analysis',
              onPressed: () {
                Navigator.of(context).pop();
                context.go(AppRoutes.insightMuscleDetail(analysis.muscleId));
              },
            ),
          ],
        ),
      ),
    );
  }
}
```

- [ ] **Step 6: Run insight screen tests and verify GREEN**

Run:

```bash
flutter test test/features/insight/screens/insight_screen_test.dart
```

Expected: PASS.

- [ ] **Step 7: Commit Tasks 2 and 3 together**

Run:

```bash
git add lib/features/insight/screens/insight_screen.dart lib/features/insight/widgets/insight_anatomy_panel.dart lib/features/insight/widgets/insight_metric_strip.dart lib/features/insight/widgets/insight_ai_entry_button.dart lib/features/insight/widgets/muscle_preview_sheet.dart lib/features/insight/widgets/muscle_analysis_panel.dart lib/features/insight/widgets/muscle_load_trend_chart.dart lib/features/insight/widgets/muscle_exercise_contribution_chart.dart lib/features/insight/widgets/muscle_recovery_balance_chart.dart test/features/insight/screens/insight_screen_test.dart
git commit -m "feat(insight): add responsive anatomy dashboard"
```

Expected: commit includes responsive shell, anatomy panel, metrics, preview sheet, charts, analysis panel, and widget tests.

## Task 4: Add Muscle Detail Route And Screen

**Files:**
- Modify: `lib/core/router/app_router.dart`
- Create: `lib/features/insight/screens/muscle_detail_screen.dart`
- Create: `test/features/insight/screens/muscle_detail_screen_test.dart`

- [ ] **Step 1: Write failing muscle detail widget tests**

Create `test/features/insight/screens/muscle_detail_screen_test.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forge_ai/features/insight/screens/muscle_detail_screen.dart';

void main() {
  Widget buildSubject(String muscleId) {
    return ProviderScope(
      child: MaterialApp(
        home: MuscleDetailScreen(muscleId: muscleId),
      ),
    );
  }

  testWidgets('renders known muscle analysis', (tester) async {
    await tester.pumpWidget(buildSubject('pectoralis_major_r'));
    await tester.pumpAndSettle();

    expect(find.text('Chest'), findsOneWidget);
    expect(find.text('Load trend'), findsOneWidget);
    expect(find.text('Exercise contribution'), findsOneWidget);
    expect(find.text('Recovery balance'), findsOneWidget);
  });

  testWidgets('renders unknown muscle empty state', (tester) async {
    await tester.pumpWidget(buildSubject('unknown_muscle'));
    await tester.pumpAndSettle();

    expect(find.text('Unknown muscle'), findsOneWidget);
    expect(find.text('No analysis is available for this muscle yet.'), findsOneWidget);
  });
}
```

- [ ] **Step 2: Run detail tests and verify RED**

Run:

```bash
flutter test test/features/insight/screens/muscle_detail_screen_test.dart
```

Expected: FAIL because `MuscleDetailScreen` does not exist.

- [ ] **Step 3: Create muscle detail screen**

Create `lib/features/insight/screens/muscle_detail_screen.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/insight/providers/insight_provider.dart';
import 'package:forge_ai/features/insight/widgets/muscle_analysis_panel.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MuscleDetailScreen extends ConsumerWidget {
  const MuscleDetailScreen({
    super.key,
    required this.muscleId,
  });

  final String muscleId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateAsync = ref.watch(insightNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.warmIvory,
      body: SafeArea(
        child: stateAsync.when(
          data: (_) {
            final analysis = ref
                .read(insightNotifierProvider.notifier)
                .analysisForMuscle(muscleId);

            return ListView(
              padding: AppSpacing.screenPadding.copyWith(
                top: AppSpacing.base,
                bottom: AppSpacing.xl,
              ),
              children: [
                Row(
                  children: [
                    IconButton(
                      tooltip: 'Back',
                      onPressed: () => context.pop(),
                      icon: Icon(PhosphorIcons.arrowLeft()),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: Text(
                        'Muscle analysis',
                        style: AppTypography.h2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.base),
                MuscleAnalysisPanel(
                  analysis: analysis,
                  showViewAnalysisButton: false,
                ),
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(
            child: Text(
              'Unable to load analysis.',
              style: AppTypography.bodyMedium,
            ),
          ),
        ),
      ),
    );
  }
}
```

- [ ] **Step 4: Add centralized route constants and route entries**

Modify `lib/core/router/app_router.dart`:

```dart
abstract final class AppRoutes {
  static const splash = '/';
  static const auth = '/auth';
  static const authModeParam = 'mode';
  static const authModeLogin = 'login';
  static const authModeRegister = 'register';
  static const goalSelection = '/goal-selection';
  static const equipmentSelection = '/equipment';
  static const bodyProfile = '/body-profile';
  static const schedulePreference = '/schedule';
  static const aiPlanPreview = '/ai-plan-preview';

  static const dashboard = '/dashboard';
  static const training = '/training';
  static const insights = '/insights';
  static const insightMuscleDetailPath = '/insights/muscle/:id';
  static const insightChat = '/insights/chat';
  static const profile = '/profile';

  static String get authLogin => _authWithMode(authModeLogin);
  static String get authRegister => _authWithMode(authModeRegister);

  static String insightMuscleDetail(String id) => '/insights/muscle/$id';

  static String _authWithMode(String mode) {
    return Uri(path: auth, queryParameters: {authModeParam: mode}).toString();
  }
}
```

Add imports:

```dart
import 'package:forge_ai/features/insight/screens/insight_chat_screen.dart';
import 'package:forge_ai/features/insight/screens/muscle_detail_screen.dart';
```

Add `GoRoute`s after the shell route or inside the shell branch if the bottom nav must remain visible:

```dart
GoRoute(
  path: AppRoutes.insightMuscleDetailPath,
  builder: (context, state) {
    final id = state.pathParameters['id'] ?? '';
    return MuscleDetailScreen(muscleId: id);
  },
),
GoRoute(
  path: AppRoutes.insightChat,
  builder: (context, state) => const InsightChatScreen(),
),
```

- [ ] **Step 5: Run detail tests and route analyzer**

Run:

```bash
flutter test test/features/insight/screens/muscle_detail_screen_test.dart
dart analyze lib/core/router/app_router.dart lib/features/insight/screens/muscle_detail_screen.dart
```

Expected: detail tests PASS; analyzer exits 0 for touched files after `InsightChatScreen` exists in Task 5. If this fails only because `InsightChatScreen` is missing, continue to Task 5 before committing.

- [ ] **Step 6: Commit after Task 5 if route imports are complete**

Do not commit Task 4 until Task 5 adds `InsightChatScreen` if `app_router.dart` imports it.

## Task 5: Refactor AI Chat Into Secondary Route And Wide Panel

**Files:**
- Create: `lib/features/insight/screens/insight_chat_screen.dart`
- Modify: `lib/features/insight/screens/insight_chat_tab.dart`
- Create: `lib/features/insight/widgets/insight_chat_content.dart`
- Modify: `lib/features/insight/screens/insight_screen.dart`
- Modify: `lib/core/router/app_router.dart`

- [ ] **Step 1: Extract reusable chat content from the existing chat tab**

Modify `lib/features/insight/screens/insight_chat_tab.dart` so it keeps one public widget and delegates to reusable content:

```dart
import 'package:flutter/material.dart';
import 'package:forge_ai/features/insight/widgets/insight_chat_content.dart';

class InsightChatTab extends StatelessWidget {
  const InsightChatTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const InsightChatContent();
  }
}
```

Create `lib/features/insight/widgets/insight_chat_content.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/insight/providers/insight_provider.dart';
import 'package:forge_ai/features/insight/widgets/insight_card.dart';

class InsightChatContent extends ConsumerStatefulWidget {
  const InsightChatContent({super.key});

  @override
  ConsumerState<InsightChatContent> createState() => _InsightChatContentState();
}

class _InsightChatContentState extends ConsumerState<InsightChatContent> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    ref.read(insightNotifierProvider.notifier).sendMessage(text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final stateAsync = ref.watch(insightNotifierProvider);

    return Column(
      children: [
        Expanded(
          child: stateAsync.when(
            data: (state) => ListView.builder(
              padding: const EdgeInsets.all(AppSpacing.base),
              itemCount: state.messages.length,
              itemBuilder: (context, index) {
                return InsightCard(message: state.messages[index]);
              },
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) => const Center(
              child: Text('Unable to load AI chat.'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.base,
            0,
            AppSpacing.base,
            AppSpacing.base,
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.cardWhite,
              borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
              boxShadow: [
                BoxShadow(
                  color: AppColors.aiBlue.withValues(alpha: 0.1),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Ask AI to analyze...',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: AppSpacing.lg,
                      ),
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                IconButton(
                  color: AppColors.aiBlue,
                  onPressed: _sendMessage,
                  icon: const Icon(Icons.auto_awesome),
                ),
                const SizedBox(width: AppSpacing.sm),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
```

- [ ] **Step 2: Create mobile chat screen**

Create `lib/features/insight/screens/insight_chat_screen.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/insight/widgets/insight_chat_content.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class InsightChatScreen extends StatelessWidget {
  const InsightChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.warmIvory,
      appBar: AppBar(
        backgroundColor: AppColors.warmIvory,
        elevation: 0,
        leading: IconButton(
          tooltip: 'Back',
          onPressed: () => context.pop(),
          icon: Icon(PhosphorIcons.arrowLeft()),
        ),
        title: Text('AI coach', style: AppTypography.h3),
      ),
      body: const InsightChatContent(),
    );
  }
}
```

- [ ] **Step 3: Add wide side panel to `InsightScreen`**

In `_WideInsightLayout`, wrap the row with a `Stack` and render `InsightChatContent` when `state.isChatPanelOpen` is true:

```dart
Stack(
  children: [
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Existing anatomy and analysis columns.
      ],
    ),
    if (state.isChatPanelOpen)
      Positioned(
        top: 0,
        right: 0,
        bottom: 0,
        width: 360,
        child: AppCard(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text('AI coach', style: AppTypography.h3),
                  ),
                  IconButton(
                    tooltip: 'Close',
                    onPressed: () {
                      ref
                          .read(insightNotifierProvider.notifier)
                          .setChatPanelOpen(false);
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const Expanded(child: InsightChatContent()),
            ],
          ),
        ),
      ),
  ],
)
```

Add imports in `lib/features/insight/screens/insight_screen.dart`:

```dart
import 'package:forge_ai/shared/widgets/app_card.dart';
import 'package:forge_ai/features/insight/widgets/insight_chat_content.dart';
```

- [ ] **Step 4: Run targeted tests**

Run:

```bash
flutter test test/features/insight/screens/insight_screen_test.dart test/features/insight/screens/muscle_detail_screen_test.dart
```

Expected: PASS.

- [ ] **Step 5: Commit Tasks 4 and 5**

Run:

```bash
git add lib/core/router/app_router.dart lib/features/insight/screens/muscle_detail_screen.dart lib/features/insight/screens/insight_chat_screen.dart lib/features/insight/screens/insight_chat_tab.dart lib/features/insight/screens/insight_screen.dart lib/features/insight/widgets/insight_chat_content.dart test/features/insight/screens/muscle_detail_screen_test.dart
git commit -m "feat(insight): add muscle detail and AI chat routes"
```

Expected: commit includes route updates, detail screen, chat screen/panel refactor, and detail tests.

## Task 6: Remove Or Retire Obsolete Insight Tab Widgets

**Files:**
- Modify or delete: `lib/features/insight/screens/insight_dashboard_tab.dart`
- Modify or delete: `lib/features/insight/widgets/anatomy_view.dart`
- Modify or delete: `lib/features/insight/widgets/trend_chart.dart`

- [ ] **Step 1: Search for obsolete widget references**

Run:

```bash
grep -R "InsightDashboardTab\\|AnatomyView\\|TrendChart" -n lib test
```

Expected: references either only point to obsolete files or no references remain from active screens.

- [ ] **Step 2: Delete unused obsolete files if unreferenced**

If the grep output shows no active references, delete the obsolete files:

```bash
git rm lib/features/insight/screens/insight_dashboard_tab.dart lib/features/insight/widgets/anatomy_view.dart lib/features/insight/widgets/trend_chart.dart
```

Expected: files removed from git index. If one file is still referenced, keep it and refactor the reference instead of deleting.

- [ ] **Step 3: Run import/reference check**

Run:

```bash
dart analyze lib/features/insight
```

Expected: exit 0 for the insight feature.

- [ ] **Step 4: Commit cleanup**

Run:

```bash
git add lib/features/insight
git commit -m "refactor(insight): remove legacy tab anatomy widgets"
```

Expected: commit only removes or refactors obsolete tab-era widgets.

## Task 7: Full Verification Gate

**Files:**
- Verify all changed files.

- [ ] **Step 1: Run all targeted tests**

Run:

```bash
flutter test test/features/insight/providers/insight_provider_test.dart test/features/insight/screens/insight_screen_test.dart test/features/insight/screens/muscle_detail_screen_test.dart
```

Expected: PASS.

- [ ] **Step 2: Run the project verification gate**

Run:

```bash
./tool/check.sh
```

Expected: exit 0 with no Flutter analyze, custom lint, or format check errors.

- [ ] **Step 3: Inspect final diff**

Run:

```bash
git status --short
git log --oneline -5
```

Expected: only intentional uncommitted files remain, or worktree is clean except unrelated user changes that existed before implementation.

- [ ] **Step 4: Final implementation summary**

Report:

- Which commits were created.
- Which tests and verification commands passed.
- Any remaining unrelated dirty files.
- Any known limitations, especially that the data is still mock/local and true 3D was intentionally excluded.
