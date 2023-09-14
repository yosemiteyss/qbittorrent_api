// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Log _$LogFromJson(Map<String, dynamic> json) => Log(
      id: json['id'] as int?,
      message: json['message'] as String?,
      timestamp: json['timestamp'] as int?,
      type: $enumDecodeNullable(_$LogTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$LogToJson(Log instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('message', instance.message);
  writeNotNull('timestamp', instance.timestamp);
  writeNotNull('type', _$LogTypeEnumMap[instance.type]);
  return val;
}

const _$LogTypeEnumMap = {
  LogType.normal: 1,
  LogType.info: 2,
  LogType.warning: 4,
  LogType.critical: 8,
};
