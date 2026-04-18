import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum OnboardingGoal {
  loseFat('Lose Fat', 'RECOMMENDED', Icons.fitness_center),
  buildMuscle('Build Muscle', 'HYPERTROPHY', Icons.sports_gymnastics),
  getStronger('Get Stronger', 'POWER & LOAD', Icons.monitor_weight_outlined),
  stayActive('Stay Active', 'ENDURANCE', Icons.directions_run);

  final String title;
  final String subtitle;
  final IconData icon;

  const OnboardingGoal(this.title, this.subtitle, this.icon);
}

final selectedGoalProvider = StateProvider<OnboardingGoal?>(
  (ref) => OnboardingGoal.loseFat,
);
