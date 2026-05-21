import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';

enum CompactTextFieldFormat { integer, decimal }

class CompactTextField extends StatelessWidget {
  const CompactTextField({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.onChanged,
    required this.format,
  });

  final TextEditingController controller;
  final TextInputType keyboardType;
  final void Function(String) onChanged;
  final CompactTextFieldFormat format;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: _inputFormatters,
      textAlign: TextAlign.center,
      style: AppTypography.bodySemiBold.copyWith(color: AppColors.textDark),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.inputBg,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.md,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          borderSide: const BorderSide(color: AppColors.sportOrange),
        ),
      ),
      onChanged: onChanged,
    );
  }

  List<TextInputFormatter> get _inputFormatters {
    return switch (format) {
      CompactTextFieldFormat.integer => [
        FilteringTextInputFormatter.allow(RegExp('[0-9]')),
      ],
      CompactTextFieldFormat.decimal => [
        FilteringTextInputFormatter.allow(RegExp('[0-9.]')),
        const _DecimalTextInputFormatter(),
      ],
    };
  }
}

class _DecimalTextInputFormatter extends TextInputFormatter {
  const _DecimalTextInputFormatter();

  static final _validDecimal = RegExp(r'^\d*\.?\d{0,2}$');

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return _validDecimal.hasMatch(newValue.text) ? newValue : oldValue;
  }
}
