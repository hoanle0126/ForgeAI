import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class PickerSheet<T> extends StatelessWidget {
  const PickerSheet({
    super.key,
    required this.title,
    required this.items,
    required this.itemBuilder,
    this.selectedItem,
  });

  final String title;
  final List<T> items;
  final String Function(T) itemBuilder;
  final T? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTypography.h4),
          const SizedBox(height: AppSpacing.base),
          ...items.map((item) {
            final isSelected = item == selectedItem;
            return InkWell(
              onTap: () => Navigator.of(context).pop(item),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: AppSpacing.md,
                  horizontal: AppSpacing.base,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.sportOrangeLight : null,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        itemBuilder(item),
                        style: AppTypography.bodyMedium.copyWith(
                          color: isSelected
                              ? AppColors.sportOrange
                              : AppColors.textDark,
                          fontWeight: isSelected ? FontWeight.w600 : null,
                        ),
                      ),
                    ),
                    if (isSelected)
                      PhosphorIcon(
                        PhosphorIcons.check(),
                        color: AppColors.sportOrange,
                        size: 20,
                      ),
                  ],
                ),
              ),
            );
          }),
          const SizedBox(height: AppSpacing.base),
        ],
      ),
    );
  }
}
