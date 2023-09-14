// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'build_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuildInfo _$BuildInfoFromJson(Map<String, dynamic> json) => BuildInfo(
      qt: json['qt'] as String?,
      libtorrent: json['libtorrent'] as String?,
      boost: json['boost'] as String?,
      openssl: json['openssl'] as String?,
      bitness: json['bitness'] as int?,
      zlib: json['zlib'] as String?,
    );

Map<String, dynamic> _$BuildInfoToJson(BuildInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('qt', instance.qt);
  writeNotNull('libtorrent', instance.libtorrent);
  writeNotNull('boost', instance.boost);
  writeNotNull('openssl', instance.openssl);
  writeNotNull('bitness', instance.bitness);
  writeNotNull('zlib', instance.zlib);
  return val;
}
