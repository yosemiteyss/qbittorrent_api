// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'torrent_list_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TorrentListOptions _$TorrentListOptionsFromJson(Map<String, dynamic> json) =>
    TorrentListOptions(
      filter: $enumDecodeNullable(_$TorrentFilterEnumMap, json['filter']),
      category: json['category'] as String?,
      tag: json['tag'] as String?,
      sort: $enumDecodeNullable(_$TorrentSortEnumMap, json['sort']),
      reverse: json['reverse'] as bool?,
      limit: json['limit'] as int?,
      offset: json['offset'] as int?,
      hashes: _$JsonConverterFromJson<String, List<String>>(
          json['hashes'], const ListItemConverter.bar().fromJson),
    );

Map<String, dynamic> _$TorrentListOptionsToJson(TorrentListOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('filter', _$TorrentFilterEnumMap[instance.filter]);
  writeNotNull('category', instance.category);
  writeNotNull('tag', instance.tag);
  writeNotNull('sort', _$TorrentSortEnumMap[instance.sort]);
  writeNotNull('reverse', instance.reverse);
  writeNotNull('limit', instance.limit);
  writeNotNull('offset', instance.offset);
  writeNotNull(
      'hashes',
      _$JsonConverterToJson<String, List<String>>(
          instance.hashes, const ListItemConverter.bar().toJson));
  return val;
}

const _$TorrentFilterEnumMap = {
  TorrentFilter.all: 'all',
  TorrentFilter.downloading: 'downloading',
  TorrentFilter.seeding: 'seeding',
  TorrentFilter.completed: 'completed',
  TorrentFilter.paused: 'paused',
  TorrentFilter.active: 'active',
  TorrentFilter.inactive: 'inactive',
  TorrentFilter.resumed: 'resumed',
  TorrentFilter.stalled: 'stalled',
  TorrentFilter.stalledUploading: 'stalledUploading',
  TorrentFilter.stalledDownloading: 'stalledDownloading',
  TorrentFilter.checking: 'checking',
  TorrentFilter.moving: 'moving',
  TorrentFilter.errored: 'errored',
};

const _$TorrentSortEnumMap = {
  TorrentSort.addedOn: 'addedOn',
  TorrentSort.amountLeft: 'amountLeft',
  TorrentSort.autoTmm: 'autoTmm',
  TorrentSort.availability: 'availability',
  TorrentSort.category: 'category',
  TorrentSort.completed: 'completed',
  TorrentSort.completionOn: 'completionOn',
  TorrentSort.contentPath: 'contentPath',
  TorrentSort.dlLimit: 'dlLimit',
  TorrentSort.dlSpeed: 'dlSpeed',
  TorrentSort.downloaded: 'downloaded',
  TorrentSort.downloadedSession: 'downloadedSession',
  TorrentSort.eta: 'eta',
  TorrentSort.fLPiecePrio: 'fLPiecePrio',
  TorrentSort.forceStart: 'forceStart',
  TorrentSort.hash: 'hash',
  TorrentSort.lastActivity: 'lastActivity',
  TorrentSort.magnetUri: 'magnetUri',
  TorrentSort.maxRatio: 'maxRatio',
  TorrentSort.maxSeedingTime: 'maxSeedingTime',
  TorrentSort.name: 'name',
  TorrentSort.numComplete: 'numComplete',
  TorrentSort.numIncomplete: 'numIncomplete',
  TorrentSort.numLeechs: 'numLeechs',
  TorrentSort.numSeeds: 'numSeeds',
  TorrentSort.priority: 'priority',
  TorrentSort.progress: 'progress',
  TorrentSort.ratio: 'ratio',
  TorrentSort.ratioLimit: 'ratioLimit',
  TorrentSort.savePath: 'savePath',
  TorrentSort.seedingTime: 'seedingTime',
  TorrentSort.seedingTimeLimit: 'seedingTimeLimit',
  TorrentSort.seenComplete: 'seenComplete',
  TorrentSort.seqDl: 'seqDl',
  TorrentSort.size: 'size',
  TorrentSort.state: 'state',
  TorrentSort.superSeeding: 'superSeeding',
  TorrentSort.tags: 'tags',
  TorrentSort.timeActive: 'timeActive',
  TorrentSort.totalSize: 'totalSize',
  TorrentSort.tracker: 'tracker',
  TorrentSort.upLimit: 'upLimit',
  TorrentSort.uploaded: 'uploaded',
  TorrentSort.uploadedSession: 'uploadedSession',
  TorrentSort.upSpeed: 'upSpeed',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
