import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:forge_ai/features/auth/providers/auth_provider.dart';
import 'package:forge_ai/features/dashboard/models/dashboard_home_summary.dart';
import 'package:forge_ai/features/dashboard/repositories/dashboard_home_repository.dart';

final dashboardHomeRepositoryProvider = Provider<DashboardHomeRepository>((
  ref,
) {
  final apiClient = ref.watch(apiClientProvider);
  return DashboardHomeRepository(apiClient);
});

final dashboardHomeProvider = FutureProvider<DashboardHomeSummary>((ref) {
  final repository = ref.watch(dashboardHomeRepositoryProvider);
  return repository.fetchSummary();
});
