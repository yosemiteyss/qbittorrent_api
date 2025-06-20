import 'package:json_annotation/json_annotation.dart';

part 'peers_log.g.dart';

/// {@template peers_log}
/// Peers log.
/// {@endtemplate}
@JsonSerializable()
class PeersLog {
  /// {@macro peers_log}
  const PeersLog({
    this.id,
    this.ip,
    this.timestamp,
    this.blocked,
    this.reason,
  });

  /// Creates a new instance from a JSON map.
  factory PeersLog.fromJson(Map<String, dynamic> json) =>
      _$PeersLogFromJson(json);

  /// ID of the peer.
  @JsonKey(name: 'id')
  final int? id;

  /// IP of the peer.
  @JsonKey(name: 'ip')
  final String? ip;

  /// Milliseconds since epoch.
  @JsonKey(name: 'timestamp')
  final int? timestamp;

  /// Whether or not the peer was blocked.
  @JsonKey(name: 'blocked')
  final bool? blocked;

  /// Reason of the block.
  @JsonKey(name: 'reason')
  final String? reason;

  /// Converts this instance to a JSON map.
  Map<String, dynamic> toJson() => _$PeersLogToJson(this);
}
