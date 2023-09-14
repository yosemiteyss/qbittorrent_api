import 'package:json_annotation/json_annotation.dart';

enum ProxyType {
  /// Proxy is disabled.
  @JsonValue(0)
  none,

  /// HTTP proxy without authentication.
  @JsonValue(1)
  http,

  /// SOCKS5 proxy without authentication.
  @JsonValue(2)
  socks5,

  /// HTTP proxy with authentication.
  @JsonValue(3)
  httpAuth,

  /// SOCKS5 proxy with authentication.
  @JsonValue(4)
  socks5Auth,

  /// SOCKS4 proxy without authentication.
  @JsonValue(5)
  socks4,
}
