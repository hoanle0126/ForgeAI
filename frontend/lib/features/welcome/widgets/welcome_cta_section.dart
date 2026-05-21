import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/router/app_router.dart';
import 'package:forge_ai/shared/widgets/app_button.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class WelcomeCtaSection extends StatelessWidget {
  const WelcomeCtaSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppButton(
          text: 'Start Your Journey',
          icon: PhosphorIconsBold.lightning,
          onPressed: () => context.go(AppRoutes.authRegister),
        ),
        const SizedBox(height: AppSpacing.base),
        AppButton(
          text: 'Sign In',
          variant: AppButtonVariant.outline,
          onPressed: () => context.go(AppRoutes.authLogin),
        ),
      ],
    );
  }
}
