import 'package:json_annotation/json_annotation.dart';

part 'peers_info.g.dart';

@JsonSerializable()
class PeersInfo {
  const PeersInfo({
    this.client,
    this.connection,
    this.country,
    this.countryCode,
    this.dlSpeed,
    this.downloaded,
    this.files,
    this.flags,
    this.flagsDesc,
    this.ip,
    this.peerIdClient,
    this.port,
    this.progress,
    this.relevance,
    this.upSpeed,
    this.uploaded,
  });

  factory PeersInfo.fromJson(Map<String, dynamic> json) =>
      _$PeersInfoFromJson(json);

  @JsonKey(name: 'client')
  final String? client;

  @JsonKey(name: 'connection')
  final String? connection;

  @JsonKey(name: 'country')
  final String? country;

  @JsonKey(name: 'country_code')
  final String? countryCode;

  @JsonKey(name: 'dl_speed')
  final int? dlSpeed;

  @JsonKey(name: 'downloaded')
  final int? downloaded;

  @JsonKey(name: 'files')
  final String? files;

  @JsonKey(name: 'flags')
  final String? flags;

  @JsonKey(name: 'flags_desc')
  final String? flagsDesc;

  @JsonKey(name: 'ip')
  final String? ip;

  @JsonKey(name: 'peer_id_client')
  final String? peerIdClient;

  @JsonKey(name: 'port')
  final int? port;

  @JsonKey(name: 'progress')
  final double? progress;

  @JsonKey(name: 'relevance')
  final double? relevance;

  @JsonKey(name: 'up_speed')
  final int? upSpeed;

  @JsonKey(name: 'uploaded')
  final int? uploaded;

  Map<String, dynamic> toJson() => _$PeersInfoToJson(this);
}
