import 'package:json_annotation/json_annotation.dart';

enum SearchJobStatus {
  @JsonValue('Running')
  running,
  @JsonValue('Stopped')
  stopped,
}
