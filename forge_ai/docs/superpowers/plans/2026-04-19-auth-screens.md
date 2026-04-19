# Auth Screens Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build ForgeAI login and registration screens with local mock auth, polished Protocol Console UI, validation, loading states, and correct routing.

**Architecture:** Add a feature-local `auth` module using Riverpod `NotifierProvider` for local state and focused widgets for the protocol panel, mode switcher, and form. The screen owns `TextEditingController`s, delegates submit behavior to the provider, and routes after successful mock auth. Existing shared widgets and design tokens remain the visual source of truth.

**Tech Stack:** Flutter, flutter_riverpod, go_router, existing ForgeAI design system, flutter_test.

---

## File Structure

- Create `lib/features/auth/providers/auth_provider.dart`: auth mode enum, state object, validation result, and local mock notifier methods.
- Create `test/features/auth/providers/auth_provider_test.dart`: focused provider tests for mode switching, validation, loading, and success results.
- Create `lib/features/auth/widgets/auth_mode_switcher.dart`: segmented login/register control.
- Create `lib/features/auth/widgets/auth_protocol_panel.dart`: static AI protocol card for non-basic visual depth.
- Create `lib/features/auth/widgets/auth_form.dart`: form fields, inline errors, submit CTA, and footer prompt.
- Create `lib/features/auth/screens/auth_screen.dart`: responsive screen layout, controller lifecycle, provider calls, and navigation.
- Modify `lib/core/router/app_router.dart`: add auth route and import.
- Modify `lib/features/onboarding/widgets/welcome/welcome_content.dart`: wire `Sign In` to `AppRoutes.auth`.

## Task 1: Auth Provider And Tests

**Files:**
- Create: `lib/features/auth/providers/auth_provider.dart`
- Create: `test/features/auth/providers/auth_provider_test.dart`

- [ ] **Step 1: Write failing provider tests**

Create `test/features/auth/providers/auth_provider_test.dart`:

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/features/auth/providers/auth_provider.dart';

void main() {
  group('AuthNotifier', () {
    test('defaults to login mode with idle state', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final state = container.read(authProvider);

      expect(state.mode, AuthMode.login);
      expect(state.isLoading, isFalse);
      expect(state.errorMessage, isNull);
    });

    test('switchMode updates mode and clears errors', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final notifier = container.read(authProvider.notifier);

      notifier.validateLogin(email: 'bad', password: '');
      notifier.switchMode(AuthMode.register);
      final state = container.read(authProvider);

      expect(state.mode, AuthMode.register);
      expect(state.errorMessage, isNull);
      expect(state.fieldErrors, isEmpty);
    });

    test('validateLogin reports email and password errors', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final notifier = container.read(authProvider.notifier);

      final result = notifier.validateLogin(email: 'bad', password: '123');

      expect(result.isValid, isFalse);
      expect(result.fieldErrors['email'], 'Enter a valid email.');
      expect(result.fieldErrors['password'], 'Use at least 6 characters.');
    });

    test('validateRegistration reports name, email, and password errors', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final notifier = container.read(authProvider.notifier);

      final result = notifier.validateRegistration(
        name: ' ',
        email: 'bad',
        password: '123',
      );

      expect(result.isValid, isFalse);
      expect(result.fieldErrors['name'], 'Enter your name.');
      expect(result.fieldErrors['email'], 'Enter a valid email.');
      expect(result.fieldErrors['password'], 'Use at least 6 characters.');
    });

    test('submitLogin returns success and clears loading', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final notifier = container.read(authProvider.notifier);

      final result = await notifier.submitLogin(
        email: 'athlete@forge.ai',
        password: 'strongpass',
      );

      expect(result, AuthSubmitResult.success);
      expect(container.read(authProvider).isLoading, isFalse);
      expect(container.read(authProvider).errorMessage, isNull);
    });

    test('submitRegistration returns success and stores display name', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final notifier = container.read(authProvider.notifier);

      final result = await notifier.submitRegistration(
        name: 'Ari Nguyen',
        email: 'ari@forge.ai',
        password: 'strongpass',
      );

      final state = container.read(authProvider);
      expect(result, AuthSubmitResult.success);
      expect(state.displayName, 'Ari Nguyen');
      expect(state.isLoading, isFalse);
    });
  });
}
```

- [ ] **Step 2: Run tests and verify failure**

Run:

```bash
flutter test test/features/auth/providers/auth_provider_test.dart
```

Expected: FAIL because `features/auth/providers/auth_provider.dart` does not exist.

- [ ] **Step 3: Implement provider**

Create `lib/features/auth/providers/auth_provider.dart`:

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AuthMode { login, register }

enum AuthSubmitResult { success, invalid }

class AuthValidationResult {
  const AuthValidationResult(this.fieldErrors);

  final Map<String, String> fieldErrors;

  bool get isValid => fieldErrors.isEmpty;
}

class AuthState {
  const AuthState({
    this.mode = AuthMode.login,
    this.isLoading = false,
    this.errorMessage,
    this.fieldErrors = const {},
    this.displayName,
  });

  final AuthMode mode;
  final bool isLoading;
  final String? errorMessage;
  final Map<String, String> fieldErrors;
  final String? displayName;

  AuthState copyWith({
    AuthMode? mode,
    bool? isLoading,
    String? errorMessage,
    Map<String, String>? fieldErrors,
    String? displayName,
    bool clearError = false,
  }) {
    return AuthState(
      mode: mode ?? this.mode,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
      fieldErrors: fieldErrors ?? this.fieldErrors,
      displayName: displayName ?? this.displayName,
    );
  }
}

class AuthNotifier extends Notifier<AuthState> {
  static const _mockDelay = Duration(milliseconds: 450);

  @override
  AuthState build() => const AuthState();

  void switchMode(AuthMode mode) {
    state = state.copyWith(
      mode: mode,
      isLoading: false,
      fieldErrors: {},
      clearError: true,
    );
  }

  AuthValidationResult validateLogin({
    required String email,
    required String password,
  }) {
    final errors = <String, String>{};
    if (!_isValidEmail(email)) {
      errors['email'] = 'Enter a valid email.';
    }
    if (password.trim().length < 6) {
      errors['password'] = 'Use at least 6 characters.';
    }
    final result = AuthValidationResult(errors);
    state = state.copyWith(fieldErrors: errors, clearError: true);
    return result;
  }

  AuthValidationResult validateRegistration({
    required String name,
    required String email,
    required String password,
  }) {
    final errors = <String, String>{};
    if (name.trim().isEmpty) {
      errors['name'] = 'Enter your name.';
    }
    if (!_isValidEmail(email)) {
      errors['email'] = 'Enter a valid email.';
    }
    if (password.trim().length < 6) {
      errors['password'] = 'Use at least 6 characters.';
    }
    final result = AuthValidationResult(errors);
    state = state.copyWith(fieldErrors: errors, clearError: true);
    return result;
  }

  Future<AuthSubmitResult> submitLogin({
    required String email,
    required String password,
  }) async {
    final validation = validateLogin(email: email, password: password);
    if (!validation.isValid) {
      state = state.copyWith(
        errorMessage: 'Check your credentials and try again.',
      );
      return AuthSubmitResult.invalid;
    }

    state = state.copyWith(isLoading: true, clearError: true);
    await Future<void>.delayed(_mockDelay);
    state = state.copyWith(isLoading: false, fieldErrors: {}, clearError: true);
    return AuthSubmitResult.success;
  }

  Future<AuthSubmitResult> submitRegistration({
    required String name,
    required String email,
    required String password,
  }) async {
    final validation = validateRegistration(
      name: name,
      email: email,
      password: password,
    );
    if (!validation.isValid) {
      state = state.copyWith(errorMessage: 'Complete your athlete profile.');
      return AuthSubmitResult.invalid;
    }

    state = state.copyWith(isLoading: true, clearError: true);
    await Future<void>.delayed(_mockDelay);
    state = state.copyWith(
      isLoading: false,
      fieldErrors: {},
      displayName: name.trim(),
      clearError: true,
    );
    return AuthSubmitResult.success;
  }

  bool _isValidEmail(String value) {
    final trimmed = value.trim();
    return trimmed.contains('@') && trimmed.indexOf('@') > 0;
  }
}

final authProvider = NotifierProvider<AuthNotifier, AuthState>(
  AuthNotifier.new,
);
```

- [ ] **Step 4: Run provider tests and verify pass**

Run:

```bash
flutter test test/features/auth/providers/auth_provider_test.dart
```

Expected: PASS.

- [ ] **Step 5: Commit provider and tests**

```bash
git add lib/features/auth/providers/auth_provider.dart test/features/auth/providers/auth_provider_test.dart
git commit -m "feat(auth): add local auth provider"
```

## Task 2: Auth Widgets

**Files:**
- Create: `lib/features/auth/widgets/auth_mode_switcher.dart`
- Create: `lib/features/auth/widgets/auth_protocol_panel.dart`
- Create: `lib/features/auth/widgets/auth_form.dart`

- [ ] **Step 1: Create mode switcher**

Create `lib/features/auth/widgets/auth_mode_switcher.dart`:

```dart
import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/auth/providers/auth_provider.dart';

class AuthModeSwitcher extends StatelessWidget {
  const AuthModeSwitcher({
    super.key,
    required this.mode,
    required this.onChanged,
  });

  final AuthMode mode;
  final ValueChanged<AuthMode> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xs),
      decoration: BoxDecoration(
        color: AppColors.inputBg,
        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
      ),
      child: Row(
        children: [
          _ModeButton(
            label: 'Sign in',
            isSelected: mode == AuthMode.login,
            onTap: () => onChanged(AuthMode.login),
          ),
          _ModeButton(
            label: 'Register',
            isSelected: mode == AuthMode.register,
            onTap: () => onChanged(AuthMode.register),
          ),
        ],
      ),
    );
  }
}

class _ModeButton extends StatelessWidget {
  const _ModeButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: AppColors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            height: 44,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.cardWhite : AppColors.transparent,
              borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: AppColors.textDark.withValues(alpha: 0.06),
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ]
                  : null,
            ),
            child: Text(
              label,
              style: AppTypography.bodySemiBold.copyWith(
                color: isSelected ? AppColors.textDark : AppColors.textMuted,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

- [ ] **Step 2: Create protocol panel**

Create `lib/features/auth/widgets/auth_protocol_panel.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';

class AuthProtocolPanel extends StatelessWidget {
  const AuthProtocolPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSpacing.cardPadding,
      decoration: BoxDecoration(
        color: AppColors.textDark,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                PhosphorIcons.sparkle(PhosphorIconsStyle.fill),
                color: AppColors.energy,
                size: 18,
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                'AI protocol',
                style: AppTypography.labelUppercase.copyWith(
                  color: AppColors.cardWhite,
                  letterSpacing: 1,
                ),
              ),
              const Spacer(),
              _StatusPill(label: 'LOCAL MOCK'),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'Secure your training protocol.',
            style: AppTypography.h3.copyWith(color: AppColors.cardWhite),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'ForgeAI keeps the entry flow light while preparing your adaptive plan handoff.',
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.cardWhite.withValues(alpha: 0.72),
              height: 1.5,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          _MetricRow(label: 'Goal fit', value: '92%', percent: 0.92),
          const SizedBox(height: AppSpacing.md),
          _MetricRow(label: 'Readiness sync', value: 'Live', percent: 0.74),
        ],
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: AppColors.cardWhite.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
      ),
      child: Text(
        label,
        style: AppTypography.label.copyWith(
          color: AppColors.cardWhite,
          fontSize: 10,
        ),
      ),
    );
  }
}

class _MetricRow extends StatelessWidget {
  const _MetricRow({
    required this.label,
    required this.value,
    required this.percent,
  });

  final String label;
  final String value;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.cardWhite.withValues(alpha: 0.7),
              ),
            ),
            const Spacer(),
            Text(
              value,
              style: AppTypography.statSmall.copyWith(
                color: AppColors.cardWhite,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        LinearPercentIndicator(
          padding: EdgeInsets.zero,
          lineHeight: 7,
          percent: percent,
          barRadius: const Radius.circular(AppSpacing.radiusFull),
          backgroundColor: AppColors.cardWhite.withValues(alpha: 0.12),
          progressColor: AppColors.sportOrange,
        ),
      ],
    );
  }
}
```

- [ ] **Step 3: Create auth form**

Create `lib/features/auth/widgets/auth_form.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/auth/providers/auth_provider.dart';
import 'package:forge_ai/shared/widgets/app_button.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({
    super.key,
    required this.state,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.onSubmit,
    required this.onToggleMode,
  });

  final AuthState state;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onSubmit;
  final VoidCallback onToggleMode;

  bool get _isRegister => state.mode == AuthMode.register;

  @override
  Widget build(BuildContext context) {
    final title = _isRegister ? 'Create athlete profile' : 'Resume adaptive plan';
    final action = _isRegister ? 'Create profile' : 'Sign in';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title, style: AppTypography.h2),
        const SizedBox(height: AppSpacing.sm),
        Text(
          _isRegister
              ? 'Start with a clean local profile, then ForgeAI will build the plan.'
              : 'Return to your readiness dashboard and today\\'s training block.',
          style: AppTypography.bodyMedium.copyWith(height: 1.5),
        ),
        const SizedBox(height: AppSpacing.lg),
        if (_isRegister) ...[
          _AuthTextField(
            label: 'Name',
            hint: 'Ari Nguyen',
            controller: nameController,
            errorText: state.fieldErrors['name'],
            icon: PhosphorIcons.user(),
          ),
          const SizedBox(height: AppSpacing.base),
        ],
        _AuthTextField(
          label: 'Email',
          hint: 'athlete@forge.ai',
          controller: emailController,
          errorText: state.fieldErrors['email'],
          keyboardType: TextInputType.emailAddress,
          icon: PhosphorIcons.envelopeSimple(),
        ),
        const SizedBox(height: AppSpacing.base),
        _AuthTextField(
          label: 'Password',
          hint: 'Minimum 6 characters',
          controller: passwordController,
          errorText: state.fieldErrors['password'],
          obscureText: true,
          icon: PhosphorIcons.lockKey(),
        ),
        if (state.errorMessage != null) ...[
          const SizedBox(height: AppSpacing.md),
          Text(
            state.errorMessage!,
            style: AppTypography.bodySmall.copyWith(color: AppColors.sportOrange),
          ),
        ],
        const SizedBox(height: AppSpacing.lg),
        AppButton(
          text: action,
          onPressed: state.isLoading ? null : onSubmit,
          isLoading: state.isLoading,
          trailingIcon: PhosphorIcons.arrowRight(),
        ),
        const SizedBox(height: AppSpacing.base),
        Center(
          child: TextButton(
            onPressed: state.isLoading ? null : onToggleMode,
            child: Text(
              _isRegister
                  ? 'Already have a protocol? Sign in'
                  : 'New athlete? Create profile',
              style: AppTypography.bodySemiBold.copyWith(
                color: AppColors.sportOrange,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _AuthTextField extends StatelessWidget {
  const _AuthTextField({
    required this.label,
    required this.hint,
    required this.controller,
    required this.icon,
    this.errorText,
    this.keyboardType,
    this.obscureText = false,
  });

  final String label;
  final String hint;
  final TextEditingController controller;
  final IconData icon;
  final String? errorText;
  final TextInputType? keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.labelUppercase.copyWith(
            color: AppColors.textDark,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          style: AppTypography.bodySemiBold.copyWith(color: AppColors.textDark),
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: AppColors.textDisabled, size: 20),
            hintText: hint,
            hintStyle: AppTypography.bodyMedium.copyWith(
              color: AppColors.textDisabled,
            ),
            filled: true,
            fillColor: AppColors.inputBg,
            errorText: errorText,
            errorStyle: AppTypography.bodySmall.copyWith(
              color: AppColors.sportOrange,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              borderSide: const BorderSide(color: AppColors.sportOrange),
            ),
          ),
        ),
      ],
    );
  }
}
```

- [ ] **Step 4: Format widgets**

Run:

```bash
dart format lib/features/auth/widgets
```

Expected: formats all three widget files.

- [ ] **Step 5: Commit widgets**

```bash
git add lib/features/auth/widgets
git commit -m "feat(auth): add protocol console widgets"
```

## Task 3: Auth Screen And Routing

**Files:**
- Create: `lib/features/auth/screens/auth_screen.dart`
- Modify: `lib/core/router/app_router.dart`
- Modify: `lib/features/onboarding/widgets/welcome/welcome_content.dart`

- [ ] **Step 1: Create auth screen**

Create `lib/features/auth/screens/auth_screen.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/core/router/app_router.dart';
import 'package:forge_ai/features/auth/providers/auth_provider.dart';
import 'package:forge_ai/features/auth/widgets/auth_form.dart';
import 'package:forge_ai/features/auth/widgets/auth_mode_switcher.dart';
import 'package:forge_ai/features/auth/widgets/auth_protocol_panel.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authProvider);

    return Scaffold(
      backgroundColor: AppColors.warmIvory,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppSpacing.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: AppSpacing.lg),
              const _AuthHeader(),
              const SizedBox(height: AppSpacing.lg),
              AppCard(
                padding: const EdgeInsets.all(AppSpacing.base),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AuthModeSwitcher(
                      mode: state.mode,
                      onChanged: (mode) {
                        ref.read(authProvider.notifier).switchMode(mode);
                      },
                    ),
                    const SizedBox(height: AppSpacing.base),
                    const AuthProtocolPanel(),
                    const SizedBox(height: AppSpacing.lg),
                    AuthForm(
                      state: state,
                      nameController: _nameController,
                      emailController: _emailController,
                      passwordController: _passwordController,
                      onSubmit: _submit,
                      onToggleMode: _toggleMode,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.xxl),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _submit() async {
    final notifier = ref.read(authProvider.notifier);
    final mode = ref.read(authProvider).mode;

    if (mode == AuthMode.login) {
      final result = await notifier.submitLogin(
        email: _emailController.text,
        password: _passwordController.text,
      );
      if (mounted && result == AuthSubmitResult.success) {
        context.go(AppRoutes.dashboard);
      }
      return;
    }

    final result = await notifier.submitRegistration(
      name: _nameController.text,
      email: _emailController.text,
      password: _passwordController.text,
    );
    if (mounted && result == AuthSubmitResult.success) {
      context.go(AppRoutes.goalSelection);
    }
  }

  void _toggleMode() {
    final currentMode = ref.read(authProvider).mode;
    final nextMode = currentMode == AuthMode.login
        ? AuthMode.register
        : AuthMode.login;
    ref.read(authProvider.notifier).switchMode(nextMode);
  }
}

class _AuthHeader extends StatelessWidget {
  const _AuthHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(AppSpacing.sm),
          decoration: const BoxDecoration(
            color: AppColors.sportOrange,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.bolt_rounded,
            size: 18,
            color: AppColors.cardWhite,
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Text(
          'ForgeAI',
          style: AppTypography.labelUppercase.copyWith(
            color: AppColors.textDark,
            fontWeight: FontWeight.w800,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () => context.go(AppRoutes.splash),
          child: Text(
            'Back',
            style: AppTypography.bodySemiBold.copyWith(
              color: AppColors.textMuted,
            ),
          ),
        ),
      ],
    );
  }
}
```

- [ ] **Step 2: Add auth route**

Modify `lib/core/router/app_router.dart`:

```dart
import 'package:forge_ai/features/auth/screens/auth_screen.dart';
import 'package:forge_ai/features/dashboard/screens/home/dashboard_home_screen.dart';
import 'package:forge_ai/features/dashboard/screens/placeholder/placeholder_screen.dart';
import 'package:forge_ai/features/dashboard/screens/shell/dashboard_shell_screen.dart';
import 'package:forge_ai/features/onboarding/screens/ai_plan_preview/ai_plan_preview_screen.dart';
import 'package:forge_ai/features/onboarding/screens/body_profile/body_profile_screen.dart';
import 'package:forge_ai/features/onboarding/screens/equipment_selection/equipment_selection_screen.dart';
import 'package:forge_ai/features/onboarding/screens/goal_selection/goal_selection_screen.dart';
import 'package:forge_ai/features/onboarding/screens/schedule_preference/schedule_preference_screen.dart';
import 'package:forge_ai/features/onboarding/screens/welcome/welcome_screen.dart';
import 'package:go_router/go_router.dart';

abstract final class AppRoutes {
  static const splash = '/';
  static const auth = '/auth';
  static const goalSelection = '/goal-selection';
  static const equipmentSelection = '/equipment';
  static const bodyProfile = '/body-profile';
  static const schedulePreference = '/schedule';
  static const aiPlanPreview = '/ai-plan-preview';

  static const dashboard = '/dashboard';
  static const training = '/training';
  static const insights = '/insights';
  static const profile = '/profile';
}

final appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.auth,
      builder: (context, state) => const AuthScreen(),
    ),
    GoRoute(
      path: AppRoutes.goalSelection,
      builder: (context, state) => const GoalSelectionScreen(),
    ),
    GoRoute(
      path: AppRoutes.equipmentSelection,
      builder: (context, state) => const EquipmentSelectionScreen(),
    ),
    GoRoute(
      path: AppRoutes.bodyProfile,
      builder: (context, state) => const BodyProfileScreen(),
    ),
    GoRoute(
      path: AppRoutes.schedulePreference,
      builder: (context, state) => const SchedulePreferenceScreen(),
    ),
    GoRoute(
      path: AppRoutes.aiPlanPreview,
      builder: (context, state) => const AiPlanPreviewScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return DashboardShellScreen(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.dashboard,
              builder: (context, state) => const DashboardHomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.training,
              builder: (context, state) =>
                  const PlaceholderScreen(title: 'Training'),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.insights,
              builder: (context, state) =>
                  const PlaceholderScreen(title: 'Insights'),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.profile,
              builder: (context, state) =>
                  const PlaceholderScreen(title: 'Profile'),
            ),
          ],
        ),
      ],
    ),
  ],
);
```

- [ ] **Step 3: Wire welcome Sign In**

Modify the `_SignInPrompt` in `lib/features/onboarding/widgets/welcome/welcome_content.dart` so its tap handler navigates to auth:

```dart
class _SignInPrompt extends StatelessWidget {
  const _SignInPrompt();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text('Already have an account? ', style: AppTypography.bodyMedium),
        GestureDetector(
          onTap: () => context.push(AppRoutes.auth),
          child: Text(
            'Sign In',
            style: AppTypography.bodySemiBold.copyWith(
              color: AppColors.sportOrange,
            ),
          ),
        ),
      ],
    );
  }
}
```

- [ ] **Step 4: Format screen and routing files**

Run:

```bash
dart format lib/features/auth/screens/auth_screen.dart lib/core/router/app_router.dart lib/features/onboarding/widgets/welcome/welcome_content.dart
```

Expected: all files formatted.

- [ ] **Step 5: Commit screen and routing**

```bash
git add lib/features/auth/screens/auth_screen.dart lib/core/router/app_router.dart lib/features/onboarding/widgets/welcome/welcome_content.dart
git commit -m "feat(auth): wire protocol console screen"
```

## Task 4: Verification

**Files:**
- Read: `tool/check.sh`

- [ ] **Step 1: Run provider tests**

Run:

```bash
flutter test test/features/auth/providers/auth_provider_test.dart
```

Expected: PASS.

- [ ] **Step 2: Run project verification gate**

Run:

```bash
./tool/check.sh
```

Expected: `flutter analyze`, `dart run custom_lint`, and format check all pass with no errors or warnings.

- [ ] **Step 3: Fix any verification failures**

If formatting fails, run:

```bash
dart format lib test
```

If analyzer or custom lint fails, fix the exact reported files without unrelated refactors, then rerun:

```bash
./tool/check.sh
```

Expected: all checks pass.

- [ ] **Step 4: Commit verification fixes only if needed**

If Step 3 changed files, run:

```bash
git add <changed-files>
git commit -m "fix(auth): satisfy verification gate"
```

Expected: no commit is created if there were no verification fixes.

## Spec Coverage

- Local mock auth: Task 1.
- Login/register mode screen: Tasks 2 and 3.
- Protocol Console visual direction: Task 2.
- Login success to dashboard: Task 3.
- Registration success to goal selection: Task 3.
- Name/email/password registration fields: Task 2.
- Welcome Sign In wiring: Task 3.
- Verification with `./tool/check.sh`: Task 4.
