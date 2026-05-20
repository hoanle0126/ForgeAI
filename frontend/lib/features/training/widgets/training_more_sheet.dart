import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/training/widgets/training_date_picker_sheet.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class TrainingMoreSheet extends StatelessWidget {
  const TrainingMoreSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.cardWhite,
      barrierColor: AppColors.textDark.withValues(alpha: 0.28),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpacing.radiusXl),
        ),
      ),
      builder: (context) => const TrainingMoreSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: AppSpacing.md),
          Center(
            child: Container(
              width: AppSpacing.xxxl,
              height: AppSpacing.xs,
              decoration: BoxDecoration(
                color: AppColors.border,
                borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.base,
              AppSpacing.md,
              AppSpacing.base,
              AppSpacing.sm,
            ),
            child: Text('More Options', style: AppTypography.h3),
          ),
          ListTile(
            leading: Icon(PhosphorIcons.plus(), color: AppColors.textDark),
            title: Text('Add Workout', style: AppTypography.bodyMedium),
            onTap: () {
              final sm = ScaffoldMessenger.of(context);
              Navigator.of(context).pop();
              sm
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(
                    content: Text('Add Workout feature coming soon!'),
                  ),
                );
            },
          ),
          ListTile(
            leading: Icon(PhosphorIcons.barbell(), color: AppColors.textDark),
            title: Text('Add Exercise', style: AppTypography.bodyMedium),
            onTap: () {
              final sm = ScaffoldMessenger.of(context);
              Navigator.of(context).pop();
              sm
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(
                    content: Text('Add Exercise feature coming soon!'),
                  ),
                );
            },
          ),
          ListTile(
            leading: Icon(
              PhosphorIcons.calendarDots(),
              color: AppColors.textDark,
            ),
            title: Text('Calendar', style: AppTypography.bodyMedium),
            onTap: () {
              Navigator.of(context).pop();
              TrainingDatePickerSheet.show(context);
            },
          ),
          ListTile(
            leading: Icon(PhosphorIcons.faders(), color: AppColors.textDark),
            title: Text('Training Settings', style: AppTypography.bodyMedium),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(PhosphorIcons.chartBar(), color: AppColors.textDark),
            title: Text('Statistics', style: AppTypography.bodyMedium),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          const SizedBox(height: AppSpacing.xxl),
        ],
      ),
    );
  }
}
