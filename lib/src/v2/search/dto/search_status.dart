import 'package:json_annotation/json_annotation.dart';
import 'package:qbittorrent_api/src/v2/search/dto/search_job_status.dart';

part 'search_status.g.dart';

/// {@template search_status}
/// Search status.
/// {@endtemplate}
@JsonSerializable()
class SearchStatus {
  /// {@macro search_status}
  const SearchStatus({this.id, this.status, this.total});

  /// Create a new instance from a JSON map.
  factory SearchStatus.fromJson(Map<String, dynamic> json) =>
      _$SearchStatusFromJson(json);

  /// ID of the search job
  @JsonKey(name: 'id')
  final int? id;

  /// Current status of the search job
  @JsonKey(name: 'status')
  final SearchJobStatus? status;

  /// Total number of results.
  /// If the status is [SearchJobStatus.running] this number may continue to increase
  @JsonKey(name: 'total')
  final int? total;

  /// Convert the instance to a JSON map.
  Map<String, dynamic> toJson() => _$SearchStatusToJson(this);
}
