import 'package:json_annotation/json_annotation.dart';

part 'search_job.g.dart';

/// {@template search_job}
/// Search job.
/// {@endtemplate}
@JsonSerializable()
class SearchJob {
  /// {@macro search_job}
  const SearchJob({this.id});

  /// Create a new instance from a JSON map.
  factory SearchJob.fromJson(Map<String, dynamic> json) =>
      _$SearchJobFromJson(json);

  /// ID of the search job.
  @JsonKey(name: 'id')
  final int? id;

  /// Convert this instance to a JSON map.
  Map<String, dynamic> toJson() => _$SearchJobToJson(this);
}
