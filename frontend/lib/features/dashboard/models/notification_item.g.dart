// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationItemImpl _$$NotificationItemImplFromJson(
  Map<String, dynamic> json,
) => _$NotificationItemImpl(
  title: json['title'] as String,
  subtitle: json['subtitle'] as String,
  timeLabel: json['timeLabel'] as String,
  tone: $enumDecode(_$NotificationToneEnumMap, json['tone']),
  isUnread: json['isUnread'] as bool? ?? false,
);

Map<String, dynamic> _$$NotificationItemImplToJson(
  _$NotificationItemImpl instance,
) => <String, dynamic>{
  'title': instance.title,
  'subtitle': instance.subtitle,
  'timeLabel': instance.timeLabel,
  'tone': _$NotificationToneEnumMap[instance.tone]!,
  'isUnread': instance.isUnread,
};

const _$NotificationToneEnumMap = {
  NotificationTone.workout: 'workout',
  NotificationTone.recovery: 'recovery',
  NotificationTone.insight: 'insight',
};
