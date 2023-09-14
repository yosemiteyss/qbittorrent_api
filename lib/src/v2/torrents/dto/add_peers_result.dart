import 'package:json_annotation/json_annotation.dart';

part 'add_peers_result.g.dart';

@JsonSerializable()
class AddPeersResult {
  const AddPeersResult({this.added, this.failed});

  factory AddPeersResult.fromJson(Map<String, dynamic> json) =>
      _$AddPeersResultFromJson(json);

  @JsonKey(name: 'added')
  final int? added;

  @JsonKey(name: 'failed')
  final int? failed;

  Map<String, dynamic> toJson() => _$AddPeersResultToJson(this);
}
