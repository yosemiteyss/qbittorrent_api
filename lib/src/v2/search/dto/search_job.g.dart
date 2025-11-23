// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchJob _$SearchJobFromJson(Map<String, dynamic> json) => SearchJob(
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SearchJobToJson(SearchJob instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  return val;
}
