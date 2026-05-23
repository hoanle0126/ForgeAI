import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_item.freezed.dart';
part 'notification_item.g.dart';

enum NotificationTone { workout, recovery, insight }

@freezed
class NotificationItem with _$NotificationItem {
  const factory NotificationItem({
    required String title,
    required String subtitle,
    required String timeLabel,
    required NotificationTone tone,
    @Default(false) bool isUnread,
  }) = _NotificationItem;

  factory NotificationItem.fromJson(Map<String, dynamic> json) =>
      _$NotificationItemFromJson(json);
}

const todayNotificationItems = [
  NotificationItem(
    title: 'Upper strength starts in 25 min',
    subtitle: 'Warm up shoulders and keep hinge volume light.',
    timeLabel: 'Now',
    tone: NotificationTone.workout,
    isUnread: true,
  ),
  NotificationItem(
    title: 'Recovery score improved',
    subtitle: 'Sleep quality lifted readiness to 86.',
    timeLabel: '1h',
    tone: NotificationTone.recovery,
    isUnread: true,
  ),
  NotificationItem(
    title: 'ForgeAI adjusted your plan',
    subtitle: 'Posterior chain load is reduced for today.',
    timeLabel: '2h',
    tone: NotificationTone.insight,
  ),
];

const earlierNotificationItems = [
  NotificationItem(
    title: 'Session target nearly complete',
    subtitle: 'One more set block will close today\'s volume goal.',
    timeLabel: 'Yesterday',
    tone: NotificationTone.insight,
  ),
  NotificationItem(
    title: 'Mobility block scheduled',
    subtitle: 'Ten minutes of hip work is ready after training.',
    timeLabel: 'Mon',
    tone: NotificationTone.recovery,
  ),
];
