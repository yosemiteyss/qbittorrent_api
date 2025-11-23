// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerState _$ServerStateFromJson(Map<String, dynamic> json) => ServerState(
      alltimeDl: (json['alltime_dl'] as num?)?.toInt(),
      alltimeUl: (json['alltime_ul'] as num?)?.toInt(),
      averageTimeQueue: (json['average_time_queue'] as num?)?.toInt(),
      connectionStatus: $enumDecodeNullable(
          _$ConnectionStatusEnumMap, json['connection_status']),
      dhtNodes: (json['dht_nodes'] as num?)?.toInt(),
      dlInfoData: (json['dl_info_data'] as num?)?.toInt(),
      dlInfoSpeed: (json['dl_info_speed'] as num?)?.toInt(),
      dlRateLimit: (json['dl_rate_limit'] as num?)?.toInt(),
      freeSpaceOnDisk: (json['free_space_on_disk'] as num?)?.toInt(),
      globalRatio: json['global_ratio'] as String?,
      queuedIoJobs: (json['queued_io_jobs'] as num?)?.toInt(),
      queueing: json['queueing'] as bool?,
      readCacheHits: json['read_cache_hits'] as String?,
      readCacheOverload: json['read_cache_overload'] as String?,
      refreshInterval: (json['refresh_interval'] as num?)?.toInt(),
      totalBuffersSize: (json['total_buffers_size'] as num?)?.toInt(),
      totalPeerConnections: (json['total_peer_connections'] as num?)?.toInt(),
      totalQueuedSize: (json['total_queued_size'] as num?)?.toInt(),
      totalWastedSession: (json['total_wasted_session'] as num?)?.toInt(),
      upInfoData: (json['up_info_data'] as num?)?.toInt(),
      upInfoSpeed: (json['up_info_speed'] as num?)?.toInt(),
      upRateLimit: (json['up_rate_limit'] as num?)?.toInt(),
      useAltSpeedLimits: json['use_alt_speed_limits'] as bool?,
      writeCacheOverload: json['write_cache_overload'] as String?,
    );

Map<String, dynamic> _$ServerStateToJson(ServerState instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('alltime_dl', instance.alltimeDl);
  writeNotNull('alltime_ul', instance.alltimeUl);
  writeNotNull('average_time_queue', instance.averageTimeQueue);
  writeNotNull('connection_status',
      _$ConnectionStatusEnumMap[instance.connectionStatus]);
  writeNotNull('dht_nodes', instance.dhtNodes);
  writeNotNull('dl_info_data', instance.dlInfoData);
  writeNotNull('dl_info_speed', instance.dlInfoSpeed);
  writeNotNull('dl_rate_limit', instance.dlRateLimit);
  writeNotNull('free_space_on_disk', instance.freeSpaceOnDisk);
  writeNotNull('global_ratio', instance.globalRatio);
  writeNotNull('queued_io_jobs', instance.queuedIoJobs);
  writeNotNull('queueing', instance.queueing);
  writeNotNull('read_cache_hits', instance.readCacheHits);
  writeNotNull('read_cache_overload', instance.readCacheOverload);
  writeNotNull('refresh_interval', instance.refreshInterval);
  writeNotNull('total_buffers_size', instance.totalBuffersSize);
  writeNotNull('total_peer_connections', instance.totalPeerConnections);
  writeNotNull('total_queued_size', instance.totalQueuedSize);
  writeNotNull('total_wasted_session', instance.totalWastedSession);
  writeNotNull('up_info_data', instance.upInfoData);
  writeNotNull('up_info_speed', instance.upInfoSpeed);
  writeNotNull('up_rate_limit', instance.upRateLimit);
  writeNotNull('use_alt_speed_limits', instance.useAltSpeedLimits);
  writeNotNull('write_cache_overload', instance.writeCacheOverload);
  return val;
}

const _$ConnectionStatusEnumMap = {
  ConnectionStatus.connected: 'connected',
  ConnectionStatus.firewalled: 'firewalled',
  ConnectionStatus.disconnected: 'disconnected',
};
