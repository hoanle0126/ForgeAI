import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/core/router/app_router.dart';
import 'package:forge_ai/features/insight/providers/insight_provider.dart';
import 'package:forge_ai/features/profile/providers/profile_provider.dart';
import 'package:forge_ai/features/training/providers/active_workout_session_provider.dart';
import 'package:forge_ai/features/training/providers/workout_library_provider.dart';
import 'package:forge_ai/features/training/widgets/workout_feedback_notes.dart';
import 'package:forge_ai/features/training/widgets/workout_feedback_selector.dart';
import 'package:forge_ai/shared/widgets/app_button.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class WorkoutFeedbackCard extends ConsumerStatefulWidget {
  const WorkoutFeedbackCard({super.key});

  @override
  ConsumerState<WorkoutFeedbackCard> createState() =>
      _WorkoutFeedbackCardState();
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
    ref
        .read(activeWorkoutSessionProvider.notifier)
        .submitFeedback(
          effort: _effort,
          difficultyAdjustment: _difficultyAdjustment,
          notes: _notesController.text,
          onSuccess: () {
            ref
              ..invalidate(workoutLibraryProvider)
              ..invalidate(insightNotifierProvider)
              ..invalidate(profileProvider);
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
          WorkoutFeedbackSelector(
            title: 'HOW WAS THIS WORKOUT?',
            options: const [
              FeedbackOption(label: 'Too Easy 🌟', value: 'too_easy'),
              FeedbackOption(label: 'Just Right ✨', value: 'just_right'),
              FeedbackOption(label: 'Too Hard 🔥', value: 'too_hard'),
            ],
            selectedValue: _effort,
            onSelected: (val) => setState(() => _effort = val),
          ),
          const SizedBox(height: AppSpacing.lg),
          WorkoutFeedbackSelector(
            title: 'DIFFICULTY ADJUSTMENT FOR NEXT TIME',
            options: const [
              FeedbackOption(label: 'Decrease 📉', value: 'decrease'),
              FeedbackOption(label: 'Keep Same ⚖️', value: 'maintain'),
              FeedbackOption(label: 'Increase 📈', value: 'increase'),
            ],
            selectedValue: _difficultyAdjustment,
            onSelected: (val) => setState(() => _difficultyAdjustment = val),
          ),
          const SizedBox(height: AppSpacing.lg),
          WorkoutFeedbackNotes(controller: _notesController),
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
}
