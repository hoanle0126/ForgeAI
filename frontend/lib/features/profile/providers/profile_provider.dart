import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:forge_ai/features/auth/providers/auth_provider.dart';
import 'package:forge_ai/features/profile/models/profile_summary.dart';
import 'package:forge_ai/features/profile/repositories/profile_repository.dart';

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return ProfileRepository(apiClient);
});

final profileProvider = FutureProvider<ProfileSummary>((ref) {
  final repository = ref.watch(profileRepositoryProvider);
  return repository.fetchProfile();
});
