import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';

class PersonalizedAnalysisCard extends StatelessWidget {
  const PersonalizedAnalysisCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.zero,
      color: AppColors.textDark, // Dark theme overriding card
      child: Stack(
        children: [
          // Background Gradient / Image Placeholder
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            width: 150,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.horizontal(
                  right: Radius.circular(AppSpacing.radiusLg),
                ),
                gradient: LinearGradient(
                  colors: [
                    AppColors.textDark,
                    AppColors.textDark.withValues(alpha: 0.0),
                  ],
                  stops: const [0.0, 1.0],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: const Opacity(
                opacity: 0.2,
                child: Icon(
                  Icons.sports_gymnastics,
                  size: 100,
                  color: AppColors.cardWhite,
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PERSONALIZED ANALYSIS',
                  style: AppTypography.h4.copyWith(
                    color: AppColors.cardWhite,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'Based on your previous activity, "Lose Fat" is optimized for your current recovery rate.',
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.cardWhite.withValues(alpha: 0.7),
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                Row(
                  children: [
                    _buildStat('ACCURACY', '94.2%', AppColors.sportOrange),
                    const SizedBox(width: AppSpacing.lg),
                    Container(
                      width: 1,
                      height: 32,
                      color: AppColors.cardWhite.withValues(alpha: 0.24),
                    ),
                    const SizedBox(width: AppSpacing.lg),
                    _buildStat('ENGINE', 'v4.0', AppColors.cardWhite),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStat(String label, String value, Color valueColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.labelUppercase.copyWith(
            color: AppColors.cardWhite.withValues(alpha: 0.54),
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 4),
        Text(value, style: AppTypography.statLarge.copyWith(color: valueColor)),
      ],
    );
  }
}
