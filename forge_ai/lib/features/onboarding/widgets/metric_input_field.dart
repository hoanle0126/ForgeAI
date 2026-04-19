import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';

class MetricInputField extends StatefulWidget {
  const MetricInputField({
    super.key,
    required this.label,
    required this.hint,
    required this.initialValue,
    required this.onChanged,
  });

  final String label;
  final String hint;
  final String initialValue;
  final ValueChanged<String> onChanged;

  @override
  State<MetricInputField> createState() => _MetricInputFieldState();
}

class _MetricInputFieldState extends State<MetricInputField> {
  final FocusNode _focusNode = FocusNode();
  late TextEditingController _controller;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: AppTypography.labelUppercase.copyWith(
            color: AppColors.textDark,
            fontWeight: FontWeight.w800,
            fontSize: 11,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Container(
          height: 54,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: AppColors.inputBg,
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          ),
          child: Row(
            children: [
              AnimatedContainer(
                duration: 200.ms,
                width: AppSpacing.xs,
                color: _isFocused
                    ? AppColors.sportOrange
                    : AppColors.transparent,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.base,
                  ),
                  child: TextFormField(
                    controller: _controller,
                    focusNode: _focusNode,
                    onChanged: widget.onChanged,
                    keyboardType: TextInputType.number,
                    style: AppTypography.statMedium.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: InputDecoration(
                      hintText: widget.hint,
                      hintStyle: AppTypography.statMedium.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textDisabled.withValues(alpha: 0.5),
                      ),
                      border: InputBorder.none,
                      isDense: true,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
