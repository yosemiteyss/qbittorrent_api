// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'peers_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeersInfo _$PeersInfoFromJson(Map<String, dynamic> json) => PeersInfo(
      client: json['client'] as String?,
      connection: json['connection'] as String?,
      country: json['country'] as String?,
      countryCode: json['country_code'] as String?,
      dlSpeed: json['dl_speed'] as int?,
      downloaded: json['downloaded'] as int?,
      files: json['files'] as String?,
      flags: json['flags'] as String?,
      flagsDesc: json['flags_desc'] as String?,
      ip: json['ip'] as String?,
      peerIdClient: json['peer_id_client'] as String?,
      port: json['port'] as int?,
      progress: (json['progress'] as num?)?.toDouble(),
      relevance: (json['relevance'] as num?)?.toDouble(),
      upSpeed: json['up_speed'] as int?,
      uploaded: json['uploaded'] as int?,
    );

Map<String, dynamic> _$PeersInfoToJson(PeersInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('client', instance.client);
  writeNotNull('connection', instance.connection);
  writeNotNull('country', instance.country);
  writeNotNull('country_code', instance.countryCode);
  writeNotNull('dl_speed', instance.dlSpeed);
  writeNotNull('downloaded', instance.downloaded);
  writeNotNull('files', instance.files);
  writeNotNull('flags', instance.flags);
  writeNotNull('flags_desc', instance.flagsDesc);
  writeNotNull('ip', instance.ip);
  writeNotNull('peer_id_client', instance.peerIdClient);
  writeNotNull('port', instance.port);
  writeNotNull('progress', instance.progress);
  writeNotNull('relevance', instance.relevance);
  writeNotNull('up_speed', instance.upSpeed);
  writeNotNull('uploaded', instance.uploaded);
  return val;
}
