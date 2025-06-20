import 'package:json_annotation/json_annotation.dart';
import 'package:qbittorrent_api/src/v2/search/dto/search_job_status.dart';
import 'package:qbittorrent_api/src/v2/search/dto/search_result_file.dart';

part 'search_result.g.dart';

/// {@template search_result}
/// Search result.
/// {@endtemplate}
@JsonSerializable()
class SearchResult {
  /// {@macro search_result}
  const SearchResult({this.results, this.status, this.total});

  /// Create a new instance from a JSON map.
  factory SearchResult.fromJson(Map<String, dynamic> json) =>
      _$SearchResultFromJson(json);

  /// Array of result objects
  @JsonKey(name: 'results')
  final List<SearchResultFile>? results;

  /// Current status of the search job
  @JsonKey(name: 'status')
  final SearchJobStatus? status;

  /// Total number of results.
  /// If the status is [SearchJobStatus.running] this number may continue to
  /// increase.
  @JsonKey(name: 'total')
  final int? total;

  /// Convert the instance to a JSON map.
  Map<String, dynamic> toJson() => _$SearchResultToJson(this);
}
