// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_peers_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddPeersResult _$AddPeersResultFromJson(Map<String, dynamic> json) =>
    AddPeersResult(
      added: json['added'] as int?,
      failed: json['failed'] as int?,
    );

Map<String, dynamic> _$AddPeersResultToJson(AddPeersResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('added', instance.added);
  writeNotNull('failed', instance.failed);
  return val;
}
