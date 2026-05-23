import 'package:forge_ai/data/datasources/remote/api_client.dart';
import 'package:forge_ai/features/dashboard/models/dashboard_home_summary.dart';

class DashboardHomeRepository {
  const DashboardHomeRepository(this._apiClient);

  final ApiClient _apiClient;

  Future<DashboardHomeSummary> fetchSummary() async {
    final response = await _apiClient.get<Map<String, dynamic>>(
      '/dashboard/home',
    );
    final data = _readMap(response.data, 'data');
    final home = _readMap(data, 'home');

    if (home.isEmpty) {
      return DashboardHomeSummary.fallback;
    }

    return DashboardHomeSummary.fromJson(home);
  }

  Map<String, dynamic> _readMap(Map<String, dynamic>? source, String key) {
    final value = source?[key];
    if (value is Map<String, dynamic>) {
      return value;
    }
    if (value is Map) {
      return Map<String, dynamic>.from(value);
    }
    return const {};
  }
}
