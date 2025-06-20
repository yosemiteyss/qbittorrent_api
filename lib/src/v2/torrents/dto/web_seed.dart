import 'package:json_annotation/json_annotation.dart';

part 'web_seed.g.dart';

/// {@template web_seed}
/// Web seed.
/// {@endtemplate}
@JsonSerializable()
class WebSeed {
  /// {@macro web_seed}
  const WebSeed({this.url});

  /// Create a new instance from a JSON map.
  factory WebSeed.fromJson(Map<String, dynamic> json) =>
      _$WebSeedFromJson(json);

  /// URL of the web seed
  @JsonKey(name: 'url')
  final String? url;

  /// Convert this instance to a JSON map.
  Map<String, dynamic> toJson() => _$WebSeedToJson(this);
}
