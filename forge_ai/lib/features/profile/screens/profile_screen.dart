import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/router/app_router.dart';
import 'package:forge_ai/features/auth/providers/auth_provider.dart';
import 'package:forge_ai/features/profile/widgets/profile_header.dart';
import 'package:forge_ai/features/profile/widgets/profile_performance_card.dart';
import 'package:forge_ai/features/profile/widgets/profile_settings_list.dart';
import 'package:forge_ai/features/profile/widgets/profile_stat_strip.dart';
import 'package:forge_ai/features/profile/widgets/profile_training_snapshot.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displayName = ref.watch(authProvider).displayName ?? 'Alex Morgan';

    return Scaffold(
      backgroundColor: AppColors.warmIvory,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppSpacing.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: AppSpacing.md),
              ProfileHeader(displayName: displayName),
              const SizedBox(height: AppSpacing.lg),
              const ProfilePerformanceCard(),
              const SizedBox(height: AppSpacing.base),
              const ProfileStatStrip(),
              const SizedBox(height: AppSpacing.base),
              const ProfileTrainingSnapshot(),
              const SizedBox(height: AppSpacing.base),
              ProfileSettingsList(
                onTrainingPreferences: () => context.go(AppRoutes.training),
                onNotifications: () => context.push(AppRoutes.notifications),
                onLogOut: () {
                  ref.read(authProvider.notifier).logOut();
                  context.go(AppRoutes.authLogin);
                },
              ),
              const SizedBox(height: AppSpacing.xxl),
            ],
          ),
        ),
      ),
    );
  }
}
