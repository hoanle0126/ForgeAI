import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/features/onboarding/widgets/welcome/welcome_content.dart';
import 'package:forge_ai/features/onboarding/widgets/welcome/welcome_hero.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.warmIvory,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isCompactHeight = constraints.maxHeight < 720;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: isCompactHeight ? 4 : 5,
                child: const WelcomeHero(),
              ),
              Expanded(
                flex: isCompactHeight ? 5 : 4,
                child: const WelcomeContent(),
              ),
            ],
          );
        },
      ),
    );
  }
}
