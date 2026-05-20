import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';

class AuthDateOfBirthField extends StatelessWidget {
  const AuthDateOfBirthField({
    super.key,
    required this.selectedDateOfBirth,
    required this.onDateOfBirthChanged,
  });

  final DateTime selectedDateOfBirth;
  final ValueChanged<DateTime> onDateOfBirthChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Date of Birth', style: AppTypography.label),
        const SizedBox(height: AppSpacing.sm),
        InkWell(
          onTap: () => _pickDate(context),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.base,
            ),
            decoration: BoxDecoration(
              color: AppColors.inputBg,
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            ),
            child: Text(
              _formattedDate,
              style: AppTypography.bodyLarge.copyWith(
                color: AppColors.textDark,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _pickDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: selectedDateOfBirth,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (date != null) onDateOfBirthChanged(date);
  }

  String get _formattedDate {
    final month = selectedDateOfBirth.month.toString().padLeft(2, '0');
    final day = selectedDateOfBirth.day.toString().padLeft(2, '0');
    return '${selectedDateOfBirth.year}-$month-$day';
  }
}
