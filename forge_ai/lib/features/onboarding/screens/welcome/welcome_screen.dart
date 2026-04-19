import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/features/onboarding/widgets/welcome/welcome_content.dart';
import 'package:forge_ai/features/onboarding/widgets/welcome/welcome_hero.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.warmIvory,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(flex: 5, child: WelcomeHero()),
          Expanded(flex: 4, child: WelcomeContent()),
        ],
      ),
    );
  }
}
