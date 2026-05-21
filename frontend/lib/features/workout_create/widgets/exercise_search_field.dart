import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ExerciseSearchField extends StatelessWidget {
  const ExerciseSearchField({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  final TextEditingController controller;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.screenPadding,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: AppTypography.bodyMedium.copyWith(color: AppColors.textDark),
        decoration: InputDecoration(
          hintText: 'Search exercises...',
          hintStyle: AppTypography.bodyMedium.copyWith(
            color: AppColors.textDisabled,
          ),
          prefixIcon: PhosphorIcon(
            PhosphorIcons.magnifyingGlass(),
            color: AppColors.textDisabled,
          ),
          filled: true,
          fillColor: AppColors.inputBg,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.base,
            vertical: AppSpacing.md,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
