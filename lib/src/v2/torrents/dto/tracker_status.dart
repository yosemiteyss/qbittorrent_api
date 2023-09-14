import 'package:json_annotation/json_annotation.dart';

enum TrackerStatus {
  /// Tracker is disabled (used for DHT, PeX, and LSD)
  @JsonValue(0)
  disabled,

  /// Tracker has not been contacted yet
  @JsonValue(1)
  notContacted,

  /// Tracker has been contacted and is working
  @JsonValue(2)
  contactedWorking,

  /// Tracker is updating
  @JsonValue(3)
  updating,

  /// Tracker has been contacted, but it is not working (or doesn't send proper replies)
  @JsonValue(4)
  contactedNotWorking,
}
