// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'torrent_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TorrentInfo _$TorrentInfoFromJson(Map<String, dynamic> json) => TorrentInfo(
      addedOn: (json['added_on'] as num?)?.toInt(),
      amountLeft: (json['amount_left'] as num?)?.toInt(),
      autoTmm: json['auto_tmm'] as bool?,
      availability: (json['availability'] as num?)?.toDouble(),
      category: json['category'] as String?,
      completed: (json['completed'] as num?)?.toInt(),
      completionOn: (json['completion_on'] as num?)?.toInt(),
      contentPath: json['content_path'] as String?,
      dlLimit: (json['dl_limit'] as num?)?.toInt(),
      dlSpeed: (json['dlspeed'] as num?)?.toInt(),
      downloadPath: json['download_path'] as String?,
      downloaded: (json['downloaded'] as num?)?.toInt(),
      downloadedSession: (json['downloaded_session'] as num?)?.toInt(),
      eta: (json['eta'] as num?)?.toInt(),
      fLPiecePrio: json['f_l_piece_prio'] as bool?,
      forceStart: json['force_start'] as bool?,
      infohashV1: json['infohash_v1'] as String?,
      infohashV2: json['infohash_v2'] as String?,
      hash: json['hash'] as String?,
      lastActivity: (json['last_activity'] as num?)?.toInt(),
      magnetUri: json['magnet_uri'] as String?,
      maxRatio: (json['max_ratio'] as num?)?.toInt(),
      maxSeedingTime: (json['max_seeding_time'] as num?)?.toInt(),
      name: json['name'] as String?,
      numComplete: (json['num_complete'] as num?)?.toInt(),
      numIncomplete: (json['num_incomplete'] as num?)?.toInt(),
      numLeechs: (json['num_leechs'] as num?)?.toInt(),
      numSeeds: (json['num_seeds'] as num?)?.toInt(),
      priority: (json['priority'] as num?)?.toInt(),
      progress: (json['progress'] as num?)?.toDouble(),
      ratio: (json['ratio'] as num?)?.toDouble(),
      ratioLimit: (json['ratio_limit'] as num?)?.toDouble(),
      savePath: json['save_path'] as String?,
      seedingTime: (json['seeding_time'] as num?)?.toInt(),
      seedingTimeLimit: (json['seeding_time_limit'] as num?)?.toInt(),
      seenComplete: (json['seen_complete'] as num?)?.toInt(),
      seqDl: json['seq_dl'] as bool?,
      size: (json['size'] as num?)?.toInt(),
      state: $enumDecodeNullable(_$TorrentStateEnumMap, json['state']),
      superSeeding: json['super_seeding'] as bool?,
      tags: _$JsonConverterFromJson<String, List<String>>(
          json['tags'], const ListItemConverter.comma().fromJson),
      timeActive: (json['time_active'] as num?)?.toInt(),
      totalSize: (json['total_size'] as num?)?.toInt(),
      tracker: json['tracker'] as String?,
      trackersCount: (json['trackers_count'] as num?)?.toInt(),
      upLimit: (json['up_limit'] as num?)?.toInt(),
      uploaded: (json['uploaded'] as num?)?.toInt(),
      uploadedSession: (json['uploaded_session'] as num?)?.toInt(),
      upSpeed: (json['upspeed'] as num?)?.toInt(),
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
  TorrentState.stoppedUP: 'stoppedUP',
  TorrentState.stoppedDL: 'stoppedDL',
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
