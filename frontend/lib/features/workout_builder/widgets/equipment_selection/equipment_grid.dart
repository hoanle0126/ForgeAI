import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/workout_builder/providers/workout_builder_provider.dart';
import 'package:forge_ai/features/workout_builder/widgets/equipment_selection/equipment_card.dart';

class EquipmentGrid extends ConsumerWidget {
  const EquipmentGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedEquipment = ref.watch(selectedEquipmentProvider);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 120,
        mainAxisSpacing: AppSpacing.md,
        crossAxisSpacing: AppSpacing.md,
      ),
      itemCount: Equipment.values.length,
      itemBuilder: (context, index) {
        final equipment = Equipment.values[index];
        return EquipmentCard(
              title: equipment.title,
              icon: equipment.icon,
              isSelected: selectedEquipment.contains(equipment),
              onTap: () => ref
                  .read(selectedEquipmentProvider.notifier)
                  .toggle(equipment),
            )
            .animate()
            .fadeIn(delay: Duration(milliseconds: 200 + index * 50))
            .slideY(begin: 0.1, end: 0);
      },
    );
  }
}
