import 'package:json_annotation/json_annotation.dart';

enum DyndnsService {
  /// Use DynDNS
  @JsonValue(0)
  dynDNS,

  /// Use NOIP
  @JsonValue(1)
  noIP,
}
