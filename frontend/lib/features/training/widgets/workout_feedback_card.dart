import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/core/router/app_router.dart';
import 'package:forge_ai/features/training/providers/active_workout_session_provider.dart';
import 'package:forge_ai/features/training/providers/workout_library_provider.dart';
import 'package:forge_ai/features/training/widgets/workout_feedback_chip.dart';
import 'package:forge_ai/shared/widgets/app_button.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class WorkoutFeedbackCard extends ConsumerStatefulWidget {
  const WorkoutFeedbackCard({super.key});

  @override
  ConsumerState<WorkoutFeedbackCard> createState() => _WorkoutFeedbackCardState();
}

class _WorkoutFeedbackCardState extends ConsumerState<WorkoutFeedbackCard> {
  String _effort = 'just_right';
  String _difficultyAdjustment = 'maintain';
  final _notesController = TextEditingController();

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  void _submit() {
    ref.read(activeWorkoutSessionProvider.notifier).submitFeedback(
          effort: _effort,
          difficultyAdjustment: _difficultyAdjustment,
          notes: _notesController.text,
          onSuccess: () {
            ref.invalidate(workoutLibraryProvider);
            context.go(AppRoutes.training);
          },
          onError: (error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Failed to submit feedback: $error'),
                backgroundColor: AppColors.sportOrange,
              ),
            );
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    final session = ref.watch(activeWorkoutSessionProvider);

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Session Complete! 🎉', style: AppTypography.h2),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Tell us how this workout went so ForgeAI can optimize your plan.',
            style: AppTypography.bodyMedium,
          ),
          const SizedBox(height: AppSpacing.lg),
          _buildLabel('HOW WAS THIS WORKOUT?'),
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              WorkoutFeedbackChip(
                label: 'Too Easy 🌟',
                isSelected: _effort == 'too_easy',
                onTap: () => setState(() => _effort = 'too_easy'),
              ),
              const SizedBox(width: AppSpacing.sm),
              WorkoutFeedbackChip(
                label: 'Just Right ✨',
                isSelected: _effort == 'just_right',
                onTap: () => setState(() => _effort = 'just_right'),
              ),
              const SizedBox(width: AppSpacing.sm),
              WorkoutFeedbackChip(
                label: 'Too Hard 🔥',
                isSelected: _effort == 'too_hard',
                onTap: () => setState(() => _effort = 'too_hard'),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          _buildLabel('DIFFICULTY ADJUSTMENT FOR NEXT TIME'),
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              WorkoutFeedbackChip(
                label: 'Decrease 📉',
                isSelected: _difficultyAdjustment == 'decrease',
                onTap: () => setState(() => _difficultyAdjustment = 'decrease'),
              ),
              const SizedBox(width: AppSpacing.sm),
              WorkoutFeedbackChip(
                label: 'Keep Same ⚖️',
                isSelected: _difficultyAdjustment == 'maintain',
                onTap: () => setState(() => _difficultyAdjustment = 'maintain'),
              ),
              const SizedBox(width: AppSpacing.sm),
              WorkoutFeedbackChip(
                label: 'Increase 📈',
                isSelected: _difficultyAdjustment == 'increase',
                onTap: () => setState(() => _difficultyAdjustment = 'increase'),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          _buildLabel('TRAINING NOTES (OPTIONAL)'),
          const SizedBox(height: AppSpacing.sm),
          TextField(
            controller: _notesController,
            maxLines: 3,
            style: AppTypography.bodyMedium.copyWith(color: AppColors.textDark),
            decoration: InputDecoration(
              hintText: 'Share your thoughts, soreness areas...',
              hintStyle: AppTypography.bodyMedium.copyWith(
                color: AppColors.textDisabled,
              ),
              filled: true,
              fillColor: AppColors.inputBg,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.base,
                vertical: AppSpacing.md,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          AppButton(
            text: 'Submit Feedback & Complete',
            icon: PhosphorIcons.sparkle(PhosphorIconsStyle.bold),
            isLoading: session.isSubmittingFeedback,
            onPressed: _submit,
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: AppTypography.label.copyWith(
        color: AppColors.textDark,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
