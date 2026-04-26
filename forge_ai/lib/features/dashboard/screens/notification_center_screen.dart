import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/dashboard/models/notification_item.dart';
import 'package:forge_ai/features/dashboard/widgets/notifications/notification_list_tile.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';

class NotificationCenterScreen extends StatelessWidget {
  const NotificationCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.warmIvory,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.base,
            AppSpacing.md,
            AppSpacing.base,
            AppSpacing.xxl,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Semantics(
                  button: true,
                  label: 'Back to dashboard',
                  child: Material(
                    color: AppColors.transparent,
                    shape: const CircleBorder(),
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        width: AppSpacing.xxxl,
                        height: AppSpacing.xxxl,
                        decoration: BoxDecoration(
                          color: AppColors.cardWhite,
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.border),
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          color: AppColors.textDark,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.base),
              Text('NOTIFICATIONS', style: AppTypography.labelUppercase),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'Notification Center',
                style: AppTypography.h1.copyWith(color: AppColors.textDark),
              ),
              const SizedBox(height: AppSpacing.base),
              Text(
                'Training, recovery, and AI plan signals in one place.',
                style: AppTypography.bodyMedium,
              ),
              const SizedBox(height: AppSpacing.lg),
              const _NotificationSection(
                title: 'Today',
                items: todayNotificationItems,
              ),
              const SizedBox(height: AppSpacing.base),
              const _NotificationSection(
                title: 'Earlier',
                items: earlierNotificationItems,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NotificationSection extends StatelessWidget {
  const _NotificationSection({required this.title, required this.items});

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
