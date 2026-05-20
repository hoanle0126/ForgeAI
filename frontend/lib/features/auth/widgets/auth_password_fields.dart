import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/auth/widgets/auth_text_field.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AuthPasswordFields extends StatelessWidget {
  const AuthPasswordFields({
    super.key,
    required this.isRegister,
    required this.passwordController,
    required this.confirmPasswordController,
    this.passwordError,
    this.confirmPasswordError,
  });

  final bool isRegister;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final String? passwordError;
  final String? confirmPasswordError;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: AppSpacing.base),
        AuthTextField(
          label: 'Password',
          hint: 'Minimum 6 characters',
          controller: passwordController,
          errorText: passwordError,
          obscureText: true,
          icon: PhosphorIcons.lockKey(),
        ),
        if (isRegister) ...[
          const SizedBox(height: AppSpacing.base),
          AuthTextField(
            label: 'Confirm Password',
            hint: 'Repeat password',
            controller: confirmPasswordController,
            errorText: confirmPasswordError,
            obscureText: true,
            icon: PhosphorIcons.shieldCheck(),
          ),
        ],
      ],
    );
  }
}
