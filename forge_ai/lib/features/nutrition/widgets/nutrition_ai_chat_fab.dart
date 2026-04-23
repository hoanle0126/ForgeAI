import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class NutritionAiChatFab extends StatelessWidget {
  const NutritionAiChatFab({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: AppColors.textDark,
      shape: const CircleBorder(),
      elevation: 8,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            PhosphorIcons.chatTeardropText(PhosphorIconsStyle.regular),
            color: AppColors.cardWhite,
            size: 24,
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Icon(
              PhosphorIcons.sparkle(PhosphorIconsStyle.fill),
              color: AppColors.sportOrange,
              size: 14,
            ),
          ),
        ],
      ),
    );
  }
}
