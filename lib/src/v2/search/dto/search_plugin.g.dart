// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_plugin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchPlugin _$SearchPluginFromJson(Map<String, dynamic> json) => SearchPlugin(
      enabled: json['enabled'] as bool?,
      fullName: json['fullName'] as String?,
      name: json['name'] as String?,
      supportedCategories: (json['supportedCategories'] as List<dynamic>?)
          ?.map((e) => PluginCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      url: json['url'] as String?,
      version: json['version'] as String?,
    );

Map<String, dynamic> _$SearchPluginToJson(SearchPlugin instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('enabled', instance.enabled);
  writeNotNull('fullName', instance.fullName);
  writeNotNull('name', instance.name);
  writeNotNull('supportedCategories', instance.supportedCategories);
  writeNotNull('url', instance.url);
  writeNotNull('version', instance.version);
  return val;
}
