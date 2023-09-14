/// Exception thrown by the qBittorrent API.
class QBittorrentException implements Exception {
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
