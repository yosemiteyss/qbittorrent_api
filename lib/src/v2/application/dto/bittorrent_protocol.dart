import 'package:json_annotation/json_annotation.dart';

/// {@template bittorrent_protocol}
/// Bittorrent protocol.
/// {@endtemplate}
enum BittorrentProtocol {
  /// TCP and UTP
  @JsonValue(0)
  both,

  /// TCP
  @JsonValue(1)
  tcp,

  /// UTP
  @JsonValue(2)
  utp,
}
