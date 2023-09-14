import 'package:json_annotation/json_annotation.dart';
import 'package:qbittorrent_api/src/v2/transfer/dto/connection_status.dart';

part 'transfer_info.g.dart';

@JsonSerializable()
class TransferInfo {
  const TransferInfo({
    this.dlInfoSpeed,
    this.dlInfoData,
    this.upInfoSpeed,
    this.upInfoData,
    this.dlRateLimit,
    this.upRateLimit,
    this.dhtNodes,
    this.connectionStatus,
    this.queueing,
    this.useAltSpeedLimits,
    this.refreshInterval,
  });

  factory TransferInfo.fromJson(Map<String, dynamic> json) =>
      _$TransferInfoFromJson(json);

  /// Global download rate (bytes/s)
  @JsonKey(name: 'dl_info_speed')
  final int? dlInfoSpeed;

  /// Data downloaded this session (bytes)
  @JsonKey(name: 'dl_info_data')
  final int? dlInfoData;

  /// Global upload rate (bytes/s)
  @JsonKey(name: 'up_info_speed')
  final int? upInfoSpeed;

  /// Data uploaded this session (bytes)
  @JsonKey(name: 'up_info_data')
  final int? upInfoData;

  /// Download rate limit (bytes/s)
  @JsonKey(name: 'dl_rate_limit')
  final int? dlRateLimit;

  /// Upload rate limit (bytes/s)
  @JsonKey(name: 'up_rate_limit')
  final int? upRateLimit;

  /// DHT nodes connected to
  @JsonKey(name: 'dht_nodes')
  final int? dhtNodes;

  /// Connection status
  @JsonKey(name: 'connection_status')
  final ConnectionStatus? connectionStatus;

  /// True if torrent queueing is enabled
  @JsonKey(name: 'queueing')
  final bool? queueing;

  /// True if alternative speed limits are enabled
  @JsonKey(name: 'use_alt_speed_limits')
  final bool? useAltSpeedLimits;

  /// Transfer list refresh interval (milliseconds)
  @JsonKey(name: 'refresh_interval')
  final int? refreshInterval;

  Map<String, dynamic> toJson() => _$TransferInfoToJson(this);
}
