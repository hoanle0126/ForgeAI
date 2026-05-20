import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/router/app_router.dart';
import 'package:forge_ai/features/workout_builder/providers/workout_builder_provider.dart';
import 'package:forge_ai/shared/widgets/app_button.dart';
import 'package:go_router/go_router.dart';

class EquipmentSelectionActionBar extends StatelessWidget {
  const EquipmentSelectionActionBar({
    super.key,
    required this.selectedEquipment,
  });

  final Set<Equipment> selectedEquipment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppSpacing.lg,
        right: AppSpacing.lg,
        bottom: AppSpacing.xl,
        top: AppSpacing.base,
      ),
      child: AppButton(
        text: 'Continue',
        trailingIcon: Icons.arrow_forward,
        onPressed: selectedEquipment.isEmpty
            ? null
            : () => context.push(AppRoutes.workoutBuilderBody),
      ),
    );
  }
}
