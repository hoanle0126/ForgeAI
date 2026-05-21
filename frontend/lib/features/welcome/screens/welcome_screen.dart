import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/welcome/widgets/welcome_brand_header.dart';
import 'package:forge_ai/features/welcome/widgets/welcome_cta_section.dart';
import 'package:forge_ai/features/welcome/widgets/welcome_feature_pills.dart';
import 'package:forge_ai/features/welcome/widgets/welcome_footer.dart';
import 'package:forge_ai/features/welcome/widgets/welcome_grid_pattern_painter.dart';
import 'package:forge_ai/features/welcome/widgets/welcome_hero_content.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isWide = size.width > 600;

    return Scaffold(
      backgroundColor: AppColors.warmIvory,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(painter: WelcomeGridPatternPainter()),
            ),
            SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: size.height - MediaQuery.of(context).padding.top,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isWide ? AppSpacing.xxxl : AppSpacing.base,
                    vertical: AppSpacing.xl,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const WelcomeBrandHeader()
                          .animate()
                          .fadeIn(duration: 600.ms, curve: Curves.easeOut)
                          .slideY(begin: -0.3, end: 0),
                      SizedBox(
                        height: isWide ? AppSpacing.xxxl * 2 : AppSpacing.xxxl,
                      ),
                      WelcomeHeroContent(isWide: isWide)
                          .animate(delay: 200.ms)
                          .fadeIn(duration: 600.ms, curve: Curves.easeOut)
                          .slideY(begin: 0.3, end: 0),
                      SizedBox(
                        height: isWide ? AppSpacing.xxxl : AppSpacing.xl,
                      ),
                      const WelcomeFeaturePills()
                          .animate(delay: 400.ms)
                          .fadeIn(duration: 600.ms)
                          .slideY(begin: 0.2, end: 0),
                      const SizedBox(height: AppSpacing.xxxl),
                      const WelcomeCtaSection()
                          .animate(delay: 600.ms)
                          .fadeIn(duration: 600.ms)
                          .slideY(begin: 0.2, end: 0),
                      const SizedBox(height: AppSpacing.lg),
                      const WelcomeFooter()
                          .animate(delay: 800.ms)
                          .fadeIn(duration: 600.ms),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
