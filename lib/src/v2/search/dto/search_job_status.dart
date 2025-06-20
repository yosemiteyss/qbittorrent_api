import 'package:json_annotation/json_annotation.dart';

/// {@template search_job_status}
/// Search job status.
/// {@endtemplate}
enum SearchJobStatus {
  /// Running.
  @JsonValue('Running')
  running,

  /// Stopped.
  @JsonValue('Stopped')
  stopped,
}
