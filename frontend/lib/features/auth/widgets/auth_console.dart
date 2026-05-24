import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/auth/providers/auth_provider.dart';
import 'package:forge_ai/features/auth/widgets/auth_form.dart';
import 'package:forge_ai/features/auth/widgets/auth_mode_switcher.dart';
import 'package:forge_ai/features/auth/widgets/auth_protocol_panel.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';

class AuthConsole extends StatelessWidget {
  const AuthConsole({
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
    required this.onModeChanged,
    required this.onSubmit,
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
  final ValueChanged<AuthMode> onModeChanged;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    final isResetFlow =
        state.mode == AuthMode.forgotPassword ||
        state.mode == AuthMode.forgotPasswordSuccess;

    return AppCard(
      padding: const EdgeInsets.all(AppSpacing.base),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (!isResetFlow) ...[
            AuthModeSwitcher(mode: state.mode, onChanged: onModeChanged),
            const SizedBox(height: AppSpacing.base),
          ],
          const AuthProtocolPanel(),
          const SizedBox(height: AppSpacing.lg),
          AuthForm(
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
            onSubmit: onSubmit,
            onSwitchMode: onModeChanged,
          ),
        ],
      ),
    );
  }
}
