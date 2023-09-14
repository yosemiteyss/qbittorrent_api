// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'peers_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeersLog _$PeersLogFromJson(Map<String, dynamic> json) => PeersLog(
      id: json['id'] as int?,
      ip: json['ip'] as String?,
      timestamp: json['timestamp'] as int?,
      blocked: json['blocked'] as bool?,
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$PeersLogToJson(PeersLog instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('ip', instance.ip);
  writeNotNull('timestamp', instance.timestamp);
  writeNotNull('blocked', instance.blocked);
  writeNotNull('reason', instance.reason);
  return val;
}
