import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/router/app_router.dart';
import 'package:forge_ai/features/auth/providers/auth_provider.dart';
import 'package:forge_ai/features/profile/models/profile_summary.dart';
import 'package:forge_ai/features/profile/providers/profile_provider.dart';
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
    final profileAsync = ref.watch(profileProvider);
    final profile = profileAsync.valueOrNull;
    final displayName =
        profile?.fullName ??
        ref.watch(authProvider).displayName ??
        'Alex Morgan';

    return Scaffold(
      backgroundColor: AppColors.warmIvory,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppSpacing.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: AppSpacing.md),
              ProfileHeader(
                displayName: displayName,
                athleteTitle:
                    profile?.athleteTitle ?? 'Hybrid strength athlete',
                onSettingsTap: () => context.push(AppRoutes.profileSettings),
              ),
              const SizedBox(height: AppSpacing.lg),
              ProfilePerformanceCard(
                readinessScore: _resolveReadiness(profile),
                loadLabel: _resolveLoad(profile),
              ),
              const SizedBox(height: AppSpacing.base),
              ProfileStatStrip(
                streakDays: profile?.streakDays ?? 0,
                completionCount: profile?.completionCount ?? 0,
                volumeLabel: _resolveVolumeDelta(profile),
              ),
              const SizedBox(height: AppSpacing.base),
              ProfileTrainingSnapshot(profile: profile),
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

  String _resolveLoad(ProfileSummary? profile) {
    final double? weightKg = profile?.latestMetric?.weightKg;
    if (weightKg == null) {
      return '--';
    }
    return weightKg.toStringAsFixed(0);
  }

  String _resolveVolumeDelta(ProfileSummary? profile) {
    final int sessions = profile?.completionCount ?? 0;
    if (sessions == 0) {
      return '0%';
    }
    if (sessions >= 12) {
      return '+18%';
    }
    if (sessions >= 6) {
      return '+10%';
    }
    return '+4%';
  }

  String _resolveReadiness(ProfileSummary? profile) {
    final int sessions = profile?.completionCount ?? 0;
    if (sessions >= 12) {
      return '86';
    }
    if (sessions >= 6) {
      return '79';
    }
    if (sessions >= 1) {
      return '72';
    }
    return '--';
  }
}
