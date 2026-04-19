import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/auth/providers/auth_provider.dart';

class AuthModePrompt extends StatelessWidget {
  const AuthModePrompt({
    super.key,
    required this.mode,
    required this.onPressed,
    required this.isEnabled,
  });

  final AuthMode mode;
  final VoidCallback onPressed;
  final bool isEnabled;

  bool get _isRegister => mode == AuthMode.register;

  @override
  Widget build(BuildContext context) {
    final baseStyle = AppTypography.bodySemiBold.copyWith(
      color: AppColors.textDark,
    );
    final actionStyle = baseStyle.copyWith(color: AppColors.sportOrange);

    return TextButton(
      onPressed: isEnabled ? onPressed : null,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: baseStyle,
          children: [
            TextSpan(
              text: _isRegister ? 'Already have a protocol? ' : 'New athlete? ',
            ),
            TextSpan(
              text: _isRegister ? 'Sign in' : 'Create profile',
              style: actionStyle,
            ),
          ],
        ),
      ),
    );
  }
}
