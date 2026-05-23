import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/profile/widgets/profile_snapshot_row.dart';
import 'package:forge_ai/features/workout_builder/providers/workout_builder_provider.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProfileTrainingPreferencesSummary extends ConsumerWidget {
  const ProfileTrainingPreferencesSummary({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goal = ref.watch(selectedWorkoutGoalProvider);
    final equipment = ref.watch(selectedEquipmentProvider);
    final trainingDays = ref.watch(selectedDaysProvider);

    return Column(
      children: [
        ProfileSnapshotRow(
          icon: PhosphorIcons.barbell(PhosphorIconsStyle.fill),
          title: 'Primary goal',
          value: goal?.title ?? 'Not set',
          color: AppColors.sportOrange,
        ),
        const SizedBox(height: AppSpacing.md),
        ProfileSnapshotRow(
          icon: PhosphorIcons.lightning(PhosphorIconsStyle.fill),
          title: 'Weekly schedule',
          value: trainingDays.isEmpty
              ? 'Not set'
              : '${trainingDays.length} sessions',
          color: AppColors.energy,
        ),
        const SizedBox(height: AppSpacing.md),
        ProfileSnapshotRow(
          icon: PhosphorIcons.barbell(PhosphorIconsStyle.bold),
          title: 'Equipment',
          value: _equipmentLabel(equipment),
          color: AppColors.aiBlue,
        ),
      ],
    );
  }
}

String _equipmentLabel(Set<Equipment> equipment) {
  if (equipment.isEmpty) return 'Not set';
  if (equipment.length == 1) return equipment.first.title;
  return '${equipment.length} types selected';
}
