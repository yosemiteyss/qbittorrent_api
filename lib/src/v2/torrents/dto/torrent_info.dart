import 'package:json_annotation/json_annotation.dart';
import 'package:qbittorrent_api/src/v2/torrents/dto/torrent_state.dart';
import 'package:qbittorrent_api/src/v2/utils/list_item_converter.dart';

part 'torrent_info.g.dart';

@JsonSerializable()
class TorrentInfo {
  const TorrentInfo({
    this.addedOn,
    this.amountLeft,
    this.autoTmm,
    this.availability,
    this.category,
    this.completed,
    this.completionOn,
    this.contentPath,
    this.dlLimit,
    this.dlSpeed,
    this.downloadPath,
    this.downloaded,
    this.downloadedSession,
    this.eta,
    this.fLPiecePrio,
    this.forceStart,
    this.infohashV1,
    this.infohashV2,
    this.hash,
    this.lastActivity,
    this.magnetUri,
    this.maxRatio,
    this.maxSeedingTime,
    this.name,
    this.numComplete,
    this.numIncomplete,
    this.numLeechs,
    this.numSeeds,
    this.priority,
    this.progress,
    this.ratio,
    this.ratioLimit,
    this.savePath,
    this.seedingTime,
    this.seedingTimeLimit,
    this.seenComplete,
    this.seqDl,
    this.size,
    this.state,
    this.superSeeding,
    this.tags,
    this.timeActive,
    this.totalSize,
    this.tracker,
    this.trackersCount,
    this.upLimit,
    this.uploaded,
    this.uploadedSession,
    this.upSpeed,
  });

  factory TorrentInfo.fromJson(Map<String, dynamic> json) =>
      _$TorrentInfoFromJson(json);

  /// Time (Unix Epoch) when the torrent was added to the client
  @JsonKey(name: 'added_on')
  final int? addedOn;

  /// Amount of data left to download (bytes)
  @JsonKey(name: 'amount_left')
  final int? amountLeft;

  /// Whether this torrent is managed by Automatic Torrent Management
  @JsonKey(name: 'auto_tmm')
  final bool? autoTmm;

  /// Percentage of file pieces currently available
  @JsonKey(name: 'availability')
  final double? availability;

  /// Category of the torrent
  @JsonKey(name: 'category')
  final String? category;

  /// Amount of transfer data completed (bytes)
  @JsonKey(name: 'completed')
  final int? completed;

  /// Time (Unix Epoch) when the torrent completed
  @JsonKey(name: 'completion_on')
  final int? completionOn;

  /// Absolute path of torrent content (root path for multi file torrents, absolute file path for single file torrents)
  @JsonKey(name: 'content_path')
  final String? contentPath;

  /// Torrent download speed limit (bytes/s). -1 if unlimited.
  @JsonKey(name: 'dl_limit')
  final int? dlLimit;

  /// Torrent download speed (bytes/s)
  @JsonKey(name: 'dlspeed')
  final int? dlSpeed;

  @JsonKey(name: 'download_path')
  final String? downloadPath;

  /// Amount of data downloaded
  @JsonKey(name: 'downloaded')
  final int? downloaded;

  /// Amount of data downloaded this session
  @JsonKey(name: 'downloaded_session')
  final int? downloadedSession;

  /// Torrent ETA (seconds)
  @JsonKey(name: 'eta')
  final int? eta;

  /// True if first last piece are prioritized
  @JsonKey(name: 'f_l_piece_prio')
  final bool? fLPiecePrio;

  /// True if force start is enabled for this torrent
  @JsonKey(name: 'force_start')
  final bool? forceStart;

  @JsonKey(name: 'infohash_v1')
  final String? infohashV1;

  @JsonKey(name: 'infohash_v2')
  final String? infohashV2;

  /// Torrent hash
  @JsonKey(name: 'hash')
  final String? hash;

  /// Last time (Unix Epoch) when a chunk was downloaded/uploaded
  @JsonKey(name: 'last_activity')
  final int? lastActivity;

  /// Magnet URI corresponding to this torrent
  @JsonKey(name: 'magnet_uri')
  final String? magnetUri;

  /// Maximum share ratio until torrent is stopped from seeding/uploading
  @JsonKey(name: 'max_ratio')
  final int? maxRatio;

  /// Maximum seeding time (seconds) until torrent is stopped from seeding
  @JsonKey(name: 'max_seeding_time')
  final int? maxSeedingTime;

  /// Torrent name
  @JsonKey(name: 'name')
  final String? name;

  /// Number of seeds in the swarm
  @JsonKey(name: 'num_complete')
  final int? numComplete;

  /// Number of leechers in the swarm
  @JsonKey(name: 'num_incomplete')
  final int? numIncomplete;

  /// Number of leechers connected to
  @JsonKey(name: 'num_leechs')
  final int? numLeechs;

  /// Number of seeds connected to
  @JsonKey(name: 'num_seeds')
  final int? numSeeds;

  /// Torrent priority.
  /// Returns -1 if queuing is disabled or torrent is in seed mode
  @JsonKey(name: 'priority')
  final int? priority;

  /// Torrent progress (percentage/100)
  @JsonKey(name: 'progress')
  final double? progress;

  /// Torrent share ratio. Max ratio value: 9999.
  @JsonKey(name: 'ratio')
  final double? ratio;

  @JsonKey(name: 'ratio_limit')
  final double? ratioLimit;

  /// Path where this torrent's data is stored
  @JsonKey(name: 'save_path')
  final String? savePath;

  /// Torrent elapsed time while complete (seconds)
  @JsonKey(name: 'seeding_time')
  final int? seedingTime;

  @JsonKey(name: 'seeding_time_limit')
  final int? seedingTimeLimit;

  /// Time (Unix Epoch) when this torrent was last seen complete
  @JsonKey(name: 'seen_complete')
  final int? seenComplete;

  /// True if sequential download is enabled
  @JsonKey(name: 'seq_dl')
  final bool? seqDl;

  /// Total size (bytes) of files selected for download
  @JsonKey(name: 'size')
  final int? size;

  /// Torrent state.
  @JsonKey(name: 'state')
  final TorrentState? state;

  /// True if super seeding is enabled
  @JsonKey(name: 'super_seeding')
  final bool? superSeeding;

  /// Comma-concatenated tag list of the torrent
  @JsonKey(name: 'tags')
  @ListItemConverter.comma()
  final List<String>? tags;

  /// Total active time (seconds)
  @JsonKey(name: 'time_active')
  final int? timeActive;

  /// Total size (bytes) of all file in this torrent (including unselected ones)
  @JsonKey(name: 'total_size')
  final int? totalSize;

  /// The first tracker with working status. Returns empty string if no tracker is working.
  @JsonKey(name: 'tracker')
  final String? tracker;

  @JsonKey(name: 'trackers_count')
  final int? trackersCount;

  /// Torrent upload speed limit (bytes/s). -1 if unlimited.
  @JsonKey(name: 'up_limit')
  final int? upLimit;

  /// Amount of data uploaded
  @JsonKey(name: 'uploaded')
  final int? uploaded;

  /// Amount of data uploaded this session
  @JsonKey(name: 'uploaded_session')
  final int? uploadedSession;

  /// Torrent upload speed (bytes/s)
  @JsonKey(name: 'upspeed')
  final int? upSpeed;

  Map<String, dynamic> toJson() => _$TorrentInfoToJson(this);
}
