import 'dart:async';

import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';

class WelcomeHeroImageCarousel extends StatefulWidget {
  const WelcomeHeroImageCarousel({super.key});

  @override
  State<WelcomeHeroImageCarousel> createState() =>
      _WelcomeHeroImageCarouselState();
}

class _WelcomeHeroImageCarouselState extends State<WelcomeHeroImageCarousel> {
  // Unsplash sources:
  // 1) Anastase Maragos — https://unsplash.com/photos/7kEpUPB8vNk
  // 2) Anastase Maragos — https://unsplash.com/photos/4dlhin0ghOk
  // 3) Anastase Maragos — https://unsplash.com/photos/IZw5zLHMfd4
  static const _heroImages = <String>[
    'assets/images/welcome_unsplash_1.jpg',
    'assets/images/welcome_unsplash_2.jpg',
    'assets/images/welcome_unsplash_3.jpg',
  ];
  static const _autoSlideInterval = Duration(seconds: 4);

  final _pageController = PageController();
  int _currentIndex = 0;
  Timer? _autoSlideTimer;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _autoSlideTimer?.cancel();
    _autoSlideTimer = Timer.periodic(_autoSlideInterval, (_) {
      if (!mounted || !_pageController.hasClients) {
        return;
      }

      final nextIndex = (_currentIndex + 1) % _heroImages.length;
      _pageController.animateToPage(
        nextIndex,
        duration: const Duration(milliseconds: 420),
        curve: Curves.easeOutCubic,
      );
    });
  }

  @override
  void dispose() {
    _autoSlideTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          controller: _pageController,
          itemCount: _heroImages.length,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
            _startAutoSlide();
          },
          itemBuilder: (context, index) {
            return Image.asset(_heroImages[index], fit: BoxFit.cover);
          },
        ),
        Positioned(
          right: AppSpacing.md,
          bottom: AppSpacing.md,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.sm,
              vertical: AppSpacing.xs,
            ),
            decoration: BoxDecoration(
              color: AppColors.textDark.withValues(alpha: 0.40),
              borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(_heroImages.length, (index) {
                final isActive = _currentIndex == index;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 220),
                  margin: EdgeInsets.only(
                    right: index == _heroImages.length - 1 ? 0 : AppSpacing.xs,
                  ),
                  width: isActive ? AppSpacing.base : AppSpacing.sm,
                  height: AppSpacing.sm,
                  decoration: BoxDecoration(
                    color: isActive
                        ? AppColors.cardWhite
                        : AppColors.cardWhite.withValues(alpha: 0.45),
                    borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
