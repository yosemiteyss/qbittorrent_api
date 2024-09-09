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
  TorrentSort.addedOn: 'added_on',
  TorrentSort.amountLeft: 'amount_left',
  TorrentSort.autoTmm: 'auto_tmm',
  TorrentSort.availability: 'availability',
  TorrentSort.category: 'category',
  TorrentSort.completed: 'completed',
  TorrentSort.completionOn: 'completion_on',
  TorrentSort.contentPath: 'content_path',
  TorrentSort.dlLimit: 'dl_limit',
  TorrentSort.dlSpeed: 'dlspeed',
  TorrentSort.downloaded: 'downloaded',
  TorrentSort.downloadedSession: 'downloaded_session',
  TorrentSort.eta: 'eta',
  TorrentSort.fLPiecePrio: 'f_l_piece_prio',
  TorrentSort.forceStart: 'force_start',
  TorrentSort.hash: 'hash',
  TorrentSort.lastActivity: 'last_activity',
  TorrentSort.magnetUri: 'magnet_uri',
  TorrentSort.maxRatio: 'max_ratio',
  TorrentSort.maxSeedingTime: 'max_seeding_time',
  TorrentSort.name: 'name',
  TorrentSort.numComplete: 'num_complete',
  TorrentSort.numIncomplete: 'num_incomplete',
  TorrentSort.numLeechs: 'num_leechs',
  TorrentSort.numSeeds: 'num_seeds',
  TorrentSort.priority: 'priority',
  TorrentSort.progress: 'progress',
  TorrentSort.ratio: 'ratio',
  TorrentSort.ratioLimit: 'ratio_limit',
  TorrentSort.savePath: 'save_path',
  TorrentSort.seedingTime: 'seeding_time',
  TorrentSort.seedingTimeLimit: 'seeding_time_limit',
  TorrentSort.seenComplete: 'seen_complete',
  TorrentSort.seqDl: 'seq_dl',
  TorrentSort.size: 'size',
  TorrentSort.state: 'state',
  TorrentSort.superSeeding: 'super_seeding',
  TorrentSort.tags: 'tags',
  TorrentSort.timeActive: 'time_active',
  TorrentSort.totalSize: 'total_size',
  TorrentSort.tracker: 'tracker',
  TorrentSort.upLimit: 'up_limit',
  TorrentSort.uploaded: 'uploaded',
  TorrentSort.uploadedSession: 'uploaded_session',
  TorrentSort.upSpeed: 'upspeed',
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
