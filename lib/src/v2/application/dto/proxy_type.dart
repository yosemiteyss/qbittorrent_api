/// {@template proxy_type}
/// Proxy type.
/// {@endtemplate}
enum ProxyType {
  /// Proxy is disabled.
  none,

  /// HTTP proxy without authentication.
  http,

  /// SOCKS5 proxy without authentication.
  socks5,

  /// HTTP proxy with authentication.
  httpAuth,

  /// SOCKS5 proxy with authentication.
  socks5Auth,

  /// SOCKS4 proxy without authentication.
  socks4;
}

/// Converts proxy type from JSON.
ProxyType? proxyTypeFromJson(dynamic type) {
  if (type is int) {
    switch (type) {
      case 0:
        return ProxyType.none;
      case 1:
        return ProxyType.http;
      case 2:
        return ProxyType.socks5;
      case 3:
        return ProxyType.httpAuth;
      case 4:
        return ProxyType.socks5Auth;
      case 5:
        return ProxyType.socks4;
    }
  }

  // For api version 4.6.1+, proxy type may returns 'None'.
  if (type is String) {
    for (final proxyType in ProxyType.values) {
      if (proxyType.name.toLowerCase() == type.toLowerCase()) {
        return proxyType;
      }
    }
  }

  return null;
}

/// Converts proxy type to JSON.
int? proxyTypeToJson(ProxyType? type) {
  switch (type) {
    case ProxyType.none:
      return 0;
    case ProxyType.http:
      return 1;
    case ProxyType.socks5:
      return 2;
    case ProxyType.httpAuth:
      return 3;
    case ProxyType.socks5Auth:
      return 4;
    case ProxyType.socks4:
      return 5;
    default:
      return null;
  }
}
