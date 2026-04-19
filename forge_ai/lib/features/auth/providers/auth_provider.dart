import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AuthMode { login, register, forgotPassword, forgotPasswordSuccess }

enum AuthSubmitResult { success, invalid }

class AuthValidationResult {
  const AuthValidationResult(this.fieldErrors);

  final Map<String, String> fieldErrors;

  bool get isValid => fieldErrors.isEmpty;
}

class AuthState {
  const AuthState({
    this.mode = AuthMode.login,
    this.isLoading = false,
    this.errorMessage,
    this.fieldErrors = const {},
    this.displayName,
  });

  final AuthMode mode;
  final bool isLoading;
  final String? errorMessage;
  final Map<String, String> fieldErrors;
  final String? displayName;

  AuthState copyWith({
    AuthMode? mode,
    bool? isLoading,
    String? errorMessage,
    Map<String, String>? fieldErrors,
    String? displayName,
    bool clearError = false,
  }) {
    return AuthState(
      mode: mode ?? this.mode,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
      fieldErrors: fieldErrors ?? this.fieldErrors,
      displayName: displayName ?? this.displayName,
    );
  }
}

class AuthNotifier extends Notifier<AuthState> {
  static const _mockDelay = Duration(milliseconds: 450);

  @override
  AuthState build() => const AuthState();

  void switchMode(AuthMode mode) {
    state = state.copyWith(
      mode: mode,
      isLoading: false,
      fieldErrors: {},
      clearError: true,
    );
  }

  AuthValidationResult validateLogin({
    required String email,
    required String password,
  }) {
    final errors = <String, String>{};
    if (!_isValidEmail(email)) {
      errors['email'] = 'Enter a valid email.';
    }
    if (password.trim().length < 6) {
      errors['password'] = 'Use at least 6 characters.';
    }

    final result = AuthValidationResult(errors);
    state = state.copyWith(fieldErrors: errors, clearError: true);
    return result;
  }

  AuthValidationResult validateRegistration({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    final errors = <String, String>{};
    if (name.trim().isEmpty) {
      errors['name'] = 'Enter your name.';
    }
    if (!_isValidEmail(email)) {
      errors['email'] = 'Enter a valid email.';
    }
    if (password.trim().length < 6) {
      errors['password'] = 'Use at least 6 characters.';
    }
    if (confirmPassword != password) {
      errors['confirmPassword'] = 'Passwords do not match.';
    }

    final result = AuthValidationResult(errors);
    state = state.copyWith(fieldErrors: errors, clearError: true);
    return result;
  }

  Future<AuthSubmitResult> submitLogin({
    required String email,
    required String password,
  }) async {
    final validation = validateLogin(email: email, password: password);
    if (!validation.isValid) {
      state = state.copyWith(
        errorMessage: 'Check your credentials and try again.',
      );
      return AuthSubmitResult.invalid;
    }

    state = state.copyWith(isLoading: true, clearError: true);
    await Future<void>.delayed(_mockDelay);
    state = state.copyWith(isLoading: false, fieldErrors: {}, clearError: true);
    return AuthSubmitResult.success;
  }

  Future<AuthSubmitResult> submitRegistration({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    final validation = validateRegistration(
      name: name,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );
    if (!validation.isValid) {
      state = state.copyWith(errorMessage: 'Complete your athlete profile.');
      return AuthSubmitResult.invalid;
    }

    state = state.copyWith(isLoading: true, clearError: true);
    await Future<void>.delayed(_mockDelay);
    state = state.copyWith(
      isLoading: false,
      fieldErrors: {},
      displayName: name.trim(),
      clearError: true,
    );
    return AuthSubmitResult.success;
  }

  AuthValidationResult validatePasswordReset({
    required String email,
  }) {
    final errors = <String, String>{};
    if (!_isValidEmail(email)) {
      errors['email'] = 'Enter a valid email.';
    }

    final result = AuthValidationResult(errors);
    state = state.copyWith(fieldErrors: errors, clearError: true);
    return result;
  }

  Future<AuthSubmitResult> submitPasswordReset({
    required String email,
  }) async {
    final validation = validatePasswordReset(email: email);
    if (!validation.isValid) {
      state = state.copyWith(
        errorMessage: 'Provide a valid email to reset your access key.',
      );
      return AuthSubmitResult.invalid;
    }

    state = state.copyWith(isLoading: true, clearError: true);
    await Future<void>.delayed(_mockDelay);
    state = state.copyWith(
      isLoading: false,
      fieldErrors: {},
      clearError: true,
      mode: AuthMode.forgotPasswordSuccess,
    );
    return AuthSubmitResult.success;
  }

  bool _isValidEmail(String value) {
    final trimmed = value.trim();
    return trimmed.contains('@') && trimmed.indexOf('@') > 0;
  }
}

final authProvider = NotifierProvider<AuthNotifier, AuthState>(
  AuthNotifier.new,
);
