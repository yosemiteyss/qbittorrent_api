import 'package:json_annotation/json_annotation.dart';

/// {@template max_ratio_act}
/// Max ratio action.
/// {@endtemplate}
enum MaxRatioAct {
  /// Pause torrent
  @JsonValue(0)
  pause,

  /// Remove torrent
  @JsonValue(1)
  remove,
}
