import 'package:json_annotation/json_annotation.dart';

enum MaxRatioAct {
  /// Pause torrent
  @JsonValue(0)
  pause,

  /// Remove torrent
  @JsonValue(1)
  remove,
}
