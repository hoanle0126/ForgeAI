import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';

class DashboardAccountAvatarButton extends StatelessWidget {
  const DashboardAccountAvatarButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'Open account sheet',
      child: Material(
        color: AppColors.transparent,
        shape: const CircleBorder(),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onTap,
          child: const Padding(
            padding: EdgeInsets.all(AppSpacing.xs),
            child: CircleAvatar(
              radius: AppSpacing.lg,
              backgroundImage: AssetImage('assets/images/avatar.png'),
              backgroundColor: AppColors.border,
            ),
          ),
        ),
      ),
    );
  }
}
