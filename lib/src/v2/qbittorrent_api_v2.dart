import 'package:qbittorrent_api/src/network/api_client.dart';
import 'package:qbittorrent_api/src/network/dio_client.dart';
import 'package:qbittorrent_api/src/v2/application/application_controller.dart';
import 'package:qbittorrent_api/src/v2/auth/auth_controller.dart';
import 'package:qbittorrent_api/src/v2/log/log_controller.dart';
import 'package:qbittorrent_api/src/v2/sync/sync_controller.dart';
import 'package:qbittorrent_api/src/v2/torrents/torrents_controller.dart';
import 'package:qbittorrent_api/src/v2/transfer/transfer_controller.dart';

class QBittorrentApiV2 {
  /// Class for qBittorrent API v2.
  /// [baseUrl] - The base url of the qBittorrent server.
  /// [cookiePath] - The path to the cookie file. Set null for Flutter Web application.
  /// [connectTimeout] - Timeout for [ApiClient] to connect to the server.
  /// [receiveTimeout] - Timeout for [ApiClient] to receive data.
  /// [sendTimeout] - Timeout for [ApiClient] to send data.
  /// [logger] - Enable or disable the logger.
  QBittorrentApiV2({
    required String baseUrl,
    required String? cookiePath,
    Duration connectTimeout = const Duration(seconds: 10),
    Duration receiveTimeout = const Duration(seconds: 10),
    Duration sendTimeout = const Duration(seconds: 10),
    bool logger = false,
  }) {
    _apiClient = DioClient(
      baseUrl: '$baseUrl/api/v2',
      cookiePath: cookiePath,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      sendTimeout: sendTimeout,
      logger: logger,
    );
    auth = AuthController(_apiClient);
    application = ApplicationController(_apiClient);
    log = LogController(_apiClient);
    sync = SyncController(_apiClient);
    transfer = TransferController(_apiClient);
    torrents = TorrentsController(_apiClient);
  }

  late final ApiClient _apiClient;

  late final AuthController auth;
  late final ApplicationController application;
  late final LogController log;
  late final SyncController sync;
  late final TransferController transfer;
  late final TorrentsController torrents;
}
