import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/auth/providers/auth_provider.dart';
import 'package:forge_ai/features/auth/widgets/auth_console.dart';
import 'package:forge_ai/features/auth/widgets/auth_header.dart';
import 'package:forge_ai/features/auth/widgets/auth_input_controllers.dart';

class AuthScreenBody extends StatelessWidget {
  const AuthScreenBody({
    super.key,
    required this.state,
    required this.controllers,
    required this.selectedGender,
    required this.selectedDateOfBirth,
    required this.onGenderChanged,
    required this.onDateOfBirthChanged,
    required this.onModeChanged,
    required this.onSubmit,
  });

  final AuthState state;
  final AuthInputControllers controllers;
  final String selectedGender;
  final DateTime selectedDateOfBirth;
  final ValueChanged<String> onGenderChanged;
  final ValueChanged<DateTime> onDateOfBirthChanged;
  final ValueChanged<AuthMode> onModeChanged;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.warmIvory,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppSpacing.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: AppSpacing.lg),
              const AuthHeader(),
              const SizedBox(height: AppSpacing.lg),
              AuthConsole(
                state: state,
                nameController: controllers.name,
                emailController: controllers.email,
                otpController: controllers.otp,
                passwordController: controllers.password,
                confirmPasswordController: controllers.confirmPassword,
                selectedGender: selectedGender,
                selectedDateOfBirth: selectedDateOfBirth,
                onGenderChanged: onGenderChanged,
                onDateOfBirthChanged: onDateOfBirthChanged,
                onModeChanged: onModeChanged,
                onSubmit: onSubmit,
              ),
              const SizedBox(height: AppSpacing.xxl),
            ],
          ),
        ),
      ),
    );
  }
}
