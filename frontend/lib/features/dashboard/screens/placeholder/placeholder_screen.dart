import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';

class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.warmIvory,
      body: Center(child: Text(title)),
    );
  }
}
