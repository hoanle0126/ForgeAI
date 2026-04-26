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
              const _NotificationCommandCard(),
              const SizedBox(height: AppSpacing.base),
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

class _NotificationCommandCard extends StatelessWidget {
  const _NotificationCommandCard();

  @override
  Widget build(BuildContext context) {
    return AppCard(
      color: AppColors.textDark,
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Action queue',
                style: AppTypography.labelUppercase.copyWith(
                  color: AppColors.cardWhite.withValues(alpha: 0.72),
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.xs,
                ),
                decoration: BoxDecoration(
                  color: AppColors.sportOrange,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                ),
                child: Text(
                  '2 unread',
                  style: AppTypography.label.copyWith(
                    color: AppColors.cardWhite,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.base),
          Text(
            'Prioritize what changes today\'s training.',
            style: AppTypography.h3.copyWith(color: AppColors.cardWhite),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Workout timing, recovery shifts, and AI plan updates stay grouped before older history.',
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.cardWhite.withValues(alpha: 0.72),
            ),
          ),
          const SizedBox(height: AppSpacing.base),
          const Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: [
              _NotificationTonePill(
                label: 'Workout',
                color: AppColors.sportOrange,
              ),
              _NotificationTonePill(
                label: 'Recovery',
                color: AppColors.recovery,
              ),
              _NotificationTonePill(
                label: 'AI insight',
                color: AppColors.aiBlue,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _NotificationTonePill extends StatelessWidget {
  const _NotificationTonePill({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
        border: Border.all(color: color.withValues(alpha: 0.32)),
      ),
      child: Text(
        label,
        style: AppTypography.label.copyWith(color: AppColors.cardWhite),
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
