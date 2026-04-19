import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';

class WelcomeHero extends StatelessWidget {
  const WelcomeHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/athletic_ai_hero.png',
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: 120,
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.warmIvory.withValues(alpha: 0),
                  AppColors.warmIvory,
                ],
              ),
            ),
          ),
        ),
        const SafeArea(bottom: false, child: _WelcomeBrandMark()),
      ],
    );
  }
}

class _WelcomeBrandMark extends StatelessWidget {
  const _WelcomeBrandMark();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.xs),
              decoration: const BoxDecoration(
                color: AppColors.sportOrange,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.bolt_rounded,
                size: 16,
                color: AppColors.cardWhite,
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Text(
              'ForgeAI',
              style: AppTypography.labelUppercase.copyWith(
                color: AppColors.textDark,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
