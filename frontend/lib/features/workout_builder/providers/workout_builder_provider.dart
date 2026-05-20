import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:forge_ai/features/auth/providers/auth_provider.dart';

enum WorkoutGoal {
  loseFat('Lose Fat', 'RECOMMENDED', Icons.fitness_center),
  buildMuscle('Build Muscle', 'HYPERTROPHY', Icons.sports_gymnastics),
  getStronger('Get Stronger', 'POWER & LOAD', Icons.monitor_weight_outlined),
  stayActive('Stay Active', 'ENDURANCE', Icons.directions_run);

  final String title;
  final String subtitle;
  final IconData icon;

  const WorkoutGoal(this.title, this.subtitle, this.icon);
}

class SelectedWorkoutGoalNotifier extends Notifier<WorkoutGoal?> {
  @override
  WorkoutGoal? build() => WorkoutGoal.loseFat;

  void select(WorkoutGoal goal) {
    state = goal;
  }
}

final selectedWorkoutGoalProvider =
    NotifierProvider<SelectedWorkoutGoalNotifier, WorkoutGoal?>(
      SelectedWorkoutGoalNotifier.new,
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

  void prefillIfEmpty(String value) {
    if (state.isEmpty && value.isNotEmpty) {
      state = value;
    }
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

final workoutBuilderProfilePrefillProvider = FutureProvider<void>((ref) async {
  try {
    final user = await ref.read(authRepositoryProvider).getCurrentUser();
    final age = _ageFromDateOfBirth(user.dateOfBirth);
    if (age == null) return;

    ref.read(ageProvider.notifier).prefillIfEmpty(age.toString());
  } catch (error, stackTrace) {
    debugPrint('Workout builder profile prefill failed: $error\n$stackTrace');
  }
});

int? _ageFromDateOfBirth(String dateOfBirth) {
  final birthDate = DateTime.tryParse(dateOfBirth);
  if (birthDate == null) return null;

  final today = DateTime.now();
  var age = today.year - birthDate.year;
  final hasHadBirthdayThisYear =
      today.month > birthDate.month ||
      (today.month == birthDate.month && today.day >= birthDate.day);

  if (!hasHadBirthdayThisYear) {
    age -= 1;
  }

  return age > 0 ? age : null;
}
