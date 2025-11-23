// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainData _$MainDataFromJson(Map<String, dynamic> json) => MainData(
      rid: (json['rid'] as num?)?.toInt(),
      fullUpdate: json['full_update'] as bool?,
      torrents: (json['torrents'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, TorrentInfo.fromJson(e as Map<String, dynamic>)),
      ),
      torrentsRemoved: (json['torrents_removed'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      categories: (json['categories'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Category.fromJson(e as Map<String, dynamic>)),
      ),
      categoriesRemoved: (json['categories_removed'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      tagsRemoved: (json['tags_removed'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      serverState: json['server_state'] == null
          ? null
          : ServerState.fromJson(json['server_state'] as Map<String, dynamic>),
      trackers: (json['trackers'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
      trackersRemoved: (json['trackers_removed'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$MainDataToJson(MainData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('rid', instance.rid);
  writeNotNull('full_update', instance.fullUpdate);
  writeNotNull('torrents', instance.torrents);
  writeNotNull('torrents_removed', instance.torrentsRemoved);
  writeNotNull('categories', instance.categories);
  writeNotNull('categories_removed', instance.categoriesRemoved);
  writeNotNull('tags', instance.tags);
  writeNotNull('tags_removed', instance.tagsRemoved);
  writeNotNull('server_state', instance.serverState);
  writeNotNull('trackers', instance.trackers);
  writeNotNull('trackers_removed', instance.trackersRemoved);
  return val;
}
