import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/training/widgets/workout_feedback_chip.dart';

class FeedbackOption {
  const FeedbackOption({required this.label, required this.value});

  final String label;
  final String value;
}

class WorkoutFeedbackSelector extends StatelessWidget {
  const WorkoutFeedbackSelector({
    super.key,
    required this.title,
    required this.options,
    required this.selectedValue,
    required this.onSelected,
  });

  final String title;
  final List<FeedbackOption> options;
  final String selectedValue;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTypography.label.copyWith(
            color: AppColors.textDark,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Row(
          children: [
            for (int i = 0; i < options.length; i++) ...[
              WorkoutFeedbackChip(
                label: options[i].label,
                isSelected: options[i].value == selectedValue,
                onTap: () => onSelected(options[i].value),
              ),
              if (i < options.length - 1) const SizedBox(width: AppSpacing.sm),
            ],
          ],
        ),
      ],
    );
  }
}
