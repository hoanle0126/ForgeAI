import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/insight_provider.dart';
import '../widgets/chat_bubble.dart';

class InsightChatTab extends ConsumerStatefulWidget {
  const InsightChatTab({super.key});

  @override
  ConsumerState<InsightChatTab> createState() => _InsightChatTabState();
}

class _InsightChatTabState extends ConsumerState<InsightChatTab> {
  final _controller = TextEditingController();

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      ref.read(insightNotifierProvider.notifier).sendMessage(text);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final stateAsync = ref.watch(insightNotifierProvider);

    return Column(
      children: [
        Expanded(
          child: stateAsync.when(
            data: (state) => ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: state.messages.length,
              itemBuilder: (context, index) => ChatBubble(message: state.messages[index]),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('Error: $err')),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Ask AI...',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                  onSubmitted: (_) => _sendMessage(),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.send, color: Colors.blue),
                onPressed: _sendMessage,
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
