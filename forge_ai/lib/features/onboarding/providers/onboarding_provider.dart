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

class SelectedGoalNotifier extends Notifier<OnboardingGoal?> {
  @override
  OnboardingGoal? build() => OnboardingGoal.loseFat;

  void select(OnboardingGoal goal) {
    state = goal;
  }
}

final selectedGoalProvider =
    NotifierProvider<SelectedGoalNotifier, OnboardingGoal?>(
      SelectedGoalNotifier.new,
    );

enum Equipment {
  dumbbells('Dumbbells', Icons.fitness_center),
  resistanceBands(
    'Resistance Bands',
    Icons.gesture,
  ), // using gesture as a curved band
  yogaMat('Yoga Mat', Icons.self_improvement),
  pullUpBar('Pull-up Bar', Icons.minimize),
  bench('Bench', Icons.event_seat),
  kettlebell('Kettlebell', Icons.shopping_bag), // approximate shape
  jumpRope('Jump Rope', Icons.cable),
  none('None', Icons.cancel);

  const Equipment(this.title, this.icon);
  final String title;
  final IconData icon;
}

class SelectedEquipmentNotifier extends Notifier<Set<Equipment>> {
  @override
  Set<Equipment> build() => {};

  void toggle(Equipment equipment) {
    if (equipment == Equipment.none) {
      state = {Equipment.none};
      return;
    }

    final newState = Set<Equipment>.from(state);
    newState.remove(Equipment.none);

    if (newState.contains(equipment)) {
      newState.remove(equipment);
    } else {
      newState.add(equipment);
    }
    state = newState;
  }
}

final selectedEquipmentProvider =
    NotifierProvider<SelectedEquipmentNotifier, Set<Equipment>>(
      SelectedEquipmentNotifier.new,
    );

enum ActivityLevel {
  sedentary('Sedentary'),
  light('Light'),
  active('Active'),
  veryActive('Very Active');

  const ActivityLevel(this.title);
  final String title;
}

abstract class StringFieldNotifier extends Notifier<String> {
  @override
  String build() => '';

  void update(String value) {
    state = value;
  }
}

class HeightNotifier extends StringFieldNotifier {}

class WeightNotifier extends StringFieldNotifier {}

class AgeNotifier extends StringFieldNotifier {}

class ActivityLevelNotifier extends Notifier<ActivityLevel?> {
  @override
  ActivityLevel? build() => null;

  void select(ActivityLevel level) {
    state = level;
  }
}

final heightProvider = NotifierProvider<HeightNotifier, String>(
  HeightNotifier.new,
);
final weightProvider = NotifierProvider<WeightNotifier, String>(
  WeightNotifier.new,
);
final ageProvider = NotifierProvider<AgeNotifier, String>(AgeNotifier.new);
final activityLevelProvider =
    NotifierProvider<ActivityLevelNotifier, ActivityLevel?>(
      ActivityLevelNotifier.new,
    );

// Phase 5: Schedule Preference
enum TrainingDay {
  mo('Mo'),
  tu('Tu'),
  we('We'),
  th('Th'),
  fr('Fr'),
  sa('Sa'),
  su('Su');

  const TrainingDay(this.label);
  final String label;
}

class SelectedDaysNotifier extends Notifier<Set<TrainingDay>> {
  @override
  Set<TrainingDay> build() => {};

  void toggle(TrainingDay day) {
    if (state.contains(day)) {
      state = {...state}..remove(day);
    } else {
      state = {...state, day};
    }
  }
}

final selectedDaysProvider =
    NotifierProvider<SelectedDaysNotifier, Set<TrainingDay>>(
      SelectedDaysNotifier.new,
    );

class SessionLengthNotifier extends Notifier<double> {
  @override
  double build() => 30.0;

  void update(double value) {
    state = value;
  }
}

final sessionLengthProvider = NotifierProvider<SessionLengthNotifier, double>(
  SessionLengthNotifier.new,
);

enum PreferredTime {
  morning('Morning', Icons.wb_sunny_outlined),
  afternoon('Afternoon', Icons.wb_sunny),
  evening('Evening', Icons.brightness_3),
  flexible('Flexible', Icons.calendar_today);

  const PreferredTime(this.label, this.icon);
  final String label;
  final IconData icon; // using material icons representing the mockup
}

class PreferredTimeNotifier extends Notifier<PreferredTime?> {
  @override
  PreferredTime? build() => null;

  void select(PreferredTime time) {
    state = time;
  }
}

final preferredTimeProvider =
    NotifierProvider<PreferredTimeNotifier, PreferredTime?>(
      PreferredTimeNotifier.new,
    );
