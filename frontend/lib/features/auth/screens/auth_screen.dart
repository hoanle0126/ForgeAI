import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/router/app_router.dart';
import 'package:forge_ai/features/auth/providers/auth_provider.dart';
import 'package:forge_ai/features/auth/screens/auth_screen_body.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        ref.read(authProvider.notifier).switchMode(widget.initialMode);
      }
    });
  }

  @override
  void dispose() {
    _controllers.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authProvider);

    return AuthScreenBody(
      state: state,
      controllers: _controllers,
      selectedGender: _selectedGender,
      selectedDateOfBirth: _selectedDateOfBirth,
      onGenderChanged: (g) => setState(() => _selectedGender = g),
      onDateOfBirthChanged: (d) => setState(() => _selectedDateOfBirth = d),
      onModeChanged: (m) => ref.read(authProvider.notifier).switchMode(m),
      onSubmit: _submit,
    );
  }

  Future<void> _submit() async {
    final notifier = ref.read(authProvider.notifier);
    final mode = ref.read(authProvider).mode;

    final success = await switch (mode) {
      AuthMode.forgotPassword =>
        notifier
            .submitPasswordReset(email: _controllers.email.text)
            .then((_) => false),
      AuthMode.verifyResetOtp =>
        notifier
            .submitOtpVerification(otp: _controllers.otp.text)
            .then((_) => false),
      AuthMode.resetPassword =>
        notifier
            .submitNewPassword(
              password: _controllers.password.text,
              confirmPassword: _controllers.confirmPassword.text,
            )
            .then((_) => false),
      AuthMode.login =>
        notifier
            .submitLogin(
              email: _controllers.email.text,
              password: _controllers.password.text,
            )
            .then((r) => r == AuthSubmitResult.success),
      _ =>
        notifier
            .submitRegistration(
              name: _controllers.name.text,
              email: _controllers.email.text,
              password: _controllers.password.text,
              confirmPassword: _controllers.confirmPassword.text,
              gender: _selectedGender,
              dateOfBirth: _selectedDateOfBirth,
            )
            .then((r) => r == AuthSubmitResult.success),
    };

    if (success && mounted) {
      context.go(AppRoutes.dashboard);
    }
  }
}
