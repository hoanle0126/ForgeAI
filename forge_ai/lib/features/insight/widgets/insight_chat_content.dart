import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/insight/providers/insight_provider.dart';
import 'package:forge_ai/features/insight/widgets/insight_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class InsightChatContent extends ConsumerStatefulWidget {
  const InsightChatContent({super.key});

  @override
  ConsumerState<InsightChatContent> createState() => _InsightChatContentState();
}

class _InsightChatContentState extends ConsumerState<InsightChatContent> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    ref.read(insightNotifierProvider.notifier).sendMessage(text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final stateAsync = ref.watch(insightNotifierProvider);

    return Column(
      children: [
        Expanded(
          child: stateAsync.when(
            data: (state) => ListView.builder(
              padding: const EdgeInsets.all(AppSpacing.base),
              itemCount: state.messages.length,
              itemBuilder: (context, index) {
                return InsightCard(message: state.messages[index]);
              },
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) => Center(
              child: Text(
                'Unable to load AI chat.',
                style: AppTypography.bodyMedium,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.base,
            0,
            AppSpacing.base,
            AppSpacing.base,
          ),
          child: _ChatComposer(
            controller: _controller,
            onSubmitted: _sendMessage,
          ),
        ),
      ],
    );
  }
}

class _ChatComposer extends StatelessWidget {
  const _ChatComposer({required this.controller, required this.onSubmitted});

  final TextEditingController controller;
  final VoidCallback onSubmitted;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.cardWhite,
        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Ask AI to analyze...',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              ),
              onSubmitted: (_) => onSubmitted(),
            ),
          ),
          IconButton(
            tooltip: 'Send',
            color: AppColors.aiBlue,
            onPressed: onSubmitted,
            icon: Icon(PhosphorIcons.paperPlaneTilt()),
          ),
          const SizedBox(width: AppSpacing.sm),
        ],
      ),
    );
  }
}
