import 'package:forge_ai/features/auth/providers/auth_provider.dart';

extension AuthModeFormCopy on AuthMode {
  String get formTitle {
    return switch (this) {
      AuthMode.forgotPassword => 'Reset access key',
      AuthMode.register => 'Create athlete profile',
      _ => 'Resume adaptive plan',
    };
  }

  String get submitAction {
    return switch (this) {
      AuthMode.forgotPassword => 'Send reset link',
      AuthMode.register => 'Create profile',
      _ => 'Sign in',
    };
  }

  String get description {
    return switch (this) {
      AuthMode.forgotPassword =>
        'Enter your email to receive a secure reset link.',
      AuthMode.register =>
        'Start with a local profile, then ForgeAI will build the plan.',
      _ => 'Return to your readiness dashboard and today\'s training block.',
    };
  }
}
