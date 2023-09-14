import 'package:json_annotation/json_annotation.dart';

part 'search_job.g.dart';

@JsonSerializable()
class SearchJob {
  const SearchJob({this.id});

  factory SearchJob.fromJson(Map<String, dynamic> json) =>
      _$SearchJobFromJson(json);

  /// ID of the search job.
  @JsonKey(name: 'id')
  final int? id;

  Map<String, dynamic> toJson() => _$SearchJobToJson(this);
}
