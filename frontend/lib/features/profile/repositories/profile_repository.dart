import 'package:forge_ai/data/datasources/remote/api_client.dart';
import 'package:forge_ai/features/profile/models/profile_summary.dart';

class ProfileRepository {
  const ProfileRepository(this._apiClient);

  final ApiClient _apiClient;

  Future<ProfileSummary> fetchProfile() async {
    final response = await _apiClient.get<Map<String, dynamic>>('/profile');
    final data = response.data?['data'];
    if (data is! Map<String, dynamic>) {
      throw const FormatException('Invalid profile response.');
    }

    final profile = data['profile'];
    if (profile is! Map<String, dynamic>) {
      throw const FormatException('Profile payload is missing.');
    }

    return ProfileSummary.fromJson(profile);
  }

  Future<void> updateProfile({
    required String fullName,
    required String email,
    required String gender,
    required String dateOfBirth,
    double? heightCm,
    double? weightKg,
    double? bodyFatPct,
    double? muscleMass,
  }) async {
    await _apiClient.patch<Map<String, dynamic>>(
      '/profile',
      data: {
        'fullName': fullName,
        'email': email,
        'gender': gender,
        'dateOfBirth': dateOfBirth,
        'heightCm': heightCm,
        'weightKg': weightKg,
        'bodyFatPct': bodyFatPct,
        'muscleMass': muscleMass,
      },
    );
  }
}
