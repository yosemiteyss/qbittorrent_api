import 'package:json_annotation/json_annotation.dart';

/// {@template tracker_status}
/// Tracker status.
/// {@endtemplate}
enum TrackerStatus {
  /// Tracker is disabled (used for DHT, PeX, and LSD)
  @JsonValue(0)
  disabled,

  /// Tracker has not been contacted yet
  @JsonValue(1)
  notContacted,

  /// Tracker has been contacted and is working
  @JsonValue(2)
  working,

  /// Tracker is updating
  @JsonValue(3)
  updating,

  /// Tracker has been contacted, but it is not working
  /// (or doesn't send proper replies)
  @JsonValue(4)
  notWorking,

  /// Tracker error
  @JsonValue(5)
  trackerError,

  /// Tracker is unreachable
  @JsonValue(6)
  unreachable,
}
