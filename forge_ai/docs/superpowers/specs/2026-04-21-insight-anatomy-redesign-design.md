# Insight Anatomy Redesign Design

Date: 2026-04-21

## Goal

Refactor the current Insight experience from a two-tab screen into one premium 2D anatomy analytics screen. The screen should make the muscle atlas the primary interaction, support responsive layouts from mobile to desktop, and preserve AI chat as a secondary entry instead of a main tab.

The implementation must reuse the existing ForgeAI design system and current dependencies. It must not add new packages.

## Current Context

The current `InsightScreen` uses `DefaultTabController` with two tabs: Anatomy and Ask AI. The anatomy tab renders front and back `flutter_body_atlas` views side by side and shows a simple trend chart. The chat tab uses the same provider and renders message cards plus an input bar.

Existing dependencies already cover the redesign:

- `flutter_body_atlas` for interactive SVG muscle atlas rendering and hit testing.
- `fl_chart` for professional charts.
- `flutter_riverpod`, `freezed`, and generated providers/models for state and data.
- Shared design primitives such as `AppCard`, `AppColors`, `AppTypography`, and `AppSpacing`.

## Product Direction

The redesigned Insight screen has one primary screen instead of two tabs.

On mobile, the layout is atlas-first:

- Header with `Insights` and a secondary AI chat action.
- A large anatomy panel with front/back control.
- Muscle heatmap coloring based on training/recovery state.
- Quick metric strip below the anatomy panel.
- Tap on a muscle opens a bottom sheet preview.
- The preview has a `View analysis` action for the full detail screen.

On tablet and desktop, the layout is a workbench:

- Anatomy panel on the left.
- Selected muscle analysis panel on the right.
- Selecting a muscle updates the right panel immediately.
- AI chat opens as a side panel or dialog, keeping the anatomy context visible.

AI chat remains available, but it is no longer a tab:

- Mobile opens a full-screen chat route.
- Tablet and desktop open a side panel or dialog.

## User Flow

1. User opens `Insights` from the dashboard shell bottom navigation.
2. `InsightScreen` loads anatomy data and default analysis state.
3. The screen renders either mobile atlas-first or wide workbench layout based on constraints.
4. User switches between front and back atlas views.
5. User taps a muscle.
6. Mobile shows a bottom sheet preview with summary, status, volume, RPE, and a short recommendation.
7. Tablet and desktop update the analysis panel directly.
8. User opens `View analysis` to navigate to the muscle detail route.
9. Detail screen shows a balanced analytics dashboard for that muscle.
10. User can open AI chat through the secondary chat entry.

## Routes

Routes remain centralized in `AppRoutes`; route strings must not be hardcoded in widgets.

Planned routes:

- `AppRoutes.insights`: existing Insight entry in the shell.
- `AppRoutes.insightMuscleDetail`: `/insights/muscle/:id`.
- `AppRoutes.insightChat`: `/insights/chat` for mobile full-screen chat.

Tablet/desktop chat can use an in-screen side panel or dialog and does not require navigation unless the implementation chooses to keep one route for consistency.

## Architecture

All feature-specific code stays under `lib/features/insight/`. Shared widgets are reused where possible. New shared widgets should only be created if the component is genuinely reusable across features.

Primary screen and route widgets:

- `InsightScreen`: responsive container and state binding.
- `MuscleDetailScreen`: full-screen analysis route for one muscle.
- `InsightChatScreen`: mobile chat route if chat remains route-based.

Feature widgets:

- `InsightAnatomyPanel`: renders the anatomy atlas, side control, heatmap colors, and tap callback.
- `InsightMetricStrip`: quick metrics used by the main screen and detail screen.
- `MusclePreviewSheet`: mobile bottom sheet preview.
- `MuscleAnalysisPanel`: balanced dashboard panel reused by tablet/desktop workbench and detail screen.
- `MuscleLoadTrendChart`: load or volume trend over time.
- `MuscleExerciseContributionChart`: contribution by exercise.
- `MuscleRecoveryBalanceChart`: fatigue/recovery status visualization.
- `InsightAiEntryButton`: compact chat entry action if not covered by existing button patterns.

Existing widgets should be extended instead of duplicated when practical. `InsightChatTab` can be refactored into a screen/panel rather than copied.

## Responsive Behavior

Use `LayoutBuilder` inside `InsightScreen` to choose the presentation:

- Mobile: atlas-first single column.
- Tablet/Desktop: two-column workbench.

The breakpoint should be conservative and simple, for example around `720` logical pixels, unless existing app conventions already define a breakpoint.

The state model must be shared across layouts. The app should not maintain separate mobile and desktop feature states.

## Anatomy Interaction

`flutter_body_atlas` remains the atlas renderer. It supports:

- `AtlasAsset.musclesFront` and `AtlasAsset.musclesBack`.
- `BodyAtlasView<MuscleInfo>`.
- `MuscleResolver`.
- `colorMapping` for heatmap coloring.
- `onTapElement` for muscle selection.

The atlas panel maps each `MuscleData.id` to `MuscleInfo` through `MuscleResolver`. Muscles with no data should remain neutral and tappable without crashing.

Heatmap colors:

- Low/recovered: `AppColors.success`.
- Moderate load: `AppColors.energy`.
- High fatigue or overload: `AppColors.sportOrange`.
- No data or neutral: `AppColors.inputBg` or a subtle neutral treatment from the design system.

## Detail Analysis

The detail experience uses a balanced dashboard, not a chart-only page.

It should include:

- Header with muscle name, status badge, and back navigation.
- Summary metrics: volume, RPE, trend, fatigue/recovery score.
- Load trend chart.
- Exercise contribution chart.
- Recovery/fatigue balance chart.
- AI recommendation card with a clear action-oriented insight.

The detail screen should handle unknown or unsupported muscle ids by showing a clear empty state and a back action.

## Data Model

Data remains mock/local for this redesign, but the structure should be realistic enough to connect to workout history later.

Current `MuscleData` can remain the heatmap summary model. Additional Freezed models should represent detail analysis:

- `MuscleAnalysis`: muscle id, display name, status, volume, RPE, trend, fatigue/recovery score, recommendation.
- `ExerciseContribution`: exercise name and contribution value.
- `ChartPoint`: label and numeric value for chart series.

If a new enum improves clarity, use a small enum for atlas side or muscle status. Keep naming aligned with project conventions.

## Provider Behavior

Extend the existing `InsightNotifier` and `InsightState` rather than creating disconnected feature state.

Expected state:

- Muscle heatmap data.
- Muscle analysis list or map.
- Selected muscle id.
- Active atlas side.
- AI chat messages.
- Optional chat side panel open state for wide layouts.

Expected actions:

- `selectMuscle(String id)`.
- `setAtlasSide(...)`.
- Analysis lookup by muscle id.
- Existing `sendMessage(String text)` behavior retained and adapted for screen/panel chat.

Widgets should use `ref.watch()` for reactive UI and `ref.read()` in callbacks only.

## Error And Loading States

Loading state:

- Show a centered progress indicator or simple skeleton inside the anatomy area.

Error state:

- Show a concise error message and retry action if the provider supports retry.

Unknown muscle:

- Do not throw from UI.
- Show a neutral preview or detail empty state: no analysis available for this muscle yet.

## Visual System

All visual values must come from the ForgeAI design system:

- Colors through `AppColors`.
- Typography through `AppTypography`.
- Spacing through `AppSpacing`.
- Cards through `AppCard` when card semantics apply.

No hardcoded colors or arbitrary spacing values should be introduced in production widgets.

The tone is premium analytics:

- Warm app background.
- White analytical cards with subtle border or shadow.
- Mono numeric styling for stats.
- Heatmap accents for muscle status.
- AI blue reserved for AI-specific actions and insights.

## Testing

Provider tests:

- Initial state includes muscle data, analysis data, and chat seed data.
- `selectMuscle` updates selected muscle id.
- Atlas side action updates active side.
- Analysis lookup returns expected data for known ids.
- Unknown ids produce safe fallback behavior.
- `sendMessage` still appends user and AI messages.

Widget tests:

- `InsightScreen` no longer renders a `TabBar`.
- Mobile layout renders anatomy-first structure.
- Wide layout renders workbench structure.
- Detail screen renders analysis for a known muscle id.
- Detail screen handles an unknown muscle id.

Final verification must use `./tool/check.sh` from the project root, not `flutter analyze` alone.

## Non-Goals

This redesign does not include:

- True 3D `.glb` anatomy model integration.
- New packages.
- Real workout repository integration.
- Production AI backend integration.
- Medical-grade anatomical accuracy beyond what `flutter_body_atlas` provides.

## Implementation Notes

Keep widget files under 120 lines and extract focused private or feature widgets when needed. Avoid cross-feature imports from another feature widget folder. Generated Freezed/Riverpod files should be updated with `build_runner` after model/provider changes.

The implementation should preserve current user changes in the worktree and avoid reverting unrelated edits.
