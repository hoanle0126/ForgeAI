import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/core/router/app_router.dart';
import 'package:forge_ai/shared/widgets/app_button.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.warmIvory,
      body: SafeArea(
        child: Padding(
          padding: AppSpacing.screenPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(flex: 3),

              // Approximate Stylized F Logo
              const Center(
                child: Icon(
                  Icons.bolt_rounded,
                  size: 100,
                  color: AppColors.sportOrange,
                ),
              ),

              const SizedBox(height: AppSpacing.xl),

              // Headlines
              Text(
                'ForgeAI',
                textAlign: TextAlign.center,
                style: AppTypography.h1.copyWith(
                  fontSize: 48,
                  letterSpacing: -1.5,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'Your AI Coach Lives Here',
                textAlign: TextAlign.center,
                style: AppTypography.bodyLarge,
              ),

              const Spacer(flex: 4),

              // CTA
              AppButton(
                text: 'Get Started',
                onPressed: () {
                  context.push(AppRoutes.goalSelection);
                },
              ),

              const SizedBox(height: AppSpacing.lg),

              // Login Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: AppTypography.bodyMedium,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Sign In',
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.sportOrange,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              const Spacer(flex: 1),

              // Footer Protocol Version
              Text(
                'PRECISION PROTOCOL V1.0.4',
                textAlign: TextAlign.center,
                style: AppTypography.labelUppercase.copyWith(
                  letterSpacing: 3,
                  color: AppColors.textDisabled.withValues(alpha: 0.5),
                ),
              ),
              const SizedBox(height: AppSpacing.base),
            ],
          ),
        ),
      ),
    );
  }
}
