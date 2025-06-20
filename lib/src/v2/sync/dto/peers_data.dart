import 'package:json_annotation/json_annotation.dart';
import 'package:qbittorrent_api/src/v2/sync/dto/peers_info.dart';

part 'peers_data.g.dart';

/// {@template peers_data}
/// Peers data.
/// {@endtemplate}
@JsonSerializable()
class PeersData {
  /// {@macro peers_data}
  const PeersData({
    this.fullUpdate,
    this.peers,
    this.peersRemoved,
    this.rid,
    this.showFlags,
  });

  /// Create a new instance from a JSON map.
  factory PeersData.fromJson(Map<String, dynamic> json) =>
      _$PeersDataFromJson(json);

  @JsonKey(name: 'full_update')
  final bool? fullUpdate;

  @JsonKey(name: 'peers')
  final Map<String, PeersInfo>? peers;

  @JsonKey(name: 'peers_removed')
  final List<String>? peersRemoved;

  @JsonKey(name: 'rid')
  final int? rid;

  @JsonKey(name: 'show_flags')
  final bool? showFlags;

  /// Convert the instance to a JSON map.
  Map<String, dynamic> toJson() => _$PeersDataToJson(this);
}
