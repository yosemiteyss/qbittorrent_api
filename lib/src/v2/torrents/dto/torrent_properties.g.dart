// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'torrent_properties.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TorrentProperties _$TorrentPropertiesFromJson(Map<String, dynamic> json) =>
    TorrentProperties(
      savePath: json['save_path'] as String?,
      creationDate: json['creation_date'] as int?,
      pieceSize: json['piece_size'] as int?,
      comment: json['comment'] as String?,
      totalWasted: json['total_wasted'] as int?,
      totalUploaded: json['total_uploaded'] as int?,
      totalUploadedSession: json['total_uploaded_session'] as int?,
      totalDownloaded: json['total_downloaded'] as int?,
      totalDownloadedSession: json['total_downloaded_session'] as int?,
      upLimit: json['up_limit'] as int?,
      dlLimit: json['dl_limit'] as int?,
      timeElapsed: json['time_elapsed'] as int?,
      seedingTime: json['seeding_time'] as int?,
      nbConnections: json['nb_connections'] as int?,
      nbConnectionsLimit: json['nb_connections_limit'] as int?,
      shareRatio: (json['share_ratio'] as num?)?.toDouble(),
      additionDate: json['addition_date'] as int?,
      completionDate: json['completion_date'] as int?,
      createdBy: json['created_by'] as String?,
      dlSpeedAvg: json['dl_speed_avg'] as int?,
      dlSpeed: json['dl_speed'] as int?,
      downloadPath: json['download_path'] as String?,
      eta: json['eta'] as int?,
      hash: json['hash'] as String?,
      infohashV1: json['infohash_v1'] as String?,
      infohashV2: json['infohash_v2'] as String?,
      isPrivate: json['is_private'] as bool?,
      lastSeen: json['last_seen'] as int?,
      name: json['name'] as String?,
      peers: json['peers'] as int?,
      peersTotal: json['peers_total'] as int?,
      piecesHave: json['pieces_have'] as int?,
      piecesNum: json['pieces_num'] as int?,
      reannounce: json['reannounce'] as int?,
      seeds: json['seeds'] as int?,
      seedsTotal: json['seeds_total'] as int?,
      totalSize: json['total_size'] as int?,
      upSpeedAvg: json['up_speed_avg'] as int?,
      upSpeed: json['up_speed'] as int?,
    );

Map<String, dynamic> _$TorrentPropertiesToJson(TorrentProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('save_path', instance.savePath);
  writeNotNull('creation_date', instance.creationDate);
  writeNotNull('piece_size', instance.pieceSize);
  writeNotNull('comment', instance.comment);
  writeNotNull('total_wasted', instance.totalWasted);
  writeNotNull('total_uploaded', instance.totalUploaded);
  writeNotNull('total_uploaded_session', instance.totalUploadedSession);
  writeNotNull('total_downloaded', instance.totalDownloaded);
  writeNotNull('total_downloaded_session', instance.totalDownloadedSession);
  writeNotNull('up_limit', instance.upLimit);
  writeNotNull('dl_limit', instance.dlLimit);
  writeNotNull('time_elapsed', instance.timeElapsed);
  writeNotNull('seeding_time', instance.seedingTime);
  writeNotNull('nb_connections', instance.nbConnections);
  writeNotNull('nb_connections_limit', instance.nbConnectionsLimit);
  writeNotNull('share_ratio', instance.shareRatio);
  writeNotNull('addition_date', instance.additionDate);
  writeNotNull('completion_date', instance.completionDate);
  writeNotNull('created_by', instance.createdBy);
  writeNotNull('dl_speed_avg', instance.dlSpeedAvg);
  writeNotNull('dl_speed', instance.dlSpeed);
  writeNotNull('download_path', instance.downloadPath);
  writeNotNull('eta', instance.eta);
  writeNotNull('hash', instance.hash);
  writeNotNull('infohash_v1', instance.infohashV1);
  writeNotNull('infohash_v2', instance.infohashV2);
  writeNotNull('is_private', instance.isPrivate);
  writeNotNull('last_seen', instance.lastSeen);
  writeNotNull('name', instance.name);
  writeNotNull('peers', instance.peers);
  writeNotNull('peers_total', instance.peersTotal);
  writeNotNull('pieces_have', instance.piecesHave);
  writeNotNull('pieces_num', instance.piecesNum);
  writeNotNull('reannounce', instance.reannounce);
  writeNotNull('seeds', instance.seeds);
  writeNotNull('seeds_total', instance.seedsTotal);
  writeNotNull('total_size', instance.totalSize);
  writeNotNull('up_speed_avg', instance.upSpeedAvg);
  writeNotNull('up_speed', instance.upSpeed);
  return val;
}
