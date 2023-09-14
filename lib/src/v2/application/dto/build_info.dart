import 'package:json_annotation/json_annotation.dart';

part 'build_info.g.dart';

@JsonSerializable()
class BuildInfo {
  const BuildInfo({
    this.qt,
    this.libtorrent,
    this.boost,
    this.openssl,
    this.bitness,
    this.zlib,
  });

  factory BuildInfo.fromJson(Map<String, dynamic> json) =>
      _$BuildInfoFromJson(json);

  /// QT version
  @JsonKey(name: 'qt')
  final String? qt;

  /// libtorrent version
  @JsonKey(name: 'libtorrent')
  final String? libtorrent;

  /// Boost version
  @JsonKey(name: 'boost')
  final String? boost;

  /// OpenSSL version
  @JsonKey(name: 'openssl')
  final String? openssl;

  /// Application bitness (e.g. 64-bit).
  @JsonKey(name: 'bitness')
  final int? bitness;

  /// zlib version
  @JsonKey(name: 'zlib')
  final String? zlib;

  Map<String, dynamic> toJson() => _$BuildInfoToJson(this);
}
