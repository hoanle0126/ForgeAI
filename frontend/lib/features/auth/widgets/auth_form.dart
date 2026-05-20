import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/auth/providers/auth_provider.dart';
import 'package:forge_ai/features/auth/widgets/auth_form_copy.dart';
import 'package:forge_ai/features/auth/widgets/auth_password_fields.dart';
import 'package:forge_ai/features/auth/widgets/auth_registration_fields.dart';
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
    required this.selectedGender,
    required this.selectedDateOfBirth,
    required this.onGenderChanged,
    required this.onDateOfBirthChanged,
    required this.onSubmit,
    required this.onSwitchMode,
  });

  final AuthState state;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final String selectedGender;
  final DateTime selectedDateOfBirth;
  final ValueChanged<String> onGenderChanged;
  final ValueChanged<DateTime> onDateOfBirthChanged;
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(state.mode.formTitle, style: AppTypography.h2),
        const SizedBox(height: AppSpacing.sm),
        Text(
          state.mode.description,
          style: AppTypography.bodyMedium.copyWith(height: 1.5),
        ),
        const SizedBox(height: AppSpacing.lg),
        if (_isRegister) ...[
          AuthRegistrationFields(
            nameController: nameController,
            nameError: state.fieldErrors['name'],
            selectedGender: selectedGender,
            selectedDateOfBirth: selectedDateOfBirth,
            onGenderChanged: onGenderChanged,
            onDateOfBirthChanged: onDateOfBirthChanged,
          ),
        ],
        AuthTextField(
          label: 'Email',
          hint: 'athlete@forge.ai',
          controller: emailController,
          errorText: state.fieldErrors['email'],
          keyboardType: TextInputType.emailAddress,
          icon: PhosphorIcons.envelopeSimple(),
        ),
        if (!_isForgotPassword)
          AuthPasswordFields(
            isRegister: _isRegister,
            passwordController: passwordController,
            confirmPasswordController: confirmPasswordController,
            passwordError: state.fieldErrors['password'],
            confirmPasswordError: state.fieldErrors['confirmPassword'],
          ),
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
          actionText: state.mode.submitAction,
          onSubmit: onSubmit,
          onSwitchMode: onSwitchMode,
        ),
      ],
    );
  }
}
