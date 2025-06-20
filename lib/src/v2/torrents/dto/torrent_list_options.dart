import 'package:json_annotation/json_annotation.dart';
import 'package:qbittorrent_api/src/v2/torrents/dto/torrent_filter.dart';
import 'package:qbittorrent_api/src/v2/torrents/dto/torrent_sort.dart';
import 'package:qbittorrent_api/src/v2/utils/list_item_converter.dart';

part 'torrent_list_options.g.dart';

/// {@template torrent_list_options}
/// Torrent list options.
/// {@endtemplate}
@JsonSerializable()
class TorrentListOptions {
  /// {@macro torrent_list_options}
  const TorrentListOptions({
    this.filter,
    this.category,
    this.tag,
    this.sort,
    this.reverse,
    this.limit,
    this.offset,
    this.hashes,
  });

  /// Create a new instance from a JSON map.
  factory TorrentListOptions.fromJson(Map<String, dynamic> json) =>
      _$TorrentListOptionsFromJson(json);

  /// Filter torrent list by state.
  @JsonKey(name: 'filter')
  final TorrentFilter? filter;

  /// Get torrents with the given category.
  @JsonKey(name: 'category')
  final String? category;

  /// Get torrents with the given tag (empty string means "without tag"; no
  /// "tag" parameter means "any tag.)
  @JsonKey(name: 'tag')
  final String? tag;

  /// Sort torrents by given key.
  @JsonKey(name: 'sort')
  final TorrentSort? sort;

  /// Enable reverse sorting. Defaults to false.
  @JsonKey(name: 'reverse')
  final bool? reverse;

  /// Limit the number of torrents returned
  @JsonValue('limit')
  final int? limit;

  /// Set offset (if less than 0, offset from end)
  @JsonValue('offset')
  final int? offset;

  /// Filter by hashes.
  @JsonValue('hashes')
  @ListItemConverter.bar()
  final List<String>? hashes;

  /// Convert the instance to a JSON map.
  Map<String, dynamic> toJson() => _$TorrentListOptionsToJson(this);
}
