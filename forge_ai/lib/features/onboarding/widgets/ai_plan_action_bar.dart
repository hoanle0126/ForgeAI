import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/router/app_router.dart';
import 'package:forge_ai/shared/widgets/app_button.dart';
import 'package:go_router/go_router.dart';

class AiPlanActionBar extends StatelessWidget {
  const AiPlanActionBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppSpacing.lg,
        right: AppSpacing.lg,
        bottom: AppSpacing.xl,
        top: AppSpacing.base,
      ),
      child: AppButton(
        text: 'LET\'S START!',
        trailingIcon: Icons.bolt,
        onPressed: () => context.go(AppRoutes.dashboard),
      ),
    );
  }
}
