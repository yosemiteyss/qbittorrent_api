import 'package:json_annotation/json_annotation.dart';
import 'package:qbittorrent_api/src/v2/search/dto/plugin_category.dart';

part 'search_plugin.g.dart';

/// {@template search_plugin}
/// Search plugin.
/// {@endtemplate}
@JsonSerializable()
class SearchPlugin {
  /// {@macro search_plugin}
  const SearchPlugin({
    this.enabled,
    this.fullName,
    this.name,
    this.supportedCategories,
    this.url,
    this.version,
  });

  /// Create a new instance from a JSON map.
  factory SearchPlugin.fromJson(Map<String, dynamic> json) =>
      _$SearchPluginFromJson(json);

  /// Whether the plugin is enabled
  @JsonKey(name: 'enabled')
  final bool? enabled;

  /// Full name of the plugin
  @JsonKey(name: 'fullName')
  final String? fullName;

  /// Short name of the plugin
  @JsonKey(name: 'name')
  final String? name;

  /// List of category objects
  @JsonKey(name: 'supportedCategories')
  final List<PluginCategory>? supportedCategories;

  /// URL of the torrent site
  @JsonKey(name: 'url')
  final String? url;

  /// Installed version of the plugin
  @JsonKey(name: 'version')
  final String? version;

  /// Convert this instance to a JSON map.
  Map<String, dynamic> toJson() => _$SearchPluginToJson(this);
}
