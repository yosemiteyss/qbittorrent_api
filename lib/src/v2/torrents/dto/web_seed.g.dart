// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_seed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebSeed _$WebSeedFromJson(Map<String, dynamic> json) => WebSeed(
      url: json['url'] as String?,
    );

Map<String, dynamic> _$WebSeedToJson(WebSeed instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('url', instance.url);
  return val;
}
