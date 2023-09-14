import 'package:json_annotation/json_annotation.dart';
import 'package:qbittorrent_api/src/v2/transfer/dto/connection_status.dart';

part 'server_state.g.dart';

@JsonSerializable()
class ServerState {
  const ServerState({
    this.alltimeDl,
    this.alltimeUl,
    this.averageTimeQueue,
    this.connectionStatus,
    this.dhtNodes,
    this.dlInfoData,
    this.dlInfoSpeed,
    this.dlRateLimit,
    this.freeSpaceOnDisk,
    this.globalRatio,
    this.queuedIoJobs,
    this.queueing,
    this.readCacheHits,
    this.readCacheOverload,
    this.refreshInterval,
    this.totalBuffersSize,
    this.totalPeerConnections,
    this.totalQueuedSize,
    this.totalWastedSession,
    this.upInfoData,
    this.upInfoSpeed,
    this.upRateLimit,
    this.useAltSpeedLimits,
    this.writeCacheOverload,
  });

  factory ServerState.fromJson(Map<String, dynamic> json) =>
      _$ServerStateFromJson(json);

  @JsonKey(name: 'alltime_dl')
  final int? alltimeDl;

  @JsonKey(name: 'alltime_ul')
  final int? alltimeUl;

  @JsonKey(name: 'average_time_queue')
  final int? averageTimeQueue;

  @JsonKey(name: 'connection_status')
  final ConnectionStatus? connectionStatus;

  @JsonKey(name: 'dht_nodes')
  final int? dhtNodes;

  @JsonKey(name: 'dl_info_data')
  final int? dlInfoData;

  @JsonKey(name: 'dl_info_speed')
  final int? dlInfoSpeed;

  @JsonKey(name: 'dl_rate_limit')
  final int? dlRateLimit;

  @JsonKey(name: 'free_space_on_disk')
  final int? freeSpaceOnDisk;

  @JsonKey(name: 'global_ratio')
  final String? globalRatio;

  @JsonKey(name: 'queued_io_jobs')
  final int? queuedIoJobs;

  @JsonKey(name: 'queueing')
  final bool? queueing;

  @JsonKey(name: 'read_cache_hits')
  final String? readCacheHits;

  @JsonKey(name: 'read_cache_overload')
  final String? readCacheOverload;

  @JsonKey(name: 'refresh_interval')
  final int? refreshInterval;

  @JsonKey(name: 'total_buffers_size')
  final int? totalBuffersSize;

  @JsonKey(name: 'total_peer_connections')
  final int? totalPeerConnections;

  @JsonKey(name: 'total_queued_size')
  final int? totalQueuedSize;

  @JsonKey(name: 'total_wasted_session')
  final int? totalWastedSession;

  @JsonKey(name: 'up_info_data')
  final int? upInfoData;

  @JsonKey(name: 'up_info_speed')
  final int? upInfoSpeed;

  @JsonKey(name: 'up_rate_limit')
  final int? upRateLimit;

  @JsonKey(name: 'use_alt_speed_limits')
  final bool? useAltSpeedLimits;

  @JsonKey(name: 'write_cache_overload')
  final String? writeCacheOverload;

  Map<String, dynamic> toJson() => _$ServerStateToJson(this);
}
