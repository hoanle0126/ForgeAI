import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/dashboard/models/notification_item.dart';
import 'package:forge_ai/features/dashboard/widgets/notifications/notification_center_header.dart';
import 'package:forge_ai/features/dashboard/widgets/notifications/notification_command_card.dart';
import 'package:forge_ai/features/dashboard/widgets/notifications/notification_section.dart';

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
              NotificationCenterHeader(
                onBack: () => Navigator.of(context).pop(),
              ),
              const SizedBox(height: AppSpacing.base),
              const NotificationCommandCard(),
              const SizedBox(height: AppSpacing.base),
              const NotificationSection(
                title: 'Today',
                items: todayNotificationItems,
              ),
              const SizedBox(height: AppSpacing.base),
              const NotificationSection(
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
