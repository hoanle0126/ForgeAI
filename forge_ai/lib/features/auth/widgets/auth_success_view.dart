import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/auth/providers/auth_provider.dart';
import 'package:forge_ai/shared/widgets/app_button.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AuthSuccessView extends StatelessWidget {
  const AuthSuccessView({super.key, required this.onSwitchMode});

  final ValueChanged<AuthMode> onSwitchMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Icon(
          PhosphorIcons.checkCircle(PhosphorIconsStyle.fill),
          color: AppColors.success,
          size: 64,
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          'Check your inbox',
          style: AppTypography.h2,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'We\'ve sent an encrypted link to reset your access key.',
          style: AppTypography.bodyMedium.copyWith(height: 1.5),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.xl),
        AppButton(
          text: 'Return to sign in',
          onPressed: () => onSwitchMode(AuthMode.login),
        ),
      ],
    );
  }
}
