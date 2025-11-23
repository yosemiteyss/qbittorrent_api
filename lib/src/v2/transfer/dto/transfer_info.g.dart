// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransferInfo _$TransferInfoFromJson(Map<String, dynamic> json) => TransferInfo(
      dlInfoSpeed: (json['dl_info_speed'] as num?)?.toInt(),
      dlInfoData: (json['dl_info_data'] as num?)?.toInt(),
      upInfoSpeed: (json['up_info_speed'] as num?)?.toInt(),
      upInfoData: (json['up_info_data'] as num?)?.toInt(),
      dlRateLimit: (json['dl_rate_limit'] as num?)?.toInt(),
      upRateLimit: (json['up_rate_limit'] as num?)?.toInt(),
      dhtNodes: (json['dht_nodes'] as num?)?.toInt(),
      connectionStatus: $enumDecodeNullable(
          _$ConnectionStatusEnumMap, json['connection_status']),
      queueing: json['queueing'] as bool?,
      useAltSpeedLimits: json['use_alt_speed_limits'] as bool?,
      refreshInterval: (json['refresh_interval'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TransferInfoToJson(TransferInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dl_info_speed', instance.dlInfoSpeed);
  writeNotNull('dl_info_data', instance.dlInfoData);
  writeNotNull('up_info_speed', instance.upInfoSpeed);
  writeNotNull('up_info_data', instance.upInfoData);
  writeNotNull('dl_rate_limit', instance.dlRateLimit);
  writeNotNull('up_rate_limit', instance.upRateLimit);
  writeNotNull('dht_nodes', instance.dhtNodes);
  writeNotNull('connection_status',
      _$ConnectionStatusEnumMap[instance.connectionStatus]);
  writeNotNull('queueing', instance.queueing);
  writeNotNull('use_alt_speed_limits', instance.useAltSpeedLimits);
  writeNotNull('refresh_interval', instance.refreshInterval);
  return val;
}

const _$ConnectionStatusEnumMap = {
  ConnectionStatus.connected: 'connected',
  ConnectionStatus.firewalled: 'firewalled',
  ConnectionStatus.disconnected: 'disconnected',
};
