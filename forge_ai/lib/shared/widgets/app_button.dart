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
  });

  final String text;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final bool isLoading;
  final bool isFullWidth;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final isDisabled = onPressed == null || isLoading;

    return Semantics(
      button: true,
      enabled: !isDisabled,
      child: InkWell(
        onTap: isDisabled ? null : onPressed,
        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
        child: Ink(
          width: isFullWidth ? double.infinity : null,
          height: 56, // Standard touch target height for main CTAs
          decoration: BoxDecoration(
            color: _getBackgroundColor(isDisabled),
            borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
            border: variant == AppButtonVariant.outline
                ? Border.all(color: AppColors.border)
                : null,
          ),
          child: Center(
            child: isLoading
                ? _buildLoader()
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (icon != null) ...[
                        Icon(icon, color: _getTextColor(isDisabled), size: 20),
                        const SizedBox(width: AppSpacing.sm),
                      ],
                      Text(
                        text,
                        style: AppTypography.bodySemiBold.copyWith(
                          color: _getTextColor(isDisabled),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Color _getBackgroundColor(bool isDisabled) {
    if (variant == AppButtonVariant.outline) return Colors.transparent;

    if (isDisabled) {
      return AppColors.border; // Grey background when disabled
    }

    switch (variant) {
      case AppButtonVariant.primary:
        return AppColors.sportOrange;
      case AppButtonVariant.secondary:
        return AppColors.sportOrangeLight;
      case AppButtonVariant.outline:
        return Colors.transparent;
    }
  }

  Color _getTextColor(bool isDisabled) {
    if (isDisabled) return AppColors.textDisabled;

    switch (variant) {
      case AppButtonVariant.primary:
        return AppColors.cardWhite;
      case AppButtonVariant.secondary:
      case AppButtonVariant.outline:
        return AppColors.sportOrange;
    }
  }

  Widget _buildLoader() {
    return SizedBox(
      width: 24,
      height: 24,
      child: CircularProgressIndicator(
        strokeWidth: 2.5,
        valueColor: AlwaysStoppedAnimation<Color>(_getTextColor(false)),
      ),
    );
  }
}
