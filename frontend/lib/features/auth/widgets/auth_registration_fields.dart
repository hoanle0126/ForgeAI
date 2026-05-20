import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/auth/widgets/auth_date_of_birth_field.dart';
import 'package:forge_ai/features/auth/widgets/auth_gender_field.dart';
import 'package:forge_ai/features/auth/widgets/auth_text_field.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AuthRegistrationFields extends StatelessWidget {
  const AuthRegistrationFields({
    super.key,
    required this.nameController,
    required this.nameError,
    required this.selectedGender,
    required this.selectedDateOfBirth,
    required this.onGenderChanged,
    required this.onDateOfBirthChanged,
  });

  final TextEditingController nameController;
  final String? nameError;
  final String selectedGender;
  final DateTime selectedDateOfBirth;
  final ValueChanged<String> onGenderChanged;
  final ValueChanged<DateTime> onDateOfBirthChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthTextField(
          label: 'Name',
          hint: 'Ari Nguyen',
          controller: nameController,
          errorText: nameError,
          icon: PhosphorIcons.user(),
        ),
        const SizedBox(height: AppSpacing.base),
        Row(
          children: [
            Expanded(
              child: AuthGenderField(
                selectedGender: selectedGender,
                onGenderChanged: onGenderChanged,
              ),
            ),
            const SizedBox(width: AppSpacing.base),
            Expanded(
              child: AuthDateOfBirthField(
                selectedDateOfBirth: selectedDateOfBirth,
                onDateOfBirthChanged: onDateOfBirthChanged,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.base),
      ],
    );
  }
}
