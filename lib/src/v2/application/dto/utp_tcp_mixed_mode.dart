import 'package:json_annotation/json_annotation.dart';

enum UtpTcpMixedMode {
  /// Prefer TCP.
  @JsonValue(0)
  tcp,

  /// Peer proportional.
  @JsonValue(1)
  peerProportional,
}
