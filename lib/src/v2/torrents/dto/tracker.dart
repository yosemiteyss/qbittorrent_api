import 'package:json_annotation/json_annotation.dart';
import 'package:qbittorrent_api/src/v2/torrents/dto/tracker_status.dart';
import 'package:qbittorrent_api/src/v2/utils/empty_string_converter.dart';

part 'tracker.g.dart';

@JsonSerializable()
class Tracker {
  const Tracker({
    this.url,
    this.status,
    this.tier,
    this.numPeers,
    this.numSeeds,
    this.numLeeches,
    this.numDownloaded,
    this.msg,
  });

  factory Tracker.fromJson(Map<String, dynamic> json) =>
      _$TrackerFromJson(json);

  /// Tracker url
  @JsonKey(name: 'url')
  final String? url;

  /// Tracker status
  @JsonKey(name: 'status')
  final TrackerStatus? status;

  /// Tracker priority tier.
  /// Lower tier trackers are tried before higher tiers.
  /// Tier numbers are valid when >= 0, < 0 is used as placeholder when tier
  /// does not exist for special entries (such as DHT).
  @JsonKey(name: 'tier')
  @EmptyStringToInt()
  final int? tier;

  /// Number of peers for current torrent, as reported by the tracker
  @JsonKey(name: 'num_peers')
  final int? numPeers;

  /// Number of seeds for current torrent, as reported by the tracker
  @JsonKey(name: 'num_seeds')
  final int? numSeeds;

  /// Number of leeches for current torrent, as reported by the tracker
  @JsonKey(name: 'num_leeches')
  final int? numLeeches;

  /// Number of completed downloads for current torrent, as reported by the tracker
  @JsonKey(name: 'num_downloaded')
  final int? numDownloaded;

  /// Tracker message (there is no way of knowing what this message is - it's up to tracker admins)
  @JsonKey(name: 'msg')
  final String? msg;

  Map<String, dynamic> toJson() => _$TrackerToJson(this);
}
