import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';

enum AppButtonVariant { primary, secondary, outline }

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.isLoading = false,
    this.isFullWidth = true,
    this.icon,
    this.trailingIcon,
  });

  final String text;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final bool isLoading;
  final bool isFullWidth;
  final IconData? icon;
  final IconData? trailingIcon;

  @override
  Widget build(BuildContext context) {
    final isDisabled = onPressed == null || isLoading;

    return Semantics(
      button: true,
      enabled: !isDisabled,
      child: Material(
        color: AppColors.transparent,
        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
        child: InkWell(
          onTap: isDisabled ? null : onPressed,
          borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
          child: Ink(
            width: isFullWidth ? double.infinity : null,
            height: 56,
            decoration: BoxDecoration(
              color: _getBackgroundColor(isDisabled),
              borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
              border: variant == AppButtonVariant.outline
                  ? Border.all(color: AppColors.border)
                  : null,
            ),
            child: Center(
              child: isLoading
                  ? SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          _getTextColor(false),
                        ),
                      ),
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (icon != null) ...[
                          Icon(
                            icon,
                            color: _getTextColor(isDisabled),
                            size: 20,
                          ),
                          const SizedBox(width: AppSpacing.sm),
                        ],
                        Text(
                          text,
                          style: AppTypography.bodySemiBold.copyWith(
                            color: _getTextColor(isDisabled),
                            fontSize: 16,
                          ),
                        ),
                        if (trailingIcon != null) ...[
                          const SizedBox(width: AppSpacing.sm),
                          Icon(
                            trailingIcon,
                            color: _getTextColor(isDisabled),
                            size: 20,
                          ),
                        ],
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Color _getBackgroundColor(bool isDisabled) {
    if (variant == AppButtonVariant.outline) return AppColors.transparent;
    if (isDisabled) return AppColors.border;

    return switch (variant) {
      AppButtonVariant.primary => AppColors.sportOrange,
      AppButtonVariant.secondary => AppColors.sportOrangeLight,
      AppButtonVariant.outline => AppColors.transparent,
    };
  }

  Color _getTextColor(bool isDisabled) {
    if (isDisabled) return AppColors.textDisabled;

    return switch (variant) {
      AppButtonVariant.primary => AppColors.cardWhite,
      AppButtonVariant.secondary ||
      AppButtonVariant.outline => AppColors.sportOrange,
    };
  }
}
