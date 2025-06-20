import 'package:json_annotation/json_annotation.dart';

/// {@template scheduler_days}
/// Scheduler days.
/// {@endtemplate}
enum SchedulerDays {
  /// Every day
  @JsonValue(0)
  everyDay,

  /// Every weekday
  @JsonValue(1)
  weekday,

  /// Every weekend
  @JsonValue(2)
  weekend,

  /// Every Monday
  @JsonValue(3)
  monday,

  /// Every Tuesday
  @JsonValue(4)
  tuesday,

  /// Every Wednesday
  @JsonValue(5)
  wednesday,

  /// Every Thursday
  @JsonValue(6)
  thursday,

  /// Every Friday
  @JsonValue(7)
  friday,

  /// Every Saturday
  @JsonValue(8)
  saturday,

  /// Every Sunday
  @JsonValue(9)
  sunday
}
