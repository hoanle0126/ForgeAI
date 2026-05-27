import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/auth/providers/auth_provider.dart';
import 'package:forge_ai/features/auth/widgets/auth_form_copy.dart';
import 'package:forge_ai/features/auth/widgets/auth_form_fields.dart';
import 'package:forge_ai/features/auth/widgets/auth_submit_section.dart';
import 'package:forge_ai/features/auth/widgets/auth_success_view.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({
    super.key,
    required this.state,
    required this.nameController,
    required this.emailController,
    required this.otpController,
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
  final TextEditingController otpController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final String selectedGender;
  final DateTime selectedDateOfBirth;
  final ValueChanged<String> onGenderChanged;
  final ValueChanged<DateTime> onDateOfBirthChanged;
  final VoidCallback onSubmit;
  final ValueChanged<AuthMode> onSwitchMode;

  @override
  Widget build(BuildContext context) {
    final mode = state.mode;
    if (mode == AuthMode.forgotPasswordSuccess) {
      return AuthSuccessView(onSwitchMode: onSwitchMode);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(mode.formTitle, style: AppTypography.h2),
        const SizedBox(height: AppSpacing.sm),
        Text(
          mode.description,
          style: AppTypography.bodyMedium.copyWith(height: 1.5),
        ),
        const SizedBox(height: AppSpacing.lg),
        AuthFormFields(
          state: state,
          nameController: nameController,
          emailController: emailController,
          otpController: otpController,
          passwordController: passwordController,
          confirmPasswordController: confirmPasswordController,
          selectedGender: selectedGender,
          selectedDateOfBirth: selectedDateOfBirth,
          onGenderChanged: onGenderChanged,
          onDateOfBirthChanged: onDateOfBirthChanged,
          onSwitchMode: onSwitchMode,
        ),
        const SizedBox(height: AppSpacing.lg),
        AuthSubmitSection(
          state: state,
          actionText: mode.submitAction,
          onSubmit: onSubmit,
          onSwitchMode: onSwitchMode,
        ),
      ],
    );
  }
}
