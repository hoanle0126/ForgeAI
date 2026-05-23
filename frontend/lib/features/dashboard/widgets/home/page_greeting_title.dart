import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_typography.dart';

class PageGreetingTitle extends StatelessWidget {
  const PageGreetingTitle({
    super.key,
    this.greetingLine = 'Good morning',
    this.athleteAlias = 'Champ',
  });

  final String greetingLine;
  final String athleteAlias;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: '$greetingLine,\n',
        style: AppTypography.h1.copyWith(
          fontSize: 28,
          height: 1.1,
          letterSpacing: -0.5,
        ),
        children: [
          TextSpan(
            text: athleteAlias,
            style: AppTypography.h1.copyWith(
              color: AppColors.sportOrange,
              fontSize: 48,
              height: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}
