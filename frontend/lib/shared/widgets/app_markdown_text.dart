import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';

class AppMarkdownText extends StatelessWidget {
  const AppMarkdownText({super.key, required this.text, required this.style});

  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    final spans = <TextSpan>[];
    final lines = text.split('\n');

    for (var i = 0; i < lines.length; i += 1) {
      final line = lines[i];
      if (spans.isNotEmpty) {
        spans.add(const TextSpan(text: '\n'));
      }

      if (line.trim().startsWith('* ')) {
        spans.add(const TextSpan(text: '  • '));
        spans.addAll(_parseInline(line.trim().substring(2), style));
      } else {
        spans.addAll(_parseInline(line, style));
      }
    }

    return RichText(
      text: TextSpan(style: style, children: spans),
    );
  }

  List<TextSpan> _parseInline(String text, TextStyle defaultStyle) {
    final spans = <TextSpan>[];
    final regExp = RegExp(r'\*\*(.*?)\*\*');
    var start = 0;

    for (final match in regExp.allMatches(text)) {
      if (match.start > start) {
        spans.add(
          TextSpan(
            text: text.substring(start, match.start),
            style: defaultStyle,
          ),
        );
      }
      spans.add(
        TextSpan(
          text: match.group(1),
          style: defaultStyle.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
          ),
        ),
      );
      start = match.end;
    }

    if (start < text.length) {
      spans.add(TextSpan(text: text.substring(start), style: defaultStyle));
    }

    return spans;
  }
}
