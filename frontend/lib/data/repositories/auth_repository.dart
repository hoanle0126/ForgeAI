import 'package:dio/dio.dart';

import 'package:forge_ai/data/datasources/local/token_storage.dart';
import 'package:forge_ai/data/datasources/remote/api_client.dart';
import 'package:forge_ai/data/models/user_profile.dart';

class AuthRepository {
  AuthRepository({required this.apiClient, required this.tokenStorage});

  final ApiClient apiClient;
  final TokenStorage tokenStorage;

  Dio get _dio => apiClient.dio;

  Future<UserProfile> login({
    required String email,
    required String password,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/auth/login',
      data: {'email': email, 'password': password},
    );

    final data = response.data!['data'] as Map<String, dynamic>;
    await tokenStorage.saveTokens(
      accessToken: data['accessToken'] as String,
      refreshToken: data['refreshToken'] as String,
    );

    return UserProfile.fromJson(data['user'] as Map<String, dynamic>);
  }

  Future<UserProfile> register({
    required String fullName,
    required String email,
    required String password,
    required String confirmPassword,
    required String gender,
    required String dateOfBirth,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/auth/register',
      data: {
        'fullName': fullName,
        'email': email,
        'password': password,
        'confirmPassword': confirmPassword,
        'gender': gender,
        'dateOfBirth': dateOfBirth,
      },
    );

    final data = response.data!['data'] as Map<String, dynamic>;
    await tokenStorage.saveTokens(
      accessToken: data['accessToken'] as String,
      refreshToken: data['refreshToken'] as String,
    );

    return UserProfile.fromJson(data['user'] as Map<String, dynamic>);
  }

  Future<UserProfile> getCurrentUser() async {
    final response = await _dio.get<Map<String, dynamic>>('/auth/me');
    final data = response.data!['data'] as Map<String, dynamic>;
    return UserProfile.fromJson(data['user'] as Map<String, dynamic>);
  }

  Future<void> logout() async {
    final refreshToken = tokenStorage.refreshToken;
    if (refreshToken != null) {
      try {
        await _dio.post<void>(
          '/auth/logout',
          data: {'refreshToken': refreshToken},
        );
      } catch (_) {
        // Ignore errors during logout API call
      }
    }
    await tokenStorage.clearTokens();
  }
}
