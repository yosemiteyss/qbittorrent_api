import 'package:json_annotation/json_annotation.dart';

/// {@template log_type}
/// Log type.
/// {@endtemplate}
enum LogType {
  /// Log::NORMAL
  @JsonValue(1)
  normal,

  /// Log::INFO
  @JsonValue(2)
  info,

  /// Log::WARNING
  @JsonValue(4)
  warning,

  /// Log::CRITICAL
  @JsonValue(8)
  critical,
}
