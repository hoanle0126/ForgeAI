import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/auth/providers/auth_provider.dart';
import 'package:forge_ai/features/auth/widgets/auth_mode_prompt.dart';
import 'package:forge_ai/shared/widgets/app_button.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AuthSubmitSection extends StatelessWidget {
  const AuthSubmitSection({
    super.key,
    required this.state,
    required this.actionText,
    required this.onSubmit,
    required this.onToggleMode,
  });

  final AuthState state;
  final String actionText;
  final VoidCallback onSubmit;
  final VoidCallback onToggleMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (state.errorMessage != null) ...[
          Text(
            state.errorMessage!,
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.sportOrange,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
        ],
        AppButton(
          text: actionText,
          onPressed: state.isLoading ? null : onSubmit,
          isLoading: state.isLoading,
          trailingIcon: PhosphorIcons.arrowRight(),
        ),
        const SizedBox(height: AppSpacing.base),
        Center(
          child: AuthModePrompt(
            mode: state.mode,
            isEnabled: !state.isLoading,
            onPressed: onToggleMode,
          ),
        ),
      ],
    );
  }
}
