import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class DashboardNotificationButton extends StatelessWidget {
  const DashboardNotificationButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'Open notifications',
      child: Material(
        color: AppColors.transparent,
        shape: const CircleBorder(),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onTap,
          child: SizedBox(
            width: AppSpacing.xxxl,
            height: AppSpacing.xxxl,
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.border),
                  color: AppColors.cardWhite,
                ),
                child: Icon(
                  PhosphorIcons.bell(PhosphorIconsStyle.fill),
                  color: AppColors.textDark,
                  size: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
