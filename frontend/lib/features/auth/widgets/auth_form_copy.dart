import 'package:forge_ai/features/auth/providers/auth_provider.dart';

extension AuthModeFormCopy on AuthMode {
  String get formTitle {
    return switch (this) {
      AuthMode.forgotPassword => 'Reset access key',
      AuthMode.verifyResetOtp => 'Verify reset code',
      AuthMode.resetPassword => 'Choose a new password',
      AuthMode.register => 'Create athlete profile',
      _ => 'Resume adaptive plan',
    };
  }

  String get submitAction {
    return switch (this) {
      AuthMode.forgotPassword => 'Send OTP',
      AuthMode.verifyResetOtp => 'Verify OTP',
      AuthMode.resetPassword => 'Update password',
      AuthMode.register => 'Create profile',
      _ => 'Sign in',
    };
  }

  String get description {
    return switch (this) {
      AuthMode.forgotPassword =>
        'Enter your email to receive a secure OTP for password reset.',
      AuthMode.verifyResetOtp =>
        'Enter the 6-digit code sent to your email to continue.',
      AuthMode.resetPassword =>
        'Set a new password for your ForgeAI account.',
      AuthMode.register =>
        'Start with a local profile, then ForgeAI will build the plan.',
      _ => 'Return to your readiness dashboard and today\'s training block.',
    };
  }
}
