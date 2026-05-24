import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/router/app_router.dart';
import 'package:forge_ai/features/auth/providers/auth_provider.dart';
import 'package:forge_ai/features/dashboard/widgets/home/account_quick_sheet.dart';
import 'package:forge_ai/features/dashboard/widgets/home/dashboard_account_avatar_button.dart';
import 'package:forge_ai/features/dashboard/widgets/home/dashboard_notification_button.dart';
import 'package:forge_ai/features/dashboard/widgets/home/dashboard_streak_pill.dart';
import 'package:forge_ai/features/dashboard/widgets/notifications/notification_quick_sheet.dart';
import 'package:forge_ai/features/profile/providers/profile_provider.dart';
import 'package:go_router/go_router.dart';

class DashboardTopHeaderRow extends ConsumerWidget {
  const DashboardTopHeaderRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider).valueOrNull;
    final displayName =
        profile?.fullName ?? ref.watch(authProvider).displayName ?? 'Alex Morgan';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DashboardAccountAvatarButton(
          onTap: () => _showAccountSheet(context, ref, displayName),
        ),
        Row(
          children: [
            const DashboardStreakPill(),
            const SizedBox(width: AppSpacing.md),
            DashboardNotificationButton(
              onTap: () => _showNotificationSheet(context),
            ),
          ],
        ),
      ],
    );
  }

  void _showNotificationSheet(BuildContext context) {
    _showBottomSheet(
      context: context,
      builder: (sheetContext) => NotificationQuickSheet(
        onViewAll: () {
          Navigator.of(sheetContext).pop();
          context.push(AppRoutes.notifications);
        },
      ),
    );
  }

  void _showAccountSheet(
    BuildContext context,
    WidgetRef ref,
    String displayName,
  ) {
    final profile = ref.read(profileProvider).valueOrNull;
    _showBottomSheet(
      context: context,
      builder: (sheetContext) => AccountQuickSheet(
        displayName: displayName,
        streakValue: (profile?.streakDays ?? 0).toString(),
        readinessValue: profile == null ? '--' : '79',
        loadValue: profile?.latestMetric?.weightKg?.toStringAsFixed(0) ?? '--',
        onViewFullProfile: () {
          Navigator.of(sheetContext).pop();
          context.go(AppRoutes.profile);
        },
        onTrainingPreferences: () {
          Navigator.of(sheetContext).pop();
          context.go(AppRoutes.training);
        },
        onNotifications: () => _closeSheetAndShowMessage(
          sheetContext,
          context,
          'Notifications coming soon',
        ),
        onLogOut: () {
          Navigator.of(sheetContext).pop();
          ref.read(authProvider.notifier).logOut();
          context.go(AppRoutes.authLogin);
        },
      ),
    );
  }

  void _showBottomSheet({
    required BuildContext context,
    required WidgetBuilder builder,
  }) {
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
      builder: builder,
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
