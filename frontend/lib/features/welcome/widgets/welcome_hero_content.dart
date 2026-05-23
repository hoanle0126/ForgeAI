import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/welcome/widgets/welcome_hero_copy.dart';
import 'package:forge_ai/features/welcome/widgets/welcome_hero_visual.dart';

class WelcomeHeroContent extends StatelessWidget {
  const WelcomeHeroContent({
    super.key,
    required this.isWide,
    required this.isCompactHeight,
  });

  final bool isWide;
  final bool isCompactHeight;

  @override
  Widget build(BuildContext context) {
    if (isWide) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 10,
            child: WelcomeHeroCopy(
              isWide: isWide,
              isCompactHeight: isCompactHeight,
            ),
          ),
          SizedBox(width: isCompactHeight ? AppSpacing.lg : AppSpacing.xxxl),
          const Expanded(flex: 12, child: WelcomeHeroVisual()),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: isCompactHeight ? 11 : 12,
          child: const WelcomeHeroVisual(),
        ),
        SizedBox(height: isCompactHeight ? AppSpacing.base : AppSpacing.lg),
        Expanded(
          flex: isCompactHeight ? 9 : 10,
          child: WelcomeHeroCopy(
            isWide: isWide,
            isCompactHeight: isCompactHeight,
          ),
        ),
      ],
    );
  }
}
