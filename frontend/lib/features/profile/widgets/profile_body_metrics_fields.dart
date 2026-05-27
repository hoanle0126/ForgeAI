import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/profile/widgets/profile_settings_form_controllers.dart';

class ProfileBodyMetricsFields extends StatelessWidget {
  const ProfileBodyMetricsFields({super.key, required this.controllers});

  final ProfileSettingsFormControllers controllers;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _field(
          'Height (cm)',
          controllers.height,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: AppSpacing.md),
        _field(
          'Weight (kg)',
          controllers.weight,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: AppSpacing.md),
        _field(
          'Body fat (%)',
          controllers.bodyFat,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: AppSpacing.md),
        _field(
          'Muscle mass (kg)',
          controllers.muscleMass,
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }

  Widget _field(
    String label,
    TextEditingController controller, {
    TextInputType? keyboardType,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(labelText: label),
    );
  }
}
