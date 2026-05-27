import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/profile/models/profile_summary.dart';
import 'package:forge_ai/features/profile/widgets/profile_body_metrics_fields.dart';
import 'package:forge_ai/features/profile/widgets/profile_settings_form_controllers.dart';
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
  final _controllers = ProfileSettingsFormControllers();
  late String _gender;
  bool _isSaving = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _controllers.init(widget.profile);
    _gender = widget.profile?.gender ?? 'male';
  }

  @override
  void dispose() {
    _controllers.dispose();
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
          _field('Full name', _controllers.name),
          const SizedBox(height: AppSpacing.md),
          _field(
            'Email',
            _controllers.email,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: AppSpacing.md),
          DropdownButtonFormField<String>(
            initialValue: _gender,
            items: const [
              DropdownMenuItem(value: 'male', child: Text('Male')),
              DropdownMenuItem(value: 'female', child: Text('Female')),
            ],
            onChanged: (value) =>
                value != null ? setState(() => _gender = value) : null,
            decoration: const InputDecoration(labelText: 'Gender'),
          ),
          const SizedBox(height: AppSpacing.base),
          Text('Body Metrics', style: AppTypography.h3),
          const SizedBox(height: AppSpacing.base),
          ProfileBodyMetricsFields(controllers: _controllers),
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
  }) => TextField(
    controller: controller,
    keyboardType: keyboardType,
    decoration: InputDecoration(labelText: label),
  );

  Future<void> _save() => _controllers.save(
    ref: ref,
    profile: widget.profile,
    gender: _gender,
    isMounted: () => mounted,
    setSaving: (saving) => setState(() => _isSaving = saving),
    setError: (err) => setState(() => _error = err),
  );
}
