import 'package:json_annotation/json_annotation.dart';

part 'web_seed.g.dart';

@JsonSerializable()
class WebSeed {
  const WebSeed({this.url});

  factory WebSeed.fromJson(Map<String, dynamic> json) =>
      _$WebSeedFromJson(json);

  /// URL of the web seed
  @JsonKey(name: 'url')
  final String? url;

  Map<String, dynamic> toJson() => _$WebSeedToJson(this);
}
