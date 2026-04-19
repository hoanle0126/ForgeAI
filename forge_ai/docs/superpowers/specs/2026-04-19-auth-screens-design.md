# Auth Screens Design

Date: 2026-04-19

## Goal

Create ForgeAI login and registration screens using a local auth mock. The UI must feel like a premium fitness AI product, not a generic form. The chosen direction is **Protocol Console**: a compact console with mode switching, AI training context, validation, loading, and clear routing after success.

## Scope

In scope:

- Add a new `auth` feature under `lib/features/auth/`.
- Build one auth screen that supports login and registration modes.
- Implement local mock auth state with Riverpod.
- Validate form inputs locally.
- Show loading and error states.
- Route login success to dashboard.
- Route registration success to goal selection.
- Wire the existing welcome screen `Sign In` prompt to auth.
- Reuse existing design system and shared widgets.

Out of scope:

- Real backend authentication.
- Secure credential storage.
- Social login.
- Password reset.
- New Flutter packages.

## User Flow

1. From welcome, tapping `Sign In` opens `AppRoutes.auth`.
2. Auth screen defaults to login mode.
3. User can switch between login and registration with a segmented pill control.
4. Login requires email and password.
5. Registration requires name, email, and password.
6. Invalid fields show inline validation errors.
7. Submit shows a brief loading state.
8. Login success routes to `AppRoutes.dashboard`.
9. Registration success routes to `AppRoutes.goalSelection`.

## Visual Direction

The screen uses the existing ForgeAI light theme:

- Background: `AppColors.warmIvory`.
- Main console: `AppCard` on white with subtle border/shadow.
- Primary CTA: `AppButton`.
- Accent: `AppColors.sportOrange`.
- Supporting accents: `AppColors.aiBlue`, `AppColors.success`, and `AppColors.energy` only where useful.
- Typography: `AppTypography`.
- Spacing: `AppSpacing`.

The auth screen should avoid a plain stacked form by including a small AI protocol panel above or beside the form content. On mobile, this panel appears above the form inside the scrollable console. It can show static local mock information such as:

- Protocol status.
- Goal fit percentage.
- AI readiness note.
- Privacy or local mock signal.

The copy should sound product-specific, for example:

- Login: `Resume adaptive plan`.
- Register: `Create athlete profile`.
- Header: `Secure your training protocol`.

## Architecture

Add:

- `lib/features/auth/screens/auth_screen.dart`
- `lib/features/auth/providers/auth_provider.dart`
- `lib/features/auth/widgets/auth_mode_switcher.dart`
- `lib/features/auth/widgets/auth_protocol_panel.dart`
- `lib/features/auth/widgets/auth_form.dart`
- Additional private helper widgets only where they keep files under the project line limits.

Existing files to update:

- `lib/core/router/app_router.dart`
- `lib/features/onboarding/widgets/welcome/welcome_content.dart`

Routing changes:

- Add `AppRoutes.auth = '/auth'`.
- Add a `GoRoute` for `AuthScreen`.
- Update welcome `Sign In` tap handler to navigate to `AppRoutes.auth`.

## State Management

Use Riverpod with feature-local provider state.

State should include:

- Current mode: login or register.
- Loading flag.
- Optional error message.

The provider exposes methods for:

- Switching mode.
- Submitting login.
- Submitting registration.
- Clearing errors when mode changes.

The widget layer must call notifier methods and avoid direct business state mutation.

## Validation

Validation rules:

- Name: required for registration.
- Email: required and must contain `@`.
- Password: required and minimum 6 characters.

Errors should be visible near the relevant form fields or as a clear form-level message. Errors must not be swallowed silently.

## Component Reuse

Before creating new shared widgets, reuse:

- `AppButton`
- `AppCard`
- `AppColors`
- `AppTypography`
- `AppSpacing`

Auth-specific widgets remain inside `features/auth/widgets/` because they are currently used by one feature. If the same field or segmented control is needed by another feature later, it should be promoted to `shared/widgets/`.

## Testing And Verification

Final verification must use the project gate:

```bash
./tool/check.sh
```

Expected checks:

- Flutter analyzer has no errors or warnings.
- Custom ForgeAI lint passes.
- Formatting check passes.

Manual verification:

- Welcome `Sign In` opens auth.
- Login mode validates email and password.
- Registration mode validates name, email, and password.
- Login success routes to dashboard.
- Registration success routes to goal selection.
- Compact height devices can scroll without clipped controls.

## Open Decisions Resolved

- Auth level: local mock auth.
- Visual direction: Protocol Console.
- Post-submit flow: login to dashboard, registration to goal selection.
- Registration fields: name, email, password.
