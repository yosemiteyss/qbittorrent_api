import 'package:qbittorrent_api/src/network/api_client.dart';
import 'package:qbittorrent_api/src/network/cookies_strategy.dart';
import 'package:qbittorrent_api/src/network/dio_client.dart';
import 'package:qbittorrent_api/src/v2/application/application_controller.dart';
import 'package:qbittorrent_api/src/v2/auth/auth_controller.dart';
import 'package:qbittorrent_api/src/v2/log/log_controller.dart';
import 'package:qbittorrent_api/src/v2/search/search_controller.dart';
import 'package:qbittorrent_api/src/v2/sync/sync_controller.dart';
import 'package:qbittorrent_api/src/v2/torrents/torrents_controller.dart';
import 'package:qbittorrent_api/src/v2/transfer/transfer_controller.dart';

/// {@template qbittorrent_api_v2}
/// A client for interacting with the qBittorrent Web API v2.
/// {@endtemplate}
class QBittorrentApiV2 {
  /// {@macro qbittorrent_api_v2}
  /// [baseUrl] - The base url of the qBittorrent server.
  /// [cookiesStrategy] - Strategy for managing cookies. Default is [InMemoryCookiesStrategy].
  /// [cookiePath] - (Deprecated) the path to the cookie file. Set null for Flutter Web application.
  /// [connectTimeout] - Timeout for [ApiClient] to connect to the server.
  /// [receiveTimeout] - Timeout for [ApiClient] to receive data.
  /// [sendTimeout] - Timeout for [ApiClient] to send data.
  /// [logger] - Enable or disable the logger.
  QBittorrentApiV2({
    required String baseUrl,
    CookiesStrategy? cookiesStrategy = const InMemoryCookiesStrategy(),
    @Deprecated(
      'Use cookiesStrategy instead. Will be removed in v2.0.0',
    )
    String? cookiePath,
    Duration connectTimeout = const Duration(seconds: 10),
    Duration receiveTimeout = const Duration(seconds: 10),
    Duration sendTimeout = const Duration(seconds: 10),
    bool logger = false,
  }) {
    // Handle deprecated cookiePath parameter.
    if (cookiePath != null) {
      cookiesStrategy = DiskCookiesStrategy(
        directory: '$cookiePath/.cookies/',
      );
    }

    _apiClient = DioClient(
      baseUrl: '$baseUrl/api/v2',
      cookiesStrategy: cookiesStrategy,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      sendTimeout: sendTimeout,
      logger: logger,
    );

    auth = AuthController(_apiClient);
    application = ApplicationController(_apiClient);
    log = LogController(_apiClient);
    sync = SyncController(_apiClient);
    search = SearchController(_apiClient);
    transfer = TransferController(_apiClient);
    torrents = TorrentsController(_apiClient);
  }

  late final ApiClient _apiClient;

  late final AuthController auth;
  late final ApplicationController application;
  late final LogController log;
  late final SyncController sync;
  late final SearchController search;
  late final TransferController transfer;
  late final TorrentsController torrents;
}
