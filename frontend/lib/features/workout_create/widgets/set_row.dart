import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/workout_create/models/workout_create_models.dart';
import 'package:forge_ai/features/workout_create/widgets/compact_text_field.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SetRow extends StatefulWidget {
  const SetRow({
    super.key,
    required this.set,
    required this.setNumber,
    required this.onUpdate,
    required this.onRemove,
  });

  final WorkoutSet set;
  final int setNumber;
  final void Function(WorkoutSet) onUpdate;
  final VoidCallback onRemove;

  @override
  State<SetRow> createState() => _SetRowState();
}

class _SetRowState extends State<SetRow> {
  late WorkoutSet _draftSet;
  late TextEditingController _repsController;
  late TextEditingController _weightController;

  @override
  void initState() {
    super.initState();
    _draftSet = widget.set;
    _repsController = TextEditingController(
      text: widget.set.reps?.toString() ?? '',
    );
    _weightController = TextEditingController(
      text: widget.set.weightKg?.toString() ?? '',
    );
  }

  @override
  void dispose() {
    _repsController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: AppSpacing.xl,
          child: Text(
            '${widget.setNumber}',
            style: AppTypography.bodySemiBold.copyWith(
              color: AppColors.textDark,
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: CompactTextField(
            controller: _repsController,
            keyboardType: TextInputType.number,
            format: CompactTextFieldFormat.integer,
            onChanged: (value) {
              _draftSet = _draftSet.copyWith(reps: int.tryParse(value));
              widget.onUpdate(_draftSet);
            },
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: CompactTextField(
            controller: _weightController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            format: CompactTextFieldFormat.decimal,
            onChanged: (value) {
              _draftSet = _draftSet.copyWith(weightKg: double.tryParse(value));
              widget.onUpdate(_draftSet);
            },
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        SizedBox(
          width: AppSpacing.xl,
          height: AppSpacing.xl,
          child: IconButton(
            onPressed: widget.onRemove,
            icon: PhosphorIcon(
              PhosphorIcons.x(),
              color: AppColors.textMuted,
              size: 16,
            ),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ),
      ],
    );
  }
}
