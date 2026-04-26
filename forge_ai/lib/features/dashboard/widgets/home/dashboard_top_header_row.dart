import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/core/router/app_router.dart';
import 'package:forge_ai/features/auth/providers/auth_provider.dart';
import 'package:forge_ai/features/dashboard/widgets/home/account_quick_sheet.dart';
import 'package:forge_ai/features/dashboard/widgets/home/dashboard_account_avatar_button.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class DashboardTopHeaderRow extends ConsumerWidget {
  const DashboardTopHeaderRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displayName = ref.watch(authProvider).displayName ?? 'Alex Morgan';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DashboardAccountAvatarButton(
          onTap: () => _showAccountSheet(context, displayName),
        ),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.xs,
              ),
              decoration: BoxDecoration(
                color: AppColors.sportOrangeLight,
                borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
              ),
              child: Row(
                children: [
                  Text(
                    '12',
                    style: AppTypography.labelUppercase.copyWith(
                      color: AppColors.sportOrange,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.xs),
                  Text(
                    '🔥',
                    style: AppTypography.bodySmall.copyWith(fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Container(
              padding: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.border),
                color: AppColors.cardWhite,
              ),
              child: Icon(
                PhosphorIcons.bell(PhosphorIconsStyle.fill),
                color: AppColors.textDark,
                size: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _showAccountSheet(BuildContext context, String displayName) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.cardWhite,
      barrierColor: AppColors.textDark.withValues(alpha: 0.28),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpacing.radiusXl),
        ),
      ),
      builder: (sheetContext) {
        return AccountQuickSheet(
          displayName: displayName,
          onViewFullProfile: () {
            Navigator.of(sheetContext).pop();
            context.go(AppRoutes.profile);
          },
          onTrainingPreferences: () => _closeSheetAndShowMessage(
            sheetContext,
            context,
            'Training preferences coming soon',
          ),
          onNotifications: () => _closeSheetAndShowMessage(
            sheetContext,
            context,
            'Notifications coming soon',
          ),
        );
      },
    );
  }

  void _closeSheetAndShowMessage(
    BuildContext sheetContext,
    BuildContext pageContext,
    String message,
  ) {
    Navigator.of(sheetContext).pop();
    ScaffoldMessenger.of(pageContext)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}
