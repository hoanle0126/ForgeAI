import 'package:flutter/material.dart';

abstract final class AppSpacing {
  // 8px Grid System
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double base = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 40;
  static const double xxxl = 48;

  // BorderRadius
  static const double radiusSm = 8;
  static const double radiusMd = 12;
  static const double radiusLg = 16;
  static const double radiusXl = 24;
  static const double radiusFull = 999;

  // Common Paddings
  static const EdgeInsets screenPadding = EdgeInsets.symmetric(
    horizontal: base,
  );
  static const EdgeInsets cardPadding = EdgeInsets.all(base);
}
