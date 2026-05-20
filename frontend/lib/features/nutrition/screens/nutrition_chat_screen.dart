import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/nutrition/providers/nutrition_adjustment_provider.dart';
import 'package:forge_ai/features/nutrition/providers/nutrition_plan_provider.dart';
import 'package:forge_ai/features/nutrition/widgets/nutrition_adjustment_chat_card.dart';
import 'package:forge_ai/features/nutrition/widgets/nutrition_adjustment_context_card.dart';
import 'package:forge_ai/features/nutrition/widgets/nutrition_adjustment_hero_card.dart';
import 'package:forge_ai/features/nutrition/widgets/nutrition_adjustment_input_bar.dart';
import 'package:forge_ai/features/nutrition/widgets/nutrition_adjustment_quick_actions.dart';

class NutritionChatScreen extends ConsumerStatefulWidget {
  const NutritionChatScreen({super.key});

  @override
  ConsumerState<NutritionChatScreen> createState() =>
      _NutritionChatScreenState();
}

class _NutritionChatScreenState extends ConsumerState<NutritionChatScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final day = ref.watch(selectedNutritionDayProvider);
    final messages = ref.watch(nutritionAdjustmentMessagesProvider);

    return Scaffold(
      backgroundColor: AppColors.warmIvory,
      appBar: AppBar(backgroundColor: AppColors.warmIvory, elevation: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppSpacing.screenPadding,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 760),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: AppSpacing.base),
                  Text('Adjust with AI', style: AppTypography.h2),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    'Tune today\'s meals around training, appetite, and recovery without rebuilding the whole week.',
                    style: AppTypography.bodyMedium,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  NutritionAdjustmentHeroCard(day: day),
                  const SizedBox(height: AppSpacing.base),
                  NutritionAdjustmentContextCard(day: day),
                  const SizedBox(height: AppSpacing.base),
                  NutritionAdjustmentQuickActions(
                    onPromptSelected: _handlePrompt,
                  ),
                  const SizedBox(height: AppSpacing.base),
                  NutritionAdjustmentChatCard(messages: messages),
                  const SizedBox(height: AppSpacing.base),
                  NutritionAdjustmentInputBar(
                    controller: _controller,
                    onSubmitted: () => _handlePrompt(_controller.text),
                  ),
                  const SizedBox(height: AppSpacing.xxxl),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handlePrompt(String value) {
    final prompt = value.trim();
    if (prompt.isEmpty) return;
    ref.read(nutritionAdjustmentMessagesProvider.notifier).sendPrompt(prompt);
    _controller.clear();
  }
}
