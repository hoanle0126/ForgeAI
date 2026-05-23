import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/welcome/widgets/welcome_brand_header.dart';
import 'package:forge_ai/features/welcome/widgets/welcome_cta_section.dart';
import 'package:forge_ai/features/welcome/widgets/welcome_grid_pattern_painter.dart';
import 'package:forge_ai/features/welcome/widgets/welcome_hero_content.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.warmIvory,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 760;
            final isCompactHeight = constraints.maxHeight <= 760;
            final horizontalPadding = isWide
                ? AppSpacing.xxxl
                : AppSpacing.base;
            final verticalPadding = isCompactHeight
                ? AppSpacing.base
                : AppSpacing.xl;

            return Stack(
              children: [
                Positioned.fill(
                  child: CustomPaint(painter: WelcomeGridPatternPainter()),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                    vertical: verticalPadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const WelcomeBrandHeader()
                          .animate()
                          .fadeIn(duration: 600.ms, curve: Curves.easeOut)
                          .slideY(begin: -0.3, end: 0),
                      SizedBox(
                        height: isCompactHeight
                            ? AppSpacing.base
                            : AppSpacing.xl,
                      ),
                      Expanded(
                        child:
                            WelcomeHeroContent(
                                  isWide: isWide,
                                  isCompactHeight: isCompactHeight,
                                )
                                .animate(delay: 200.ms)
                                .fadeIn(duration: 600.ms, curve: Curves.easeOut)
                                .slideY(begin: 0.2, end: 0),
                      ),
                      SizedBox(
                        height: isCompactHeight
                            ? AppSpacing.base
                            : AppSpacing.lg,
                      ),
                      WelcomeCtaSection(
                            isWide: isWide,
                            isCompactHeight: isCompactHeight,
                          )
                          .animate(delay: 400.ms)
                          .fadeIn(duration: 600.ms)
                          .slideY(begin: 0.15, end: 0),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
