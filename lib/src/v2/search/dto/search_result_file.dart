import 'package:json_annotation/json_annotation.dart';

part 'search_result_file.g.dart';

@JsonSerializable()
class SearchResultFile {
  const SearchResultFile({
    this.descrLink,
    this.fileName,
    this.fileSize,
    this.fileUrl,
    this.nbLeechers,
    this.nbSeeders,
    this.siteUrl,
  });

  factory SearchResultFile.fromJson(Map<String, dynamic> json) =>
      _$SearchResultFileFromJson(json);

  /// URL of the torrent's description page
  @JsonKey(name: 'descrLink')
  final String? descrLink;

  /// Name of the file
  @JsonKey(name: 'fileName')
  final String? fileName;

  /// Size of the file in Bytes
  @JsonKey(name: 'fileSize')
  final int? fileSize;

  /// Torrent download link (usually either .torrent file or magnet link)
  @JsonKey(name: 'fileUrl')
  final String? fileUrl;

  /// Number of leechers
  @JsonKey(name: 'nbLeechers')
  final int? nbLeechers;

  /// Number of seeders
  @JsonKey(name: 'nbSeeders')
  final int? nbSeeders;

  /// URL of the torrent site
  @JsonKey(name: 'siteUrl')
  final String? siteUrl;

  Map<String, dynamic> toJson() => _$SearchResultFileToJson(this);
}
