# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Must-read project guidance

- Read `AGENTS.md` before making changes. It is the repository’s authoritative ruleset for architecture and coding constraints.
- For any UI, layout, theme, widget, screen, animation, icon, chart, or visual work, also read `DESIGN.md` first.
- Follow the repo’s language split from `AGENTS.md`: communicate with the user in Vietnamese, but keep code, identifiers, comments, UI copy, and commit messages in English.

## Common commands

Run commands from the repository root (`forge_ai/`).

```bash
flutter pub get
flutter run
flutter analyze
dart run custom_lint
./tool/check.sh
flutter test
```

Single test file:

```bash
flutter test test/features/insight/providers/insight_provider_test.dart
```

Regenerate code after editing Riverpod/Freezed/JSON/Hive-annotated files:

```bash
dart run build_runner build --delete-conflicting-outputs
```

The project verification gate is:

```bash
./tool/check.sh
```

This runs `flutter analyze`, `flutter pub run custom_lint`, and a formatting check over `lib`, `tools`, and `test`. Do not rely on `flutter analyze` alone because custom lint enforces project-specific architectural rules.

## High-level architecture

This is a Flutter app organized as a feature-first codebase with Riverpod for state, GoRouter for navigation, Hive for local persistence, and a small shared design system in `lib/core/`.

### App shell

- `lib/main.dart` is the real entry point. It initializes Hive, wraps the app in `ProviderScope`, and launches `ForgeAIApp`.
- There is no separate `lib/app.dart` right now; `ForgeAIApp` lives in `lib/main.dart`.
- `lib/core/theme/app_theme.dart` defines the app theme.
- `lib/core/router/app_router.dart` is the single routing hub: route constants live in `AppRoutes`, top-level onboarding/auth/detail routes are defined there, and the main tabbed area is implemented with `StatefulShellRoute.indexedStack`.

### Navigation model

The app currently has two main navigation modes:

1. A linear onboarding/auth flow driven by top-level `GoRoute`s:
   - welcome
   - auth
   - goal selection
   - equipment selection
   - body profile
   - schedule preference
   - AI plan preview

2. A persistent bottom-navigation shell for the main product area:
   - dashboard
   - training
   - insights
   - profile placeholder

Insight detail routes such as chat and muscle detail also hang off the centralized router. Route strings should come from `AppRoutes`; raw path literals are forbidden by custom lint.

### Feature structure

Most code lives under `lib/features/`, currently including:

- `auth/`
- `dashboard/`
- `insight/`
- `onboarding/`
- `training/`

Each feature generally follows the same split:

- `screens/` for route-level UI
- `widgets/` for feature-scoped composition
- `providers/` for Riverpod state
- `models/` where that feature owns its data types

Keep feature-local widgets inside their feature. If something is reused across features, promote it to `lib/shared/widgets/` instead of importing from one feature into another.

### Design system and lint-enforced constraints

The project relies on a centralized token layer in `lib/core/constants/`:

- `app_colors.dart`
- `app_spacing.dart`
- `app_typography.dart`

Those tokens are not optional style guidance; custom lint enforces the architecture around them. The repo also enforces:

- package imports instead of cross-feature relative imports
- no raw route strings
- no hardcoded colors
- no direct ad hoc `TextStyle` definitions
- one public widget per file
- widget file size limits
- no direct provider state mutation from widgets

Read `analysis_options.yaml` if you need the exact lint surface.

### State management patterns

The repo uses Riverpod in two styles:

- classic `NotifierProvider` in onboarding and simpler local flows
- generator-based providers with `@riverpod` and `part` files in richer features like insight

Important practical pattern: widgets should invoke notifier methods, not assign provider state directly. If you touch provider definitions or annotated models, expect to regenerate code with `build_runner`.

### Current product modules

- `onboarding/` holds the multi-step setup flow and stores transient choices like goals, equipment, body metrics, schedule preferences, and preferred training time in feature providers.
- `dashboard/` is the main home tab and is mostly compositional UI built from small widgets.
- `training/` is a separate tab with today’s workout, weekly plan, upcoming workout, and insight cards.
- `insight/` is the most stateful feature right now: it owns muscle-analysis models, mock analytics/chat state, anatomy interaction, responsive layouts, charts, chat UI, and the muscle detail drill-down route.
- `auth/` currently supports login/register mode switching through a single route with a query parameter.

### Persistence and generated code

Hive is initialized at startup, but the codebase is still mostly UI/state driven and not yet heavily repository-centric. Generated files already exist for:

- Freezed models
- JSON serialization
- Riverpod codegen

Do not hand-edit generated files such as `*.g.dart` or `*.freezed.dart`.

## Testing notes

There are focused tests under `test/features/...`, especially for auth, insight, and training. When changing a feature, prefer running the relevant test file first, then the full suite if needed.

## Repo-specific workflow reminders

- Reuse existing widgets before creating new ones; `AGENTS.md` makes this the top-level rule.
- If you change UI structure or tokens, check whether `DESIGN.md` should also be updated to match the implemented design system.
- Before finishing a change, run `./tool/check.sh` from the repo root.
