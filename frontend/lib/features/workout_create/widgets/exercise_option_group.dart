import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/workout_create/widgets/exercise_option_chip.dart';

class ExerciseOptionGroup extends StatelessWidget {
  const ExerciseOptionGroup({
    super.key,
    required this.label,
    required this.options,
    required this.selectedOptions,
    required this.onOptionPressed,
    this.helperText,
    this.multiSelect = false,
  });

  final String label;
  final List<String> options;
  final List<String> selectedOptions;
  final void Function(String) onOptionPressed;
  final String? helperText;
  final bool multiSelect;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.label.copyWith(
            color: AppColors.textDark,
            fontWeight: FontWeight.w700,
          ),
        ),
        if (helperText != null) ...[
          const SizedBox(height: AppSpacing.xs),
          Text(helperText!, style: AppTypography.bodySmall),
        ],
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: options.map((option) {
            final isSelected = selectedOptions.contains(option);
            return ExerciseOptionChip(
              label: _formatOptionLabel(option),
              isSelected: isSelected,
              showCheck: multiSelect && isSelected,
              onTap: () => onOptionPressed(option),
            );
          }).toList(),
        ),
      ],
    );
  }
}

String _formatOptionLabel(String value) {
  return value
      .split('_')
      .map((word) {
        if (word.isEmpty) return word;
        return '${word[0].toUpperCase()}${word.substring(1)}';
      })
      .join(' ');
}
