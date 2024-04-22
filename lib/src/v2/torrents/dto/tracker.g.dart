// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tracker _$TrackerFromJson(Map<String, dynamic> json) => Tracker(
      url: json['url'] as String?,
      status: $enumDecodeNullable(_$TrackerStatusEnumMap, json['status']),
      tier: const EmptyStringToInt().fromJson(json['tier']),
      numPeers: json['num_peers'] as int?,
      numSeeds: json['num_seeds'] as int?,
      numLeeches: json['num_leeches'] as int?,
      numDownloaded: json['num_downloaded'] as int?,
      msg: json['msg'] as String?,
    );

Map<String, dynamic> _$TrackerToJson(Tracker instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('url', instance.url);
  writeNotNull('status', _$TrackerStatusEnumMap[instance.status]);
  writeNotNull('tier', const EmptyStringToInt().toJson(instance.tier));
  writeNotNull('num_peers', instance.numPeers);
  writeNotNull('num_seeds', instance.numSeeds);
  writeNotNull('num_leeches', instance.numLeeches);
  writeNotNull('num_downloaded', instance.numDownloaded);
  writeNotNull('msg', instance.msg);
  return val;
}

const _$TrackerStatusEnumMap = {
  TrackerStatus.disabled: 0,
  TrackerStatus.notContacted: 1,
  TrackerStatus.working: 2,
  TrackerStatus.updating: 3,
  TrackerStatus.notWorking: 4,
  TrackerStatus.trackerError: 5,
  TrackerStatus.unreachable: 6,
};
