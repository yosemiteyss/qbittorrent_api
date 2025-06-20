import 'package:json_annotation/json_annotation.dart';

part 'add_peers_result.g.dart';

/// {@template add_peers_result}
/// Add peers result.
/// {@endtemplate}
@JsonSerializable()
class AddPeersResult {
  /// {@macro add_peers_result}
  const AddPeersResult({this.added, this.failed});

  /// Create an instance from a JSON map.
  factory AddPeersResult.fromJson(Map<String, dynamic> json) =>
      _$AddPeersResultFromJson(json);

  @JsonKey(name: 'added')
  final int? added;

  @JsonKey(name: 'failed')
  final int? failed;

  /// Convert the instance to a JSON map.
  Map<String, dynamic> toJson() => _$AddPeersResultToJson(this);
}
