# Training Screen Design

## Context

ForgeAI currently has a `TRAINING` bottom tab wired through `AppRoutes.training`,
but the route renders `PlaceholderScreen(title: 'Training')`. The app already
has a dashboard shell, design tokens, and shared `AppCard` / `AppButton`
widgets. The Training screen should replace the placeholder without expanding
the feature into a full workout execution flow.

## Goal

Create a `Workout plan hub` screen for the `TRAINING` tab. The screen helps the
user see today's planned workout, scan the weekly plan, and start the current
session from one clear CTA.

## Scope

In scope:

- Add a Training feature screen under `lib/features/training/screens/`.
- Add Training-only widgets under `lib/features/training/widgets/` when the
  screen needs extraction to keep files focused.
- Replace the Training tab placeholder route with the new screen.
- Use static local UI data for this first pass.
- Reuse `AppCard`, `AppButton`, `AppColors`, `AppTypography`, and `AppSpacing`.

Out of scope:

- Active workout timer/session flow.
- Exercise detail pages.
- Persistent workout models, repositories, or Hive storage.
- New third-party packages.
- Cross-feature shared widgets unless a component is clearly reused elsewhere.

## Screen Structure

The screen uses the existing dashboard shell and bottom navigation. It renders a
warm ivory scaffold with a safe-area scroll view and standard horizontal screen
padding.

Primary sections:

1. Header: compact top row with page title `Training` and a small action icon.
2. Today's workout hero: card with workout name, duration, exercise count,
   readiness context, and a `Start workout` primary button.
3. Weekly plan selector: seven compact day chips showing planned/rest days and
   highlighting today.
4. Upcoming plan list: two or three compact workout cards for later sessions.
5. ForgeAI recovery insight: a short card explaining how readiness affects the
   plan.

## Architecture

Use `TrainingScreen` as the route target. Keep the screen declarative and static
for now. Extract private or feature-scoped widgets if the screen build method
would become too long.

Expected file boundaries:

- `lib/features/training/screens/training_screen.dart`: route screen and page
  composition.
- `lib/features/training/widgets/...`: feature-only visual components if needed.
- `lib/core/router/app_router.dart`: route import and Training tab builder
  update.

No Riverpod provider is required for this first pass because there is no
business state, persistence, or user interaction beyond button taps.

## Visual Rules

The implementation must follow ForgeAI architecture rules:

- No hardcoded colors; use `AppColors`.
- No arbitrary spacing; use `AppSpacing`.
- No direct ad hoc typography; use `AppTypography.copyWith(...)`.
- Use absolute `package:forge_ai/...` imports.
- Reuse `AppCard` and `AppButton` before creating new card/button variants.
- Keep widget files under the project line limits.

## Behavior

`Start workout` is a visible CTA but does not navigate yet because the active
workout flow is out of scope. The button can be a no-op callback for this UI
pass, or use a placeholder-safe callback without adding a new route.

The weekly selector is presentational in this pass. It should communicate the
weekly plan clearly without storing selected-day state.

## Verification

Run the project gate from the repository root:

```bash
./tool/check.sh
```

The work is complete only when the command finishes with zero errors and zero
warnings, or any failure is reported with the exact blocker.
