import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/auth/providers/auth_provider.dart';
import 'package:forge_ai/features/auth/widgets/auth_password_fields.dart';
import 'package:forge_ai/features/auth/widgets/auth_registration_fields.dart';
import 'package:forge_ai/features/auth/widgets/auth_text_field.dart';
import 'package:forge_ai/features/auth/widgets/forgot_password_button.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AuthFormFields extends StatelessWidget {
  const AuthFormFields({
    super.key,
    required this.state,
    required this.nameController,
    required this.emailController,
    required this.otpController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.selectedGender,
    required this.selectedDateOfBirth,
    required this.onGenderChanged,
    required this.onDateOfBirthChanged,
    required this.onSwitchMode,
  });

  final AuthState state;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController otpController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final String selectedGender;
  final DateTime selectedDateOfBirth;
  final ValueChanged<String> onGenderChanged;
  final ValueChanged<DateTime> onDateOfBirthChanged;
  final ValueChanged<AuthMode> onSwitchMode;

  @override
  Widget build(BuildContext context) {
    final mode = state.mode;
    final isRegister = mode == AuthMode.register;
    final isForgotPassword = mode == AuthMode.forgotPassword;
    final isVerifyOtp = mode == AuthMode.verifyResetOtp;
    final isResetPassword = mode == AuthMode.resetPassword;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (isRegister) ...[
          AuthRegistrationFields(
            nameController: nameController,
            nameError: state.fieldErrors['name'],
            selectedGender: selectedGender,
            selectedDateOfBirth: selectedDateOfBirth,
            onGenderChanged: onGenderChanged,
            onDateOfBirthChanged: onDateOfBirthChanged,
          ),
        ],
        if (!isResetPassword)
          AuthTextField(
            label: 'Email',
            hint: 'athlete@forge.ai',
            controller: emailController,
            errorText: state.fieldErrors['email'],
            keyboardType: TextInputType.emailAddress,
            icon: PhosphorIcons.envelopeSimple(),
          ),
        if (isVerifyOtp)
          AuthTextField(
            label: 'OTP',
            hint: '123456',
            controller: otpController,
            errorText: state.fieldErrors['otp'],
            keyboardType: TextInputType.number,
            icon: PhosphorIcons.password(),
          ),
        if (!isForgotPassword && !isVerifyOtp)
          AuthPasswordFields(
            isRegister: isRegister,
            passwordController: passwordController,
            confirmPasswordController: confirmPasswordController,
            passwordError: state.fieldErrors['password'],
            confirmPasswordError: state.fieldErrors['confirmPassword'],
          ),
        if (!isRegister &&
            !isForgotPassword &&
            !isVerifyOtp &&
            !isResetPassword) ...[
          const SizedBox(height: AppSpacing.sm),
          ForgotPasswordButton(
            isEnabled: !state.isLoading,
            onPressed: () => onSwitchMode(AuthMode.forgotPassword),
          ),
        ],
      ],
    );
  }
}
