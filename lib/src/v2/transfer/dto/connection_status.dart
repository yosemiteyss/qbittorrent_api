import 'package:json_annotation/json_annotation.dart';

enum ConnectionStatus {
  @JsonValue('connected')
  connected,
  @JsonValue('firewalled')
  firewalled,
  @JsonValue('disconnected')
  disconnected,
}
