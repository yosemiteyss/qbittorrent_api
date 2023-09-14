import 'package:json_annotation/json_annotation.dart';

part 'plugin_category.g.dart';

@JsonSerializable()
class PluginCategory {
  const PluginCategory({this.id, this.name});

  factory PluginCategory.fromJson(Map<String, dynamic> json) =>
      _$PluginCategoryFromJson(json);

  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'name')
  final String? name;

  Map<String, dynamic> toJson() => _$PluginCategoryToJson(this);
}
