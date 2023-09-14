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
      priority: $enumDecodeNullable(_$FilePriorityEnumMap, json['priority']),
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
  writeNotNull('priority', _$FilePriorityEnumMap[instance.priority]);
  writeNotNull('is_seed', instance.isSeed);
  writeNotNull('piece_range', instance.pieceRange);
  writeNotNull('availability', instance.availability);
  return val;
}

const _$FilePriorityEnumMap = {
  FilePriority.ignored: 0,
  FilePriority.normal: 1,
  FilePriority.high: 6,
  FilePriority.maximum: 7,
  FilePriority.mixed: -1,
};
