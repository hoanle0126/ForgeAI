import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/profile/models/profile_summary.dart';
import 'package:forge_ai/features/profile/providers/profile_provider.dart';
import 'package:forge_ai/shared/widgets/app_button.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProfileSettingsForm extends ConsumerStatefulWidget {
  const ProfileSettingsForm({super.key, this.profile});

  final ProfileSummary? profile;

  @override
  ConsumerState<ProfileSettingsForm> createState() =>
      _ProfileSettingsFormState();
}

class _ProfileSettingsFormState extends ConsumerState<ProfileSettingsForm> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _heightController;
  late final TextEditingController _weightController;
  late final TextEditingController _bodyFatController;
  late final TextEditingController _muscleMassController;
  late String _gender;
  bool _isSaving = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    final profile = widget.profile;
    _nameController = TextEditingController(text: profile?.fullName ?? '');
    _emailController = TextEditingController(text: profile?.email ?? '');
    _heightController = TextEditingController(
      text: _formatMetric(profile?.latestMetric?.heightCm),
    );
    _weightController = TextEditingController(
      text: _formatMetric(profile?.latestMetric?.weightKg),
    );
    _bodyFatController = TextEditingController(
      text: _formatMetric(profile?.latestMetric?.bodyFatPct),
    );
    _muscleMassController = TextEditingController(
      text: _formatMetric(profile?.latestMetric?.muscleMass),
    );
    _gender = profile?.gender ?? 'male';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    _bodyFatController.dispose();
    _muscleMassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppCard(
      hasShadow: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Profile Data', style: AppTypography.h3),
          const SizedBox(height: AppSpacing.base),
          _field('Full name', _nameController),
          const SizedBox(height: AppSpacing.md),
          _field(
            'Email',
            _emailController,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: AppSpacing.md),
          DropdownButtonFormField<String>(
            initialValue: _gender,
            items: const [
              DropdownMenuItem(value: 'male', child: Text('Male')),
              DropdownMenuItem(value: 'female', child: Text('Female')),
            ],
            onChanged: (value) {
              if (value != null) {
                setState(() => _gender = value);
              }
            },
            decoration: const InputDecoration(labelText: 'Gender'),
          ),
          const SizedBox(height: AppSpacing.base),
          Text('Body Metrics', style: AppTypography.h3),
          const SizedBox(height: AppSpacing.base),
          _field(
            'Height (cm)',
            _heightController,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: AppSpacing.md),
          _field(
            'Weight (kg)',
            _weightController,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: AppSpacing.md),
          _field(
            'Body fat (%)',
            _bodyFatController,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: AppSpacing.md),
          _field(
            'Muscle mass (kg)',
            _muscleMassController,
            keyboardType: TextInputType.number,
          ),
          if (_error != null) ...[
            const SizedBox(height: AppSpacing.base),
            Text(_error!, style: AppTypography.bodySmall),
          ],
          const SizedBox(height: AppSpacing.base),
          AppButton(
            text: 'Save profile',
            onPressed: _isSaving ? null : _save,
            isLoading: _isSaving,
            trailingIcon: PhosphorIcons.floppyDisk(),
          ),
        ],
      ),
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

  Future<void> _save() async {
    setState(() {
      _isSaving = true;
      _error = null;
    });

    try {
      final repository = ref.read(profileRepositoryProvider);
      await repository.updateProfile(
        fullName: _nameController.text.trim(),
        email: _emailController.text.trim(),
        gender: _gender,
        dateOfBirth:
            widget.profile?.dateOfBirth ??
            DateTime(2000, 1, 1).toIso8601String(),
        heightCm: _parseDouble(_heightController.text),
        weightKg: _parseDouble(_weightController.text),
        bodyFatPct: _parseDouble(_bodyFatController.text),
        muscleMass: _parseDouble(_muscleMassController.text),
      );
      ref.invalidate(profileProvider);
    } catch (error) {
      if (mounted) {
        setState(() => _error = error.toString());
      }
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  String _formatMetric(double? value) {
    if (value == null) {
      return '';
    }
    return value.toStringAsFixed(value % 1 == 0 ? 0 : 1);
  }

  double? _parseDouble(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) {
      return null;
    }
    return double.tryParse(trimmed);
  }
}
