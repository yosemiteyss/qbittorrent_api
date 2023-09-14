import 'package:json_annotation/json_annotation.dart';

enum UploadSlotsBehavior {
  /// Fixed slots.
  @JsonValue(0)
  fixed,

  /// Upload rate based.
  @JsonValue(1)
  uploadRate,
}
