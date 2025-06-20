import 'package:json_annotation/json_annotation.dart';

/// {@template upload_slots_behavior}
/// Upload slots behavior.
/// {@endtemplate}
enum UploadSlotsBehavior {
  /// Fixed slots.
  @JsonValue(0)
  fixed,

  /// Upload rate based.
  @JsonValue(1)
  uploadRate,
}
