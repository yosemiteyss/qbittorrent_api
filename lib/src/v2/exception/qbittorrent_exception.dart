/// {@template qbittorrent_exception}
/// Exception thrown by the qBittorrent API.
/// {@endtemplate}
class QBittorrentException implements Exception {
  /// {@macro qbittorrent_exception}
  const QBittorrentException({
    this.statusCode,
    this.statusMessage,
    this.message,
  });

  /// The HTTP status code.
  final int? statusCode;

  /// The HTTP status message.
  final String? statusMessage;

  /// The exception error message.
  final String? message;

  @override
  String toString() {
    return 'QBittorrentException: '
        'statusCode: $statusCode, '
        'statusMessage: $statusMessage, '
        'message: $message';
  }
}
