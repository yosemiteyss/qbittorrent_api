import 'package:json_annotation/json_annotation.dart';

/// {@template encryption}
/// Encryption.
/// {@endtemplate}
enum Encryption {
  /// Prefer encryption
  @JsonValue(0)
  prefer,

  /// Force encryption on
  @JsonValue(1)
  forceOn,

  /// Force encryption off
  @JsonValue(2)
  forceOff,
}
