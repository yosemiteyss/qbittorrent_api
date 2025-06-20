import 'package:json_annotation/json_annotation.dart';

/// {@template utp_tcp_mixed_mode}
/// UTP TCP mixed mode.
/// {@endtemplate}
enum UtpTcpMixedMode {
  /// Prefer TCP.
  @JsonValue(0)
  tcp,

  /// Peer proportional.
  @JsonValue(1)
  peerProportional,
}
