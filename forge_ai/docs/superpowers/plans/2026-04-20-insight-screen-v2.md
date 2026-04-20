# Insight Screen V2 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Xây dựng màn hình Insight V2 với thiết kế Glassmorphism, tích hợp mô hình cơ thể tương tác (Body Anatomy) và Trợ lý AI nâng cao.

**Architecture:** Sử dụng Flutter với Riverpod để quản lý State. Giao diện 2 tab (Dashboard và Ask AI) sử dụng các component tái sử dụng (`AppCard`, `AppColors`, `AppTypography`). Tích hợp `flutter_body_atlas` để hiển thị bản đồ cơ bắp và `fl_chart` cho biểu đồ xu hướng.

**Tech Stack:** Flutter, Riverpod, Freezed, flutter_body_atlas, fl_chart.

---

### Task 1: Add Dependencies

**Files:**
- Modify: `pubspec.yaml`

- [ ] **Step 1: Add packages to pubspec.yaml**

```bash
flutter pub add flutter_body_atlas
flutter pub add fl_chart
```

- [ ] **Step 2: Commit**

```bash
git add pubspec.yaml pubspec.lock
git commit -m "chore: add flutter_body_atlas and fl_chart dependencies"
```

---

### Task 2: Create Data Models & Provider

**Files:**
- Create: `lib/features/insight/models/insight_models.dart`
- Create: `lib/features/insight/providers/insight_provider.dart`
- Test: `test/features/insight/providers/insight_provider_test.dart`

- [ ] **Step 1: Write models**

```dart
// lib/features/insight/models/insight_models.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'insight_models.freezed.dart';
part 'insight_models.g.dart';

@freezed
class MuscleData with _$MuscleData {
  const factory MuscleData({
    required String id, // corresponds to flutter_body_atlas IDs
    required double volume,
    required double rpe,
  }) = _MuscleData;

  factory MuscleData.fromJson(Map<String, dynamic> json) => _$MuscleDataFromJson(json);
}

@freezed
class InsightMessage with _$InsightMessage {
  const factory InsightMessage({
    required String id,
    required String content,
    required bool isUser,
    @Default(false) bool hasChart,
  }) = _InsightMessage;

  factory InsightMessage.fromJson(Map<String, dynamic> json) => _$InsightMessageFromJson(json);
}
```

- [ ] **Step 2: Write provider test**

```dart
// test/features/insight/providers/insight_provider_test.dart
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
```

- [ ] **Step 3: Write provider implementation**

```dart
// lib/features/insight/providers/insight_provider.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/insight_models.dart';

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
    final initialMessage = InsightMessage(
      id: '0', 
      content: '**Phân tích tuần qua:**\nCơ ngực của bạn đang có dấu hiệu quá tải (RPE 8.5). Bạn nên tập chân hoặc nghỉ ngơi.',
      isUser: false,
    );
    return InsightState(muscleData: mockMuscleData, messages: [initialMessage]);
  }

  Future<void> sendMessage(String text) async {
    final currentState = state.valueOrNull;
    if (currentState == null) return;

    final userMsg = InsightMessage(id: DateTime.now().toString(), content: text, isUser: true);
    state = AsyncData(currentState.copyWith(messages: [...currentState.messages, userMsg]));

    await Future.delayed(const Duration(milliseconds: 300));
    final aiMsg = InsightMessage(
      id: DateTime.now().toString(), 
      content: 'Tôi đã phân tích yêu cầu: "$text". Dưới đây là biểu đồ:',
      isUser: false,
      hasChart: true,
    );
    state = AsyncData(currentState.copyWith(messages: [...currentState.messages, userMsg, aiMsg]));
  }
}
```

- [ ] **Step 4: Generate and test**

Run: `dart run build_runner build -d`
Run: `flutter test test/features/insight/providers/insight_provider_test.dart`
Expected: PASS

- [ ] **Step 5: Commit**

```bash
git add lib/features/insight/ test/features/insight/
git commit -m "feat(insight): add v2 data models and provider"
```

---

### Task 3: Build Dashboard Tab (Anatomy & Chart)

**Files:**
- Create: `lib/features/insight/widgets/anatomy_view.dart`
- Create: `lib/features/insight/widgets/trend_chart.dart`
- Create: `lib/features/insight/screens/insight_dashboard_tab.dart`

- [ ] **Step 1: Write AnatomyView widget**

```dart
// lib/features/insight/widgets/anatomy_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_body_atlas/flutter_body_atlas.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import '../models/insight_models.dart';

class AnatomyView extends StatelessWidget {
  final List<MuscleData> data;
  const AnatomyView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: FlutterBodyAtlas(
        bodyAtlasController: BodyAtlasController(), // For hit testing if needed
        colorsResolver: (id) {
          final match = data.where((m) => m.id == id).firstOrNull;
          if (match != null) {
            if (match.rpe >= 8) return AppColors.sportOrange;
            if (match.rpe >= 5) return AppColors.energy;
            return AppColors.success;
          }
          return AppColors.inputBg;
        },
      ),
    );
  }
}
```

- [ ] **Step 2: Write TrendChart widget**

```dart
// lib/features/insight/widgets/trend_chart.dart
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';

class TrendChart extends StatelessWidget {
  const TrendChart({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Volume Trend', style: AppTypography.h3),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 3), FlSpot(1, 4), FlSpot(2, 3.5), FlSpot(3, 5),
                    ],
                    isCurved: true,
                    color: AppColors.aiBlue,
                    barWidth: 3,
                    belowBarData: BarAreaData(
                      show: true,
                      color: AppColors.aiBlue.withValues(alpha: 0.2),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```

- [ ] **Step 3: Write Dashboard Tab**

```dart
// lib/features/insight/screens/insight_dashboard_tab.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/insight_provider.dart';
import '../widgets/anatomy_view.dart';
import '../widgets/trend_chart.dart';

class InsightDashboardTab extends ConsumerWidget {
  const InsightDashboardTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateAsync = ref.watch(insightNotifierProvider);

    return stateAsync.when(
      data: (state) => SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AnatomyView(data: state.muscleData),
            const SizedBox(height: 24),
            const TrendChart(),
          ],
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
    );
  }
}
```

- [ ] **Step 4: Commit**

```bash
git add lib/features/insight/widgets/ lib/features/insight/screens/insight_dashboard_tab.dart
git commit -m "feat(insight): build dashboard tab with anatomy and chart"
```

---

### Task 4: Build Chat Tab (Insight Cards)

**Files:**
- Create: `lib/features/insight/widgets/insight_card.dart`
- Create: `lib/features/insight/screens/insight_chat_tab.dart`

- [ ] **Step 1: Write InsightCard widget**

```dart
// lib/features/insight/widgets/insight_card.dart
import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';
import '../models/insight_models.dart';

class InsightCard extends StatelessWidget {
  final InsightMessage message;
  const InsightCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    if (message.isUser) {
      return Align(
        alignment: Alignment.centerRight,
        child: Container(
          margin: const EdgeInsets.only(bottom: 16, left: 40),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.sportOrange,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(message.content, style: AppTypography.bodyMedium.copyWith(color: AppColors.cardWhite)),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 16, right: 20),
      child: AppCard(
        color: AppColors.cardWhite.withValues(alpha: 0.9),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.smart_toy, color: AppColors.aiBlue, size: 20),
                const SizedBox(width: 8),
                Text('AI Insight', style: AppTypography.labelUppercase),
              ],
            ),
            const SizedBox(height: 12),
            Text(message.content, style: AppTypography.bodyMedium),
            if (message.hasChart) ...[
              const SizedBox(height: 16),
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: AppColors.warmIvory,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(child: Text('Mini Chart Placeholder')),
              )
            ]
          ],
        ),
      ),
    );
  }
}
```

- [ ] **Step 2: Write Chat Tab**

```dart
// lib/features/insight/screens/insight_chat_tab.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import '../providers/insight_provider.dart';
import '../widgets/insight_card.dart';

class InsightChatTab extends ConsumerStatefulWidget {
  const InsightChatTab({super.key});

  @override
  ConsumerState<InsightChatTab> createState() => _InsightChatTabState();
}

class _InsightChatTabState extends ConsumerState<InsightChatTab> {
  final _controller = TextEditingController();

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      ref.read(insightNotifierProvider.notifier).sendMessage(text);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final stateAsync = ref.watch(insightNotifierProvider);

    return Column(
      children: [
        Expanded(
          child: stateAsync.when(
            data: (state) => ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.messages.length,
              itemBuilder: (ctx, i) => InsightCard(message: state.messages[i]),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Error: $e')),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.cardWhite,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(color: AppColors.aiBlue.withValues(alpha: 0.1), blurRadius: 10, spreadRadius: 2),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Hỏi AI phân tích...',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.auto_awesome, color: AppColors.aiBlue),
                  onPressed: _sendMessage,
                ),
                const SizedBox(width: 8),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
```

- [ ] **Step 3: Commit**

```bash
git add lib/features/insight/widgets/insight_card.dart lib/features/insight/screens/insight_chat_tab.dart
git commit -m "feat(insight): build enhanced chat tab with insight cards"
```

---

### Task 5: Assemble Insight Screen

**Files:**
- Create: `lib/features/insight/screens/insight_screen.dart`

- [ ] **Step 1: Write Main Screen**

```dart
// lib/features/insight/screens/insight_screen.dart
import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'insight_dashboard_tab.dart';
import 'insight_chat_tab.dart';

class InsightScreen extends StatelessWidget {
  const InsightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.warmIvory,
        appBar: AppBar(
          backgroundColor: AppColors.warmIvory,
          elevation: 0,
          title: Text('Insights', style: AppTypography.h2),
          bottom: TabBar(
            labelColor: AppColors.sportOrange,
            unselectedLabelColor: AppColors.textDisabled,
            indicatorColor: AppColors.sportOrange,
            labelStyle: AppTypography.bodySemiBold,
            tabs: const [
              Tab(text: 'Anatomy'),
              Tab(text: 'Ask AI'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            InsightDashboardTab(),
            InsightChatTab(),
          ],
        ),
      ),
    );
  }
}
```

- [ ] **Step 2: Commit**

```bash
git add lib/features/insight/screens/insight_screen.dart
git commit -m "feat(insight): assemble v2 insight screen"
```
