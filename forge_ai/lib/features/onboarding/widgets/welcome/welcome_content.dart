import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/core/router/app_router.dart';
import 'package:forge_ai/shared/widgets/app_button.dart';
import 'package:go_router/go_router.dart';

const double _compactContentHeight = 400;

class WelcomeContent extends StatelessWidget {
  const WelcomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isCompact = constraints.maxHeight < _compactContentHeight;
          final horizontalPadding = isCompact ? AppSpacing.lg : AppSpacing.xl;
          final content = Padding(
            padding: EdgeInsets.fromLTRB(
              horizontalPadding,
              0,
              horizontalPadding,
              AppSpacing.lg,
            ),
            child: _WelcomeContentBody(isCompact: isCompact),
          );

          if (isCompact) {
            return SingleChildScrollView(child: content);
          }

          return content;
        },
      ),
    );
  }
}

class _WelcomeContentBody extends StatelessWidget {
  const _WelcomeContentBody({required this.isCompact});

  final bool isCompact;

  @override
  Widget build(BuildContext context) {
    final titleSize = isCompact ? 40.0 : 48.0;
    final sectionGap = isCompact ? AppSpacing.base : AppSpacing.lg;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome to\nthe future\nof training.',
          style: AppTypography.h1.copyWith(fontSize: titleSize, height: 1.05),
        ),
        SizedBox(height: sectionGap),
        Padding(
          padding: const EdgeInsets.only(right: AppSpacing.lg),
          child: Text(
            'Your personal AI coach is ready to build a hyper-optimized plan to crush your goals.',
            style: AppTypography.bodyLarge.copyWith(height: 1.5),
          ),
        ),
        if (isCompact) SizedBox(height: sectionGap) else const Spacer(),
        AppButton(
          text: 'Get Started',
          onPressed: () => context.push(AppRoutes.authRegister),
        ),
        SizedBox(height: sectionGap),
        const _SignInPrompt(),
        if (isCompact) SizedBox(height: sectionGap) else const Spacer(),
        Center(
          child: Text(
            'PRECISION PROTOCOL V1.0.4',
            style: AppTypography.labelUppercase.copyWith(letterSpacing: 2),
          ),
        ),
      ],
    );
  }
}

class _SignInPrompt extends StatelessWidget {
  const _SignInPrompt();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text('Already have an account? ', style: AppTypography.bodyMedium),
        GestureDetector(
          onTap: () => context.push(AppRoutes.authLogin),
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
