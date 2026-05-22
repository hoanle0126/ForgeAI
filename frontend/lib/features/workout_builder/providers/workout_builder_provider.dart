import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:forge_ai/features/auth/providers/auth_provider.dart';

const int workoutBuilderMonthlyTrainingDays = 4;

enum WorkoutGoal {
  fatLoss('Fat Loss', 'CONDITIONING', Icons.local_fire_department),
  muscleGain('Muscle Gain', 'HYPERTROPHY', Icons.fitness_center),
  strength('Strength', 'LOAD & POWER', Icons.sports_gymnastics),
  mobility('Mobility', 'RANGE & CONTROL', Icons.self_improvement),
  generalFitness('General Fitness', 'CONSISTENCY', Icons.directions_run);

  final String title;
  final String subtitle;
  final IconData icon;

  const WorkoutGoal(this.title, this.subtitle, this.icon);

  String get apiValue {
    return switch (this) {
      WorkoutGoal.fatLoss => 'fat_loss',
      WorkoutGoal.muscleGain => 'muscle_gain',
      WorkoutGoal.strength => 'strength',
      WorkoutGoal.mobility => 'mobility',
      WorkoutGoal.generalFitness => 'general_fitness',
    };
  }
}

class SelectedWorkoutGoalNotifier extends Notifier<WorkoutGoal?> {
  @override
  WorkoutGoal? build() => null;

  void select(WorkoutGoal goal) {
    state = goal;
  }
}

final selectedWorkoutGoalProvider =
    NotifierProvider<SelectedWorkoutGoalNotifier, WorkoutGoal?>(
      SelectedWorkoutGoalNotifier.new,
    );

enum Equipment {
  bodyweight('Bodyweight', 'bodyweight', Icons.accessibility_new),
  dumbbell('Dumbbell', 'dumbbell', Icons.fitness_center),
  barbell('Barbell', 'barbell', Icons.drag_handle),
  machine('Machine', 'machine', Icons.precision_manufacturing),
  cable('Cable', 'cable', Icons.cable),
  band('Bands', 'band', Icons.gesture),
  kettlebell('Kettlebell', 'kettlebell', Icons.shopping_bag),
  other('Other', 'other', Icons.more_horiz);

  const Equipment(this.title, this.apiValue, this.icon);
  final String title;
  final String apiValue;
  final IconData icon;
}

class SelectedEquipmentNotifier extends Notifier<Set<Equipment>> {
  @override
  Set<Equipment> build() => {};

  void toggle(Equipment equipment) {
    if (state.contains(equipment)) {
      state = {...state}..remove(equipment);
    } else {
      state = {...state, equipment};
    }
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

  String get apiValue {
    return switch (this) {
      ActivityLevel.sedentary => 'sedentary',
      ActivityLevel.light => 'light',
      ActivityLevel.active => 'active',
      ActivityLevel.veryActive => 'very_active',
    };
  }
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

  String get apiValue => name;
}

class SelectedDaysNotifier extends Notifier<Set<TrainingDay>> {
  @override
  Set<TrainingDay> build() => {};

  void toggle(TrainingDay day) {
    if (state.contains(day)) {
      state = {...state}..remove(day);
    } else {
      if (state.length >= workoutBuilderMonthlyTrainingDays) {
        return;
      }
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

  String get apiValue => name;
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
