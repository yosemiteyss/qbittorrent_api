import 'package:json_annotation/json_annotation.dart';

/// {@template dyndns_service}
/// Dynamic DNS service.
/// {@endtemplate}
enum DyndnsService {
  /// Use DynDNS
  @JsonValue(0)
  dynDNS,

  /// Use NOIP
  @JsonValue(1)
  noIP,
}
