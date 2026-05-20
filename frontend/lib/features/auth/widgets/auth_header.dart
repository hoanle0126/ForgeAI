import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/core/router/app_router.dart';
import 'package:go_router/go_router.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(AppSpacing.sm),
          decoration: const BoxDecoration(
            color: AppColors.sportOrange,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.bolt_rounded,
            size: 18,
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
        const Spacer(),
        TextButton(
          onPressed: () => context.go(AppRoutes.splash),
          child: Text(
            'Back',
            style: AppTypography.bodySemiBold.copyWith(
              color: AppColors.textMuted,
            ),
          ),
        ),
      ],
    );
  }
}
