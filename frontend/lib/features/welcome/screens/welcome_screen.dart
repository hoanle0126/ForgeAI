import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/core/router/app_router.dart';
import 'package:forge_ai/shared/widgets/app_button.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

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
            // Background Pattern
            Positioned.fill(
              child: CustomPaint(
                painter: _GridPatternPainter(),
              ),
            ),

            // Main Content
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
                      // Logo & Brand
                      _buildBrandHeader()
                          .animate()
                          .fadeIn(duration: 600.ms, curve: Curves.easeOut)
                          .slideY(begin: -0.3, end: 0),

                      SizedBox(height: isWide ? AppSpacing.xxxl * 2 : AppSpacing.xxxl),

                      // Hero Content
                      _buildHeroContent(isWide)
                          .animate(delay: 200.ms)
                          .fadeIn(duration: 600.ms, curve: Curves.easeOut)
                          .slideY(begin: 0.3, end: 0),

                      SizedBox(height: isWide ? AppSpacing.xxxl : AppSpacing.xl),

                      // Feature Pills
                      _buildFeaturePills()
                          .animate(delay: 400.ms)
                          .fadeIn(duration: 600.ms)
                          .slideY(begin: 0.2, end: 0),

                      const SizedBox(height: AppSpacing.xxxl),

                      // CTA Section
                      _buildCTASection(context)
                          .animate(delay: 600.ms)
                          .fadeIn(duration: 600.ms)
                          .slideY(begin: 0.2, end: 0),

                      const SizedBox(height: AppSpacing.lg),

                      // Footer
                      _buildFooter()
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

  Widget _buildBrandHeader() {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.sportOrange,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            PhosphorIconsBold.lightning,
            color: AppColors.cardWhite,
            size: 28,
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Text(
          'ForgeAI',
          style: AppTypography.h2.copyWith(
            fontSize: 28,
            letterSpacing: -0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildHeroContent(bool isWide) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Eyebrow
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.xs,
          ),
          decoration: BoxDecoration(
            color: AppColors.sportOrangeLight,
            borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
          ),
          child: Text(
            'AI-POWERED TRAINING',
            style: AppTypography.label.copyWith(
              color: AppColors.sportOrange,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
            ),
          ),
        ),

        const SizedBox(height: AppSpacing.lg),

        // Main Headline
        Text(
          'Your Personal\nCoach Lives\nHere',
          style: AppTypography.h1.copyWith(
            fontSize: isWide ? 64 : 48,
            height: 1.1,
            letterSpacing: -2,
            fontWeight: FontWeight.w900,
          ),
        ),

        const SizedBox(height: AppSpacing.lg),

        // Subheadline
        Text(
          'Smart workout plans and nutrition guidance tailored to your goals, equipment, and schedule.',
          style: AppTypography.bodyLarge.copyWith(
            fontSize: 18,
            height: 1.6,
            color: AppColors.textMuted,
          ),
        ),
      ],
    );
  }

  Widget _buildFeaturePills() {
    final features = [
      ('Adaptive Plans', PhosphorIconsRegular.calendar),
      ('AI Nutrition', PhosphorIconsRegular.forkKnife),
      ('Progress Tracking', PhosphorIconsRegular.chartLine),
    ];

    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: features.map((feature) {
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.base,
            vertical: AppSpacing.md,
          ),
          decoration: BoxDecoration(
            color: AppColors.cardWhite,
            borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                feature.$2,
                size: 18,
                color: AppColors.sportOrange,
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                feature.$1,
                style: AppTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.textDark,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCTASection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppButton(
          text: 'Start Your Journey',
          icon: PhosphorIconsBold.lightning,
          onPressed: () {
            context.go(AppRoutes.authRegister);
          },
        ),
        const SizedBox(height: AppSpacing.base),
        AppButton(
          text: 'Sign In',
          variant: AppButtonVariant.outline,
          onPressed: () {
            context.go(AppRoutes.authLogin);
          },
        ),
      ],
    );
  }

  Widget _buildFooter() {
    return Center(
      child: Column(
        children: [
          Text(
            'PRECISION PROTOCOL V1.0',
            style: AppTypography.label.copyWith(
              letterSpacing: 2,
              color: AppColors.textDisabled.withValues(alpha: 0.5),
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: AppColors.success,
                  shape: BoxShape.circle,
                ),
              )
                  .animate(onPlay: (controller) => controller.repeat())
                  .fadeIn(duration: 1000.ms)
                  .then()
                  .fadeOut(duration: 1000.ms),
              const SizedBox(width: AppSpacing.xs),
              Text(
                'System Online',
                style: AppTypography.label.copyWith(
                  color: AppColors.textDisabled,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _GridPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.border.withValues(alpha: 0.3)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    const gridSize = 40.0;

    // Vertical lines
    for (double x = 0; x < size.width; x += gridSize) {
      canvas.drawLine(
        Offset(x, 0),
        Offset(x, size.height),
        paint,
      );
    }

    // Horizontal lines
    for (double y = 0; y < size.height; y += gridSize) {
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
