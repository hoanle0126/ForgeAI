import 'package:freezed_annotation/freezed_annotation.dart';

part 'muscle_status.freezed.dart';
part 'muscle_status.g.dart';

@freezed
class MuscleStatus with _$MuscleStatus {
  const MuscleStatus._();

  const factory MuscleStatus({
    required String name,
    required double fatigueLevel, // 0.0 to 10.0
  }) = _MuscleStatus;

  factory MuscleStatus.fromJson(Map<String, dynamic> json) => _$MuscleStatusFromJson(json);

  bool get isOverloaded => fatigueLevel >= 8.0;
}
