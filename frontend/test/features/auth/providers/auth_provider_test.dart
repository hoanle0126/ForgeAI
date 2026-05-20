import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forge_ai/features/auth/providers/auth_provider.dart';

void main() {
  group('AuthNotifier', () {
    test('defaults to login mode with idle state', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final state = container.read(authProvider);

      expect(state.mode, AuthMode.login);
      expect(state.isLoading, isFalse);
      expect(state.errorMessage, isNull);
    });

    test('switchMode updates mode and clears errors', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final notifier = container.read(authProvider.notifier);

      notifier.validateLogin(email: 'bad', password: '');
      notifier.switchMode(AuthMode.register);
      final state = container.read(authProvider);

      expect(state.mode, AuthMode.register);
      expect(state.errorMessage, isNull);
      expect(state.fieldErrors, isEmpty);
    });

    test('validateLogin reports email and password errors', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final notifier = container.read(authProvider.notifier);

      final result = notifier.validateLogin(email: 'bad', password: '123');

      expect(result.isValid, isFalse);
      expect(result.fieldErrors['email'], 'Enter a valid email.');
      expect(result.fieldErrors['password'], 'Use at least 6 characters.');
    });

    test('validateRegistration reports name, email, and password errors', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final notifier = container.read(authProvider.notifier);

      final result = notifier.validateRegistration(
        name: ' ',
        email: 'bad',
        password: '123',
        confirmPassword: '456',
      );

      expect(result.isValid, isFalse);
      expect(result.fieldErrors['name'], 'Enter your name.');
      expect(result.fieldErrors['email'], 'Enter a valid email.');
      expect(result.fieldErrors['password'], 'Use at least 6 characters.');
      expect(result.fieldErrors['confirmPassword'], 'Passwords do not match.');
    });

    test('validateRegistration reports mismatched confirm password', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final notifier = container.read(authProvider.notifier);

      final result = notifier.validateRegistration(
        name: 'Ari Nguyen',
        email: 'ari@forge.ai',
        password: 'strongpass',
        confirmPassword: 'different',
      );

      expect(result.isValid, isFalse);
      expect(result.fieldErrors['confirmPassword'], 'Passwords do not match.');
    });

    test('submitLogin returns success and clears loading', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final notifier = container.read(authProvider.notifier);

      final result = await notifier.submitLogin(
        email: 'athlete@forge.ai',
        password: 'strongpass',
      );

      expect(result, AuthSubmitResult.success);
      expect(container.read(authProvider).isLoading, isFalse);
      expect(container.read(authProvider).errorMessage, isNull);
    });

    test(
      'submitRegistration returns success and stores display name',
      () async {
        final container = ProviderContainer();
        addTearDown(container.dispose);
        final notifier = container.read(authProvider.notifier);

        final result = await notifier.submitRegistration(
          name: 'Ari Nguyen',
          email: 'ari@forge.ai',
          password: 'password123',
          confirmPassword: 'password123',
          gender: 'male',
          dateOfBirth: DateTime(2000, 1, 1),
        );

        final state = container.read(authProvider);
        expect(result, AuthSubmitResult.success);
        expect(state.displayName, 'Ari Nguyen');
        expect(state.isLoading, isFalse);
      },
    );

    test('validatePasswordReset reports email errors', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final notifier = container.read(authProvider.notifier);

      final result = notifier.validatePasswordReset(email: 'bad');

      expect(result.isValid, isFalse);
      expect(result.fieldErrors['email'], 'Enter a valid email.');
    });

    test(
      'submitPasswordReset returns success and switches to success mode',
      () async {
        final container = ProviderContainer();
        addTearDown(container.dispose);
        final notifier = container.read(authProvider.notifier);

        notifier.switchMode(AuthMode.forgotPassword);
        final result = await notifier.submitPasswordReset(
          email: 'athlete@forge.ai',
        );

        expect(result, AuthSubmitResult.success);
        final state = container.read(authProvider);
        expect(state.isLoading, isFalse);
        expect(state.errorMessage, isNull);
        expect(state.mode, AuthMode.forgotPasswordSuccess);
      },
    );
  });
}
