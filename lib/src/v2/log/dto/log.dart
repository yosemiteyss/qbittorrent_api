import 'package:json_annotation/json_annotation.dart';
import 'package:qbittorrent_api/src/v2/log/dto/log_type.dart';

part 'log.g.dart';

@JsonSerializable()
class Log {
  const Log({
    this.id,
    this.message,
    this.timestamp,
    this.type,
  });

  factory Log.fromJson(Map<String, dynamic> json) => _$LogFromJson(json);

  /// ID of the message.
  @JsonKey(name: 'id')
  final int? id;

  /// Text of the message.
  @JsonKey(name: 'message')
  final String? message;

  /// Seconds since epoch (Note: switched from milliseconds to seconds in v4.5.0).
  @JsonKey(name: 'timestamp')
  final int? timestamp;

  /// Type of the message.
  @JsonKey(name: 'type')
  final LogType? type;

  Map<String, dynamic> toJson() => _$LogToJson(this);
}
