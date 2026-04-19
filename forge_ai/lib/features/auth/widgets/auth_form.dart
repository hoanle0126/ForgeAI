import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/auth/providers/auth_provider.dart';
import 'package:forge_ai/features/auth/widgets/auth_submit_section.dart';
import 'package:forge_ai/features/auth/widgets/auth_success_view.dart';
import 'package:forge_ai/features/auth/widgets/auth_text_field.dart';
import 'package:forge_ai/features/auth/widgets/forgot_password_button.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({
    super.key,
    required this.state,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.onSubmit,
    required this.onSwitchMode,
  });

  final AuthState state;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final VoidCallback onSubmit;
  final ValueChanged<AuthMode> onSwitchMode;

  bool get _isRegister => state.mode == AuthMode.register;
  bool get _isForgotPassword => state.mode == AuthMode.forgotPassword;
  bool get _isSuccess => state.mode == AuthMode.forgotPasswordSuccess;

  @override
  Widget build(BuildContext context) {
    if (_isSuccess) {
      return AuthSuccessView(onSwitchMode: onSwitchMode);
    }

    final title = _isForgotPassword
        ? 'Reset access key'
        : _isRegister
        ? 'Create athlete profile'
        : 'Resume adaptive plan';
    final action = _isForgotPassword
        ? 'Send reset link'
        : _isRegister
        ? 'Create profile'
        : 'Sign in';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title, style: AppTypography.h2),
        const SizedBox(height: AppSpacing.sm),
        Text(
          _description,
          style: AppTypography.bodyMedium.copyWith(height: 1.5),
        ),
        const SizedBox(height: AppSpacing.lg),
        if (_isRegister) ...[
          AuthTextField(
            label: 'Name',
            hint: 'Ari Nguyen',
            controller: nameController,
            errorText: state.fieldErrors['name'],
            icon: PhosphorIcons.user(),
          ),
          const SizedBox(height: AppSpacing.base),
        ],
        AuthTextField(
          label: 'Email',
          hint: 'athlete@forge.ai',
          controller: emailController,
          errorText: state.fieldErrors['email'],
          keyboardType: TextInputType.emailAddress,
          icon: PhosphorIcons.envelopeSimple(),
        ),
        if (!_isForgotPassword) ...[
          const SizedBox(height: AppSpacing.base),
          AuthTextField(
            label: 'Password',
            hint: 'Minimum 6 characters',
            controller: passwordController,
            errorText: state.fieldErrors['password'],
            obscureText: true,
            icon: PhosphorIcons.lockKey(),
          ),
        ],
        if (_isRegister) ...[
          const SizedBox(height: AppSpacing.base),
          AuthTextField(
            label: 'Confirm Password',
            hint: 'Repeat password',
            controller: confirmPasswordController,
            errorText: state.fieldErrors['confirmPassword'],
            obscureText: true,
            icon: PhosphorIcons.shieldCheck(),
          ),
        ],
        if (!_isRegister && !_isForgotPassword) ...[
          const SizedBox(height: AppSpacing.sm),
          ForgotPasswordButton(
            isEnabled: !state.isLoading,
            onPressed: () => onSwitchMode(AuthMode.forgotPassword),
          ),
        ],
        const SizedBox(height: AppSpacing.lg),
        AuthSubmitSection(
          state: state,
          actionText: action,
          onSubmit: onSubmit,
          onSwitchMode: onSwitchMode,
        ),
      ],
    );
  }

  String get _description {
    if (_isForgotPassword) {
      return 'Enter your email to receive a secure reset link.';
    }
    if (_isRegister) {
      return 'Start with a local profile, then ForgeAI will build the plan.';
    }
    return 'Return to your readiness dashboard and today\'s training block.';
  }
}
