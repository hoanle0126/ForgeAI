import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/dashboard/models/notification_item.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class NotificationListTile extends StatelessWidget {
  const NotificationListTile({
    super.key,
    required this.item,
    this.compact = false,
  });

  final NotificationItem item;
  final bool compact;

  IconData get _toneIcon {
    return switch (item.tone) {
      NotificationTone.workout => PhosphorIcons.barbell(
        PhosphorIconsStyle.fill,
      ),
      NotificationTone.recovery => PhosphorIcons.heartbeat(
        PhosphorIconsStyle.fill,
      ),
      NotificationTone.insight => PhosphorIcons.sparkle(
        PhosphorIconsStyle.fill,
      ),
    };
  }

  Color get _toneColor {
    return switch (item.tone) {
      NotificationTone.workout => AppColors.sportOrange,
      NotificationTone.recovery => AppColors.recovery,
      NotificationTone.insight => AppColors.aiBlue,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: AppSpacing.xxxl,
            height: AppSpacing.xxxl,
            decoration: BoxDecoration(
              color: _toneColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            ),
            child: Icon(_toneIcon, color: _toneColor, size: 20),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        item.title,
                        maxLines: compact ? 1 : 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.bodySemiBold.copyWith(
                          color: AppColors.textDark,
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Text(item.timeLabel, style: AppTypography.label),
                  ],
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  item.subtitle,
                  maxLines: compact ? 1 : 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.bodySmall,
                ),
              ],
            ),
          ),
          if (item.isUnread) ...[
            const SizedBox(width: AppSpacing.sm),
            Container(
              width: AppSpacing.sm,
              height: AppSpacing.sm,
              margin: const EdgeInsets.only(top: AppSpacing.sm),
              decoration: const BoxDecoration(
                color: AppColors.sportOrange,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
