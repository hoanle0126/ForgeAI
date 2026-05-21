import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/shared/widgets/app_button.dart';

class SaveWorkoutButton extends StatelessWidget {
  const SaveWorkoutButton({
    super.key,
    required this.isSaving,
    required this.onSave,
    this.text = 'Save Workout',
  });

  final bool isSaving;
  final VoidCallback onSave;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSpacing.screenPadding.add(
        const EdgeInsets.symmetric(vertical: AppSpacing.base),
      ),
      decoration: BoxDecoration(
        color: AppColors.cardWhite,
        boxShadow: [
          BoxShadow(
            color: AppColors.textDark.withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: AppButton(
        text: text,
        onPressed: isSaving ? null : onSave,
        isLoading: isSaving,
      ),
    );
  }
}
