// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchStatus _$SearchStatusFromJson(Map<String, dynamic> json) => SearchStatus(
      id: json['id'] as int?,
      status: $enumDecodeNullable(_$SearchJobStatusEnumMap, json['status']),
      total: json['total'] as int?,
    );

Map<String, dynamic> _$SearchStatusToJson(SearchStatus instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('status', _$SearchJobStatusEnumMap[instance.status]);
  writeNotNull('total', instance.total);
  return val;
}

const _$SearchJobStatusEnumMap = {
  SearchJobStatus.running: 'Running',
  SearchJobStatus.stopped: 'Stopped',
};
