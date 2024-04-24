// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'torrent_contents.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TorrentContents _$TorrentContentsFromJson(Map<String, dynamic> json) =>
    TorrentContents(
      index: json['index'] as int?,
      name: json['name'] as String?,
      size: json['size'] as int?,
      progress: (json['progress'] as num?)?.toDouble(),
      priority: json['priority'] as int?,
      isSeed: json['is_seed'] as bool?,
      pieceRange: (json['piece_range'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      availability: (json['availability'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TorrentContentsToJson(TorrentContents instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('index', instance.index);
  writeNotNull('name', instance.name);
  writeNotNull('size', instance.size);
  writeNotNull('progress', instance.progress);
  writeNotNull('priority', instance.priority);
  writeNotNull('is_seed', instance.isSeed);
  writeNotNull('piece_range', instance.pieceRange);
  writeNotNull('availability', instance.availability);
  return val;
}
