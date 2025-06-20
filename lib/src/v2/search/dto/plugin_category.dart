import 'package:json_annotation/json_annotation.dart';

part 'plugin_category.g.dart';

/// {@template plugin_category}
/// Plugin category.
/// {@endtemplate}
@JsonSerializable()
class PluginCategory {
  /// {@macro plugin_category}
  const PluginCategory({this.id, this.name});

  /// Create a new instance from a JSON map.
  factory PluginCategory.fromJson(Map<String, dynamic> json) =>
      _$PluginCategoryFromJson(json);

  /// Plugin category ID.
  @JsonKey(name: 'id')
  final String? id;

  /// Plugin category name.
  @JsonKey(name: 'name')
  final String? name;

  /// Convert this instance to a JSON map.
  Map<String, dynamic> toJson() => _$PluginCategoryToJson(this);
}
