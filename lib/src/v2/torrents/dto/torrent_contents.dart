import 'package:json_annotation/json_annotation.dart';

part 'torrent_contents.g.dart';

/// {@template torrent_contents}
/// Torrent contents.
/// {@endtemplate}
@JsonSerializable()
class TorrentContents {
  /// {@macro torrent_contents}
  const TorrentContents({
    this.index,
    this.name,
    this.size,
    this.progress,
    this.priority,
    this.isSeed,
    this.pieceRange,
    this.availability,
  });

  /// Create a new instance from a JSON map.
  factory TorrentContents.fromJson(Map<String, dynamic> json) =>
      _$TorrentContentsFromJson(json);

  /// File index
  @JsonKey(name: 'index')
  final int? index;

  /// File name (including relative path)
  @JsonKey(name: 'name')
  final String? name;

  /// File size (bytes)
  @JsonKey(name: 'size')
  final int? size;

  /// File progress (percentage/100)
  @JsonKey(name: 'progress')
  final double? progress;

  /// File priority
  @JsonKey(name: 'priority')
  final int? priority;

  /// True if file is seeding/complete
  @JsonKey(name: 'is_seed')
  final bool? isSeed;

  /// The first number is the starting piece index and
  /// the second number is the ending piece index (inclusive)
  @JsonKey(name: 'piece_range')
  final List<int>? pieceRange;

  /// Percentage of file pieces currently available (percentage/100)
  @JsonKey(name: 'availability')
  final double? availability;

  /// Convert the instance to a JSON map.
  Map<String, dynamic> toJson() => _$TorrentContentsToJson(this);
}
