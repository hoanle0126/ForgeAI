import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/dashboard/models/notification_item.dart';
import 'package:forge_ai/features/dashboard/widgets/notifications/notification_list_tile.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';

class NotificationSection extends StatelessWidget {
  const NotificationSection({
    super.key,
    required this.title,
    required this.items,
  });

  final String title;
  final List<NotificationItem> items;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      hasShadow: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTypography.h4.copyWith(color: AppColors.textDark),
          ),
          const SizedBox(height: AppSpacing.sm),
          ...items.map((item) => NotificationListTile(item: item)),
        ],
      ),
    );
  }
}
