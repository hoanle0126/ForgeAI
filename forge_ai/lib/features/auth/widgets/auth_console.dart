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
    required this.passwordController,
    required this.confirmPasswordController,
    required this.onModeChanged,
    required this.onSubmit,
    required this.onToggleMode,
  });

  final AuthState state;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final ValueChanged<AuthMode> onModeChanged;
  final VoidCallback onSubmit;
  final VoidCallback onToggleMode;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(AppSpacing.base),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AuthModeSwitcher(mode: state.mode, onChanged: onModeChanged),
          const SizedBox(height: AppSpacing.base),
          const AuthProtocolPanel(),
          const SizedBox(height: AppSpacing.lg),
          AuthForm(
            state: state,
            nameController: nameController,
            emailController: emailController,
            passwordController: passwordController,
            confirmPasswordController: confirmPasswordController,
            onSubmit: onSubmit,
            onToggleMode: onToggleMode,
          ),
        ],
      ),
    );
  }
}
