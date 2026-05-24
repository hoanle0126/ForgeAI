import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/router/app_router.dart';
import 'package:forge_ai/features/auth/providers/auth_provider.dart';
import 'package:forge_ai/features/auth/widgets/auth_console.dart';
import 'package:forge_ai/features/auth/widgets/auth_header.dart';
import 'package:forge_ai/features/auth/widgets/auth_input_controllers.dart';
import 'package:go_router/go_router.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key, this.initialMode = AuthMode.login});

  final AuthMode initialMode;

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  final _controllers = AuthInputControllers();
  String _selectedGender = 'male';
  DateTime _selectedDateOfBirth = DateTime(2000, 1, 1);

  @override
  void initState() {
    super.initState();
    _scheduleModeSync(widget.initialMode);
  }

  @override
  void dispose() {
    _controllers.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authProvider);

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
                nameController: _controllers.name,
                emailController: _controllers.email,
                otpController: _controllers.otp,
                passwordController: _controllers.password,
                confirmPasswordController: _controllers.confirmPassword,
                selectedGender: _selectedGender,
                selectedDateOfBirth: _selectedDateOfBirth,
                onGenderChanged: (gender) {
                  setState(() => _selectedGender = gender);
                },
                onDateOfBirthChanged: (date) {
                  setState(() => _selectedDateOfBirth = date);
                },
                onModeChanged: (mode) {
                  ref.read(authProvider.notifier).switchMode(mode);
                },
                onSubmit: _submit,
              ),
              const SizedBox(height: AppSpacing.xxl),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _submit() async {
    final notifier = ref.read(authProvider.notifier);
    final mode = ref.read(authProvider).mode;

    if (mode == AuthMode.forgotPassword) {
      await notifier.submitPasswordReset(email: _controllers.email.text);
      return;
    }

    if (mode == AuthMode.verifyResetOtp) {
      await notifier.submitOtpVerification(otp: _controllers.otp.text);
      return;
    }

    if (mode == AuthMode.resetPassword) {
      await notifier.submitNewPassword(
        password: _controllers.password.text,
        confirmPassword: _controllers.confirmPassword.text,
      );
      return;
    }

    if (mode == AuthMode.login) {
      final result = await notifier.submitLogin(
        email: _controllers.email.text,
        password: _controllers.password.text,
      );
      if (mounted && result == AuthSubmitResult.success) {
        context.go(AppRoutes.dashboard);
      }
      return;
    }

    final result = await notifier.submitRegistration(
      name: _controllers.name.text,
      email: _controllers.email.text,
      password: _controllers.password.text,
      confirmPassword: _controllers.confirmPassword.text,
      gender: _selectedGender,
      dateOfBirth: _selectedDateOfBirth,
    );
    if (mounted && result == AuthSubmitResult.success) {
      context.go(AppRoutes.dashboard);
    }
  }

  void _scheduleModeSync(AuthMode mode) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      ref.read(authProvider.notifier).switchMode(mode);
    });
  }
}
