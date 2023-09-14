// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plugin_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PluginCategory _$PluginCategoryFromJson(Map<String, dynamic> json) =>
    PluginCategory(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$PluginCategoryToJson(PluginCategory instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  return val;
}
