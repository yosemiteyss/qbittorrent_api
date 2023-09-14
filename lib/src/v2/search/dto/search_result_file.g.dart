// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResultFile _$SearchResultFileFromJson(Map<String, dynamic> json) =>
    SearchResultFile(
      descrLink: json['descrLink'] as String?,
      fileName: json['fileName'] as String?,
      fileSize: json['fileSize'] as int?,
      fileUrl: json['fileUrl'] as String?,
      nbLeechers: json['nbLeechers'] as int?,
      nbSeeders: json['nbSeeders'] as int?,
      siteUrl: json['siteUrl'] as String?,
    );

Map<String, dynamic> _$SearchResultFileToJson(SearchResultFile instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('descrLink', instance.descrLink);
  writeNotNull('fileName', instance.fileName);
  writeNotNull('fileSize', instance.fileSize);
  writeNotNull('fileUrl', instance.fileUrl);
  writeNotNull('nbLeechers', instance.nbLeechers);
  writeNotNull('nbSeeders', instance.nbSeeders);
  writeNotNull('siteUrl', instance.siteUrl);
  return val;
}
