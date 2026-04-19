import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/core/router/app_router.dart';
import 'package:forge_ai/shared/widgets/app_button.dart';
import 'package:go_router/go_router.dart';

class WelcomeContent extends StatelessWidget {
  const WelcomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.xl,
          0,
          AppSpacing.xl,
          AppSpacing.lg,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to\nthe future\nof training.',
              style: AppTypography.h1.copyWith(
                fontSize: 48,
                height: 1.05,
                letterSpacing: -2,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Padding(
              padding: const EdgeInsets.only(right: AppSpacing.lg),
              child: Text(
                'Your personal AI coach is ready to build a hyper-optimized plan to crush your goals.',
                style: AppTypography.bodyLarge.copyWith(height: 1.5),
              ),
            ),
            const Spacer(),
            AppButton(
              text: 'Get Started',
              onPressed: () => context.push(AppRoutes.goalSelection),
            ),
            const SizedBox(height: AppSpacing.lg),
            const _SignInPrompt(),
            const Spacer(),
            Center(
              child: Text(
                'PRECISION PROTOCOL V1.0.4',
                style: AppTypography.labelUppercase.copyWith(letterSpacing: 2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SignInPrompt extends StatelessWidget {
  const _SignInPrompt();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Already have an account? ', style: AppTypography.bodyMedium),
        GestureDetector(
          onTap: () {},
          child: Text(
            'Sign In',
            style: AppTypography.bodySemiBold.copyWith(
              color: AppColors.sportOrange,
            ),
          ),
        ),
      ],
    );
  }
}
