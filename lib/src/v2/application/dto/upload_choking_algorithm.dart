import 'package:json_annotation/json_annotation.dart';

enum UploadChokingAlgorithm {
  /// Round-robin.
  @JsonValue(0)
  roundRobin,

  /// Fastest upload.
  @JsonValue(1)
  fastestUpload,

  /// Anti-leech.
  @JsonValue(2)
  antiLeech,
}
