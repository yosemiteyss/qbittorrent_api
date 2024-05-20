import 'package:json_annotation/json_annotation.dart';
import 'package:qbittorrent_api/src/v2/sync/dto/peers_info.dart';

part 'peers_data.g.dart';

@JsonSerializable()
class PeersData {
  const PeersData({
    this.fullUpdate,
    this.peers,
    this.peersRemoved,
    this.rid,
    this.showFlags,
  });

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

  Map<String, dynamic> toJson() => _$PeersDataToJson(this);
}
