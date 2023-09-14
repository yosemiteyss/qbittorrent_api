// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'peers_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeersData _$PeersDataFromJson(Map<String, dynamic> json) => PeersData(
      fullUpdate: json['full_update'] as bool?,
      peers: (json['peers'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, PeersInfo.fromJson(e as Map<String, dynamic>)),
      ),
      rid: json['rid'] as int?,
      showFlags: json['show_flags'] as bool?,
    );

Map<String, dynamic> _$PeersDataToJson(PeersData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('full_update', instance.fullUpdate);
  writeNotNull('peers', instance.peers);
  writeNotNull('rid', instance.rid);
  writeNotNull('show_flags', instance.showFlags);
  return val;
}
