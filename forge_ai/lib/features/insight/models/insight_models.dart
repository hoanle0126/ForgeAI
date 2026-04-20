import 'package:freezed_annotation/freezed_annotation.dart';

part 'insight_models.freezed.dart';
part 'insight_models.g.dart';

@freezed
class MuscleData with _$MuscleData {
  const factory MuscleData({
    required String id, // corresponds to flutter_body_atlas IDs
    required double volume,
    required double rpe,
  }) = _MuscleData;

  factory MuscleData.fromJson(Map<String, dynamic> json) => _$MuscleDataFromJson(json);
}

@freezed
class InsightMessage with _$InsightMessage {
  const factory InsightMessage({
    required String id,
    required String content,
    required bool isUser,
    @Default(false) bool hasChart,
  }) = _InsightMessage;

  factory InsightMessage.fromJson(Map<String, dynamic> json) => _$InsightMessageFromJson(json);
}
