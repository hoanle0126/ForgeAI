import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/data/datasources/local/token_storage.dart';
import 'package:forge_ai/data/datasources/remote/api_client.dart';
import 'package:forge_ai/data/repositories/auth_repository.dart';

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

final tokenStorageProvider = Provider<TokenStorage>((ref) {
  // We'll override this in main() once SharedPreferences is ready
  throw UnimplementedError();
});

final apiClientProvider = Provider<ApiClient>((ref) {
  final tokenStorage = ref.watch(tokenStorageProvider);
  return ApiClient(tokenStorage);
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  final tokenStorage = ref.watch(tokenStorageProvider);
  return AuthRepository(apiClient: apiClient, tokenStorage: tokenStorage);
});

class AuthNotifier extends Notifier<AuthState> {
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

    try {
      final repository = ref.read(authRepositoryProvider);
      final user = await repository.login(email: email, password: password);

      state = state.copyWith(
        isLoading: false,
        fieldErrors: {},
        displayName: user.fullName,
        clearError: true,
      );
      return AuthSubmitResult.success;
    } on DioException catch (e) {
      final message =
          e.response?.data?['message'] ??
          'Login failed. Please check your credentials.';
      state = state.copyWith(
        isLoading: false,
        errorMessage: message.toString(),
      );
      return AuthSubmitResult.invalid;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'An unexpected error occurred.',
      );
      return AuthSubmitResult.invalid;
    }
  }

  Future<AuthSubmitResult> submitRegistration({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required String gender,
    required DateTime dateOfBirth,
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

    try {
      final repository = ref.read(authRepositoryProvider);
      final user = await repository.register(
        fullName: name,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        gender: gender,
        dateOfBirth: dateOfBirth.toIso8601String(),
      );

      state = state.copyWith(
        isLoading: false,
        fieldErrors: {},
        displayName: user.fullName,
        clearError: true,
      );
      return AuthSubmitResult.success;
    } on DioException catch (e) {
      String errorMessage = 'Registration failed. Please try again.';

      // Handle network or CORS errors where there is no response
      if (e.response == null) {
        errorMessage = 'Network error: ${e.message}';
      }
      // Handle backend validation errors gracefully
      else if (e.response?.data?['errors'] != null) {
        final errors = e.response?.data?['errors'] as Map<String, dynamic>;
        if (errors.isNotEmpty) {
          final firstError = errors.values.first;
          if (firstError is List && firstError.isNotEmpty) {
            errorMessage = firstError.first.toString();
          }
        }
      } else if (e.response?.data?['message'] != null) {
        errorMessage = e.response?.data?['message']?.toString() ?? errorMessage;
      }

      state = state.copyWith(isLoading: false, errorMessage: errorMessage);
      return AuthSubmitResult.invalid;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'An unexpected error occurred.',
      );
      return AuthSubmitResult.invalid;
    }
  }

  AuthValidationResult validatePasswordReset({required String email}) {
    final errors = <String, String>{};
    if (!_isValidEmail(email)) {
      errors['email'] = 'Enter a valid email.';
    }

    final result = AuthValidationResult(errors);
    state = state.copyWith(fieldErrors: errors, clearError: true);
    return result;
  }

  Future<AuthSubmitResult> submitPasswordReset({required String email}) async {
    final validation = validatePasswordReset(email: email);
    if (!validation.isValid) {
      state = state.copyWith(
        errorMessage: 'Provide a valid email to reset your access key.',
      );
      return AuthSubmitResult.invalid;
    }

    state = state.copyWith(isLoading: true, clearError: true);

    // NOTE: Backend doesn't have password reset yet, so keeping the mock delay for now.
    // Replace this when backend implements /auth/forgot-password
    await Future<void>.delayed(const Duration(milliseconds: 450));

    state = state.copyWith(
      isLoading: false,
      fieldErrors: {},
      clearError: true,
      mode: AuthMode.forgotPasswordSuccess,
    );
    return AuthSubmitResult.success;
  }

  Future<void> logOut() async {
    try {
      final repository = ref.read(authRepositoryProvider);
      await repository.logout();
    } catch (_) {
      // Ignore API errors, we just want to clear local state
    }

    state = const AuthState();
  }

  bool _isValidEmail(String value) {
    final trimmed = value.trim();
    return trimmed.contains('@') && trimmed.indexOf('@') > 0;
  }
}

final authProvider = NotifierProvider<AuthNotifier, AuthState>(
  AuthNotifier.new,
);
