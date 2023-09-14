import 'package:json_annotation/json_annotation.dart';

enum FilePriority {
  /// Do not download
  @JsonValue(0)
  ignored(0),

  /// Normal priority
  @JsonValue(1)
  normal(1),

  /// High priority
  @JsonValue(6)
  high(6),

  /// Maximal priority
  @JsonValue(7)
  maximum(7),

  /// Mixed priority
  @JsonValue(-1)
  mixed(-1);

  const FilePriority(this.value);

  final int value;
}
