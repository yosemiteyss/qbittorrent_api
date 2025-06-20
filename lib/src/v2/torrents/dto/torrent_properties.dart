import 'package:json_annotation/json_annotation.dart';

part 'torrent_properties.g.dart';

/// {@template torrent_properties}
/// Torrent properties.
/// {@endtemplate}
@JsonSerializable()
class TorrentProperties {
  /// {@macro torrent_properties}
  const TorrentProperties({
    this.savePath,
    this.creationDate,
    this.pieceSize,
    this.comment,
    this.totalWasted,
    this.totalUploaded,
    this.totalUploadedSession,
    this.totalDownloaded,
    this.totalDownloadedSession,
    this.upLimit,
    this.dlLimit,
    this.timeElapsed,
    this.seedingTime,
    this.nbConnections,
    this.nbConnectionsLimit,
    this.shareRatio,
    this.additionDate,
    this.completionDate,
    this.createdBy,
    this.dlSpeedAvg,
    this.dlSpeed,
    this.downloadPath,
    this.eta,
    this.hash,
    this.infohashV1,
    this.infohashV2,
    this.isPrivate,
    this.lastSeen,
    this.name,
    this.peers,
    this.peersTotal,
    this.piecesHave,
    this.piecesNum,
    this.reannounce,
    this.seeds,
    this.seedsTotal,
    this.totalSize,
    this.upSpeedAvg,
    this.upSpeed,
  });

  /// Create a new instance from a JSON map.
  factory TorrentProperties.fromJson(Map<String, dynamic> json) =>
      _$TorrentPropertiesFromJson(json);

  /// Torrent save path
  @JsonKey(name: 'save_path')
  final String? savePath;

  /// Torrent creation date (Unix timestamp)
  @JsonKey(name: 'creation_date')
  final int? creationDate;

  /// Torrent piece size (bytes)
  @JsonKey(name: 'piece_size')
  final int? pieceSize;

  /// Torrent comment
  @JsonKey(name: 'comment')
  final String? comment;

  /// Total data wasted for torrent (bytes)
  @JsonKey(name: 'total_wasted')
  final int? totalWasted;

  /// Total data uploaded for torrent (bytes)
  @JsonKey(name: 'total_uploaded')
  final int? totalUploaded;

  /// Total data uploaded this session (bytes)
  @JsonKey(name: 'total_uploaded_session')
  final int? totalUploadedSession;

  /// Total data downloaded for torrent (bytes)
  @JsonKey(name: 'total_downloaded')
  final int? totalDownloaded;

  /// Total data downloaded this session (bytes)
  @JsonKey(name: 'total_downloaded_session')
  final int? totalDownloadedSession;

  /// Torrent upload limit (bytes/s)
  @JsonKey(name: 'up_limit')
  final int? upLimit;

  /// Torrent download limit (bytes/s)
  @JsonKey(name: 'dl_limit')
  final int? dlLimit;

  /// Torrent elapsed time (seconds)
  @JsonKey(name: 'time_elapsed')
  final int? timeElapsed;

  /// Torrent elapsed time while complete (seconds)
  @JsonKey(name: 'seeding_time')
  final int? seedingTime;

  ///	Torrent connection count
  @JsonKey(name: 'nb_connections')
  final int? nbConnections;

  /// Torrent connection count limit
  @JsonKey(name: 'nb_connections_limit')
  final int? nbConnectionsLimit;

  /// Torrent share ratio
  @JsonKey(name: 'share_ratio')
  final double? shareRatio;

  /// When this torrent was added (Unix timestamp)
  @JsonKey(name: 'addition_date')
  final int? additionDate;

  /// Torrent completion date (Unix timestamp)
  @JsonKey(name: 'completion_date')
  final int? completionDate;

  /// Torrent creator
  @JsonKey(name: 'created_by')
  final String? createdBy;

  /// Torrent average download speed (bytes/second)
  @JsonKey(name: 'dl_speed_avg')
  final int? dlSpeedAvg;

  /// Torrent download speed (bytes/second)
  @JsonKey(name: 'dl_speed')
  final int? dlSpeed;

  @JsonKey(name: 'download_path')
  final String? downloadPath;

  /// Torrent ETA (seconds)
  @JsonKey(name: 'eta')
  final int? eta;

  @JsonKey(name: 'hash')
  final String? hash;

  @JsonKey(name: 'infohash_v1')
  final String? infohashV1;

  @JsonKey(name: 'infohash_v2')
  final String? infohashV2;

  @JsonKey(name: 'is_private')
  final bool? isPrivate;

  /// Last seen complete date (unix timestamp)
  @JsonKey(name: 'last_seen')
  final int? lastSeen;

  @JsonKey(name: 'name')
  final String? name;

  /// Number of peers connected to
  @JsonKey(name: 'peers')
  final int? peers;

  /// Number of peers in the swarm
  @JsonKey(name: 'peers_total')
  final int? peersTotal;

  /// Number of pieces owned
  @JsonKey(name: 'pieces_have')
  final int? piecesHave;

  /// Number of pieces of the torrent
  @JsonKey(name: 'pieces_num')
  final int? piecesNum;

  /// Number of seconds until the next announce
  @JsonKey(name: 'reannounce')
  final int? reannounce;

  /// Number of seeds connected to
  @JsonKey(name: 'seeds')
  final int? seeds;

  /// Number of seeds in the swarm
  @JsonKey(name: 'seeds_total')
  final int? seedsTotal;

  /// Torrent total size (bytes)
  @JsonKey(name: 'total_size')
  final int? totalSize;

  /// Torrent average upload speed (bytes/second)
  @JsonKey(name: 'up_speed_avg')
  final int? upSpeedAvg;

  /// Torrent upload speed (bytes/second)
  @JsonKey(name: 'up_speed')
  final int? upSpeed;

  /// Convert the instance to a JSON map.
  Map<String, dynamic> toJson() => _$TorrentPropertiesToJson(this);
}
