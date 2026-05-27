import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/features/profile/models/profile_summary.dart';
import 'package:forge_ai/features/profile/providers/profile_provider.dart';

class ProfileSettingsFormControllers {
  late final TextEditingController name;
  late final TextEditingController email;
  late final TextEditingController height;
  late final TextEditingController weight;
  late final TextEditingController bodyFat;
  late final TextEditingController muscleMass;

  void init(ProfileSummary? profile) {
    name = TextEditingController(text: profile?.fullName ?? '');
    email = TextEditingController(text: profile?.email ?? '');
    height = TextEditingController(
      text: _formatMetric(profile?.latestMetric?.heightCm),
    );
    weight = TextEditingController(
      text: _formatMetric(profile?.latestMetric?.weightKg),
    );
    bodyFat = TextEditingController(
      text: _formatMetric(profile?.latestMetric?.bodyFatPct),
    );
    muscleMass = TextEditingController(
      text: _formatMetric(profile?.latestMetric?.muscleMass),
    );
  }

  void dispose() {
    name.dispose();
    email.dispose();
    height.dispose();
    weight.dispose();
    bodyFat.dispose();
    muscleMass.dispose();
  }

  Future<void> save({
    required WidgetRef ref,
    required ProfileSummary? profile,
    required String gender,
    required bool Function() isMounted,
    required void Function(bool) setSaving,
    required void Function(String?) setError,
  }) async {
    setSaving(true);
    setError(null);

    try {
      final repository = ref.read(profileRepositoryProvider);
      await repository.updateProfile(
        fullName: name.text.trim(),
        email: email.text.trim(),
        gender: gender,
        dateOfBirth:
            profile?.dateOfBirth ?? DateTime(2000, 1, 1).toIso8601String(),
        heightCm: _parseDouble(height.text),
        weightKg: _parseDouble(weight.text),
        bodyFatPct: _parseDouble(bodyFat.text),
        muscleMass: _parseDouble(muscleMass.text),
      );
      ref.invalidate(profileProvider);
    } catch (error) {
      if (isMounted()) {
        setError(error.toString());
      }
    } finally {
      if (isMounted()) {
        setSaving(false);
      }
    }
  }

  String _formatMetric(double? value) {
    if (value == null) return '';
    return value.toStringAsFixed(value % 1 == 0 ? 0 : 1);
  }

  double? _parseDouble(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) return null;
    return double.tryParse(trimmed);
  }
}
