// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'torrent_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TorrentInfo _$TorrentInfoFromJson(Map<String, dynamic> json) => TorrentInfo(
      addedOn: json['added_on'] as int?,
      amountLeft: json['amount_left'] as int?,
      autoTmm: json['auto_tmm'] as bool?,
      availability: json['availability'] as int?,
      category: json['category'] as String?,
      completed: json['completed'] as int?,
      completionOn: json['completion_on'] as int?,
      contentPath: json['content_path'] as String?,
      dlLimit: json['dl_limit'] as int?,
      dlSpeed: json['dlspeed'] as int?,
      downloadPath: json['download_path'] as String?,
      downloaded: json['downloaded'] as int?,
      downloadedSession: json['downloaded_session'] as int?,
      eta: json['eta'] as int?,
      fLPiecePrio: json['f_l_piece_prio'] as bool?,
      forceStart: json['force_start'] as bool?,
      infohashV1: json['infohash_v1'] as String?,
      infohashV2: json['infohash_v2'] as String?,
      hash: json['hash'] as String?,
      lastActivity: json['last_activity'] as int?,
      magnetUri: json['magnet_uri'] as String?,
      maxRatio: json['max_ratio'] as int?,
      maxSeedingTime: json['max_seeding_time'] as int?,
      name: json['name'] as String?,
      numComplete: json['num_complete'] as int?,
      numIncomplete: json['num_incomplete'] as int?,
      numLeechs: json['num_leechs'] as int?,
      numSeeds: json['num_seeds'] as int?,
      priority: json['priority'] as int?,
      progress: (json['progress'] as num?)?.toDouble(),
      ratio: (json['ratio'] as num?)?.toDouble(),
      ratioLimit: (json['ratio_limit'] as num?)?.toDouble(),
      savePath: json['save_path'] as String?,
      seedingTime: json['seeding_time'] as int?,
      seedingTimeLimit: json['seeding_time_limit'] as int?,
      seenComplete: json['seen_complete'] as int?,
      seqDl: json['seq_dl'] as bool?,
      size: json['size'] as int?,
      state: $enumDecodeNullable(_$TorrentStateEnumMap, json['state']),
      superSeeding: json['super_seeding'] as bool?,
      tags: _$JsonConverterFromJson<String, List<String>>(
          json['tags'], const ListItemConverter.comma().fromJson),
      timeActive: json['time_active'] as int?,
      totalSize: json['total_size'] as int?,
      tracker: json['tracker'] as String?,
      trackersCount: json['trackers_count'] as int?,
      upLimit: json['up_limit'] as int?,
      uploaded: json['uploaded'] as int?,
      uploadedSession: json['uploaded_session'] as int?,
      upSpeed: json['upspeed'] as int?,
    );

Map<String, dynamic> _$TorrentInfoToJson(TorrentInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('added_on', instance.addedOn);
  writeNotNull('amount_left', instance.amountLeft);
  writeNotNull('auto_tmm', instance.autoTmm);
  writeNotNull('availability', instance.availability);
  writeNotNull('category', instance.category);
  writeNotNull('completed', instance.completed);
  writeNotNull('completion_on', instance.completionOn);
  writeNotNull('content_path', instance.contentPath);
  writeNotNull('dl_limit', instance.dlLimit);
  writeNotNull('dlspeed', instance.dlSpeed);
  writeNotNull('download_path', instance.downloadPath);
  writeNotNull('downloaded', instance.downloaded);
  writeNotNull('downloaded_session', instance.downloadedSession);
  writeNotNull('eta', instance.eta);
  writeNotNull('f_l_piece_prio', instance.fLPiecePrio);
  writeNotNull('force_start', instance.forceStart);
  writeNotNull('infohash_v1', instance.infohashV1);
  writeNotNull('infohash_v2', instance.infohashV2);
  writeNotNull('hash', instance.hash);
  writeNotNull('last_activity', instance.lastActivity);
  writeNotNull('magnet_uri', instance.magnetUri);
  writeNotNull('max_ratio', instance.maxRatio);
  writeNotNull('max_seeding_time', instance.maxSeedingTime);
  writeNotNull('name', instance.name);
  writeNotNull('num_complete', instance.numComplete);
  writeNotNull('num_incomplete', instance.numIncomplete);
  writeNotNull('num_leechs', instance.numLeechs);
  writeNotNull('num_seeds', instance.numSeeds);
  writeNotNull('priority', instance.priority);
  writeNotNull('progress', instance.progress);
  writeNotNull('ratio', instance.ratio);
  writeNotNull('ratio_limit', instance.ratioLimit);
  writeNotNull('save_path', instance.savePath);
  writeNotNull('seeding_time', instance.seedingTime);
  writeNotNull('seeding_time_limit', instance.seedingTimeLimit);
  writeNotNull('seen_complete', instance.seenComplete);
  writeNotNull('seq_dl', instance.seqDl);
  writeNotNull('size', instance.size);
  writeNotNull('state', _$TorrentStateEnumMap[instance.state]);
  writeNotNull('super_seeding', instance.superSeeding);
  writeNotNull(
      'tags',
      _$JsonConverterToJson<String, List<String>>(
          instance.tags, const ListItemConverter.comma().toJson));
  writeNotNull('time_active', instance.timeActive);
  writeNotNull('total_size', instance.totalSize);
  writeNotNull('tracker', instance.tracker);
  writeNotNull('trackers_count', instance.trackersCount);
  writeNotNull('up_limit', instance.upLimit);
  writeNotNull('uploaded', instance.uploaded);
  writeNotNull('uploaded_session', instance.uploadedSession);
  writeNotNull('upspeed', instance.upSpeed);
  return val;
}

const _$TorrentStateEnumMap = {
  TorrentState.error: 'error',
  TorrentState.missingFiles: 'missingFiles',
  TorrentState.uploading: 'uploading',
  TorrentState.pausedUP: 'pausedUP',
  TorrentState.queuedUP: 'queuedUP',
  TorrentState.stalledUP: 'stalledUP',
  TorrentState.checkingUP: 'checkingUP',
  TorrentState.forcedUP: 'forcedUP',
  TorrentState.allocating: 'allocating',
  TorrentState.downloading: 'downloading',
  TorrentState.metaDL: 'metaDL',
  TorrentState.forcedMetaDL: 'forcedMetaDL',
  TorrentState.pausedDL: 'pausedDL',
  TorrentState.queuedDL: 'queuedDL',
  TorrentState.stalledDL: 'stalledDL',
  TorrentState.checkingDL: 'checkingDL',
  TorrentState.forcedDL: 'forcedDL',
  TorrentState.checkingResumeData: 'checkingResumeData',
  TorrentState.moving: 'moving',
  TorrentState.unknown: 'unknown',
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
