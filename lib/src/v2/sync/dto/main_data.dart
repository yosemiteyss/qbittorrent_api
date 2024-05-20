import 'package:json_annotation/json_annotation.dart';
import 'package:qbittorrent_api/src/v2/sync/dto/server_state.dart';
import 'package:qbittorrent_api/src/v2/torrents/dto/category.dart';
import 'package:qbittorrent_api/src/v2/torrents/dto/torrent_info.dart';

part 'main_data.g.dart';

@JsonSerializable()
class MainData {
  const MainData({
    this.rid,
    this.fullUpdate,
    this.torrents,
    this.torrentsRemoved,
    this.categories,
    this.categoriesRemoved,
    this.tags,
    this.tagsRemoved,
    this.serverState,
    this.trackers,
    this.trackersRemoved,
  });

  factory MainData.fromJson(Map<String, dynamic> json) =>
      _$MainDataFromJson(json);

  /// Response ID
  @JsonKey(name: 'rid')
  final int? rid;

  /// Whether the response contains all the data or partial data
  @JsonKey(name: 'full_update')
  final bool? fullUpdate;

  /// Property: torrent hash, value: same as torrent list
  @JsonKey(name: 'torrents')
  final Map<String, TorrentInfo>? torrents;

  /// List of hashes of torrents removed since last request
  @JsonKey(name: 'torrents_removed')
  final List<String>? torrentsRemoved;

  /// Info for categories added since last request
  @JsonKey(name: 'categories')
  final Map<String, Category>? categories;

  /// List of categories removed since last request
  @JsonKey(name: 'categories_removed')
  final List<String>? categoriesRemoved;

  /// List of tags added since last request
  @JsonKey(name: 'tags')
  final List<String>? tags;

  /// List of tags removed since last request
  @JsonKey(name: 'tags_removed')
  final List<String>? tagsRemoved;

  /// Global transfer info
  @JsonKey(name: 'server_state')
  final ServerState? serverState;

  @JsonKey(name: 'trackers')
  final Map<String, List<String>>? trackers;

  @JsonKey(name: 'trackers_removed')
  final List<String>? trackersRemoved;

  Map<String, dynamic> toJson() => _$MainDataToJson(this);
}
