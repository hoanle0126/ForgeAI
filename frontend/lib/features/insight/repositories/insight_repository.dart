import 'package:forge_ai/data/datasources/remote/api_client.dart';
import 'package:forge_ai/features/insight/models/insight_models.dart';

class InsightOverviewData {
  const InsightOverviewData({
    required this.muscleData,
    required this.muscleAnalyses,
    required this.messages,
    required this.selectedMuscleId,
  });

  final List<MuscleData> muscleData;
  final List<MuscleAnalysis> muscleAnalyses;
  final List<InsightMessage> messages;
  final String selectedMuscleId;
}

abstract class InsightRepository {
  Future<InsightOverviewData> fetchOverview();

  Future<InsightMessage> sendChatMessage({
    required String prompt,
    required String selectedMuscleId,
  });
}

class ApiInsightRepository implements InsightRepository {
  const ApiInsightRepository(this._apiClient);

  final ApiClient _apiClient;

  @override
  Future<InsightOverviewData> fetchOverview() async {
    final response = await _apiClient.get<Map<String, dynamic>>(
      '/ai/insights/overview',
    );
    final data = _readMap(response.data, 'data');
    final overview = _readMap(data, 'overview');

    final analyses = _readList(overview, 'muscleAnalyses')
        .whereType<Map<String, dynamic>>()
        .map(MuscleAnalysis.fromJson)
        .toList(growable: false);
    final selectedMuscleId = _readSelectedMuscleId(overview, analyses);
    final muscleData = _readList(overview, 'muscleData')
        .whereType<Map<String, dynamic>>()
        .map(MuscleData.fromJson)
        .toList(growable: false);
    final messages = _readList(overview, 'messages')
        .whereType<Map<String, dynamic>>()
        .map(InsightMessage.fromJson)
        .toList(growable: false);

    return InsightOverviewData(
      muscleData: muscleData,
      muscleAnalyses: analyses,
      messages: messages.isEmpty
          ? const [
              InsightMessage(
                id: 'insight-initial',
                content: 'No insight message is available yet.',
                isUser: false,
              ),
            ]
          : messages,
      selectedMuscleId: selectedMuscleId,
    );
  }

  @override
  Future<InsightMessage> sendChatMessage({
    required String prompt,
    required String selectedMuscleId,
  }) async {
    final response = await _apiClient.post<Map<String, dynamic>>(
      '/ai/insights/chat',
      data: {'prompt': prompt, 'muscleId': selectedMuscleId},
    );
    final data = _readMap(response.data, 'data');
    final reply = _readMap(data, 'reply');
    return InsightMessage.fromJson(reply);
  }

  String _readSelectedMuscleId(
    Map<String, dynamic> overview,
    List<MuscleAnalysis> analyses,
  ) {
    final selected = overview['selectedMuscleId'];
    if (selected is String && selected.trim().isNotEmpty) {
      return selected;
    }
    if (analyses.isNotEmpty) {
      return analyses.first.muscleId;
    }
    return 'pectoralis_major_r';
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

  List<dynamic> _readList(Map<String, dynamic>? source, String key) {
    final value = source?[key];
    if (value is List<dynamic>) {
      return value;
    }
    return const [];
  }
}
