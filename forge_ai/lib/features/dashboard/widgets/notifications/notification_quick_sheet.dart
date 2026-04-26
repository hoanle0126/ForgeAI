import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/dashboard/models/notification_item.dart';
import 'package:forge_ai/features/dashboard/widgets/notifications/notification_list_tile.dart';
import 'package:forge_ai/shared/widgets/app_button.dart';

class NotificationQuickSheet extends StatelessWidget {
  const NotificationQuickSheet({super.key, required this.onViewAll});

  final VoidCallback onViewAll;

  @override
  Widget build(BuildContext context) {
    final unreadCount = todayNotificationItems
        .where((item) => item.isUnread)
        .length;

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.base,
          AppSpacing.md,
          AppSpacing.base,
          AppSpacing.base,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: AppSpacing.xxl,
                height: AppSpacing.xs,
                decoration: BoxDecoration(
                  color: AppColors.border,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'NOTIFICATIONS',
                        style: AppTypography.labelUppercase,
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        'Today\'s alerts',
                        style: AppTypography.h3.copyWith(
                          color: AppColors.textDark,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                    vertical: AppSpacing.xs,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.sportOrangeLight,
                    borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                  ),
                  child: Text(
                    '$unreadCount NEW',
                    style: AppTypography.labelUppercase.copyWith(
                      color: AppColors.sportOrange,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.base),
            ...todayNotificationItems.map(
              (item) => NotificationListTile(item: item, compact: true),
            ),
            const SizedBox(height: AppSpacing.base),
            AppButton(
              text: 'View all notifications',
              variant: AppButtonVariant.secondary,
              onPressed: onViewAll,
            ),
          ],
        ),
      ),
    );
  }
}
