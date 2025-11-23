// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResult _$SearchResultFromJson(Map<String, dynamic> json) => SearchResult(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => SearchResultFile.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: $enumDecodeNullable(_$SearchJobStatusEnumMap, json['status']),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SearchResultToJson(SearchResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('results', instance.results);
  writeNotNull('status', _$SearchJobStatusEnumMap[instance.status]);
  writeNotNull('total', instance.total);
  return val;
}

const _$SearchJobStatusEnumMap = {
  SearchJobStatus.running: 'Running',
  SearchJobStatus.stopped: 'Stopped',
};
