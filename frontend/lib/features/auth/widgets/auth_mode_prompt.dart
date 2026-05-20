import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/auth/providers/auth_provider.dart';

class AuthModePrompt extends StatelessWidget {
  const AuthModePrompt({
    super.key,
    required this.mode,
    required this.onSwitchMode,
    required this.isEnabled,
  });

  final AuthMode mode;
  final ValueChanged<AuthMode> onSwitchMode;
  final bool isEnabled;

  bool get _isRegister => mode == AuthMode.register;
  bool get _isForgotPassword => mode == AuthMode.forgotPassword;

  @override
  Widget build(BuildContext context) {
    final baseStyle = AppTypography.bodySemiBold.copyWith(
      color: AppColors.textDark,
    );
    final actionStyle = baseStyle.copyWith(color: AppColors.sportOrange);

    if (_isForgotPassword) {
      return TextButton(
        onPressed: isEnabled ? () => onSwitchMode(AuthMode.login) : null,
        child: Text(
          'Back to login',
          style: AppTypography.bodySemiBold.copyWith(
            color: AppColors.sportOrange,
          ),
        ),
      );
    }

    final targetMode = _isRegister ? AuthMode.login : AuthMode.register;

    return TextButton(
      onPressed: isEnabled ? () => onSwitchMode(targetMode) : null,
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
