import 'package:qbittorrent_api/src/network/api_client.dart';

/// {@template rss_controller}
/// Controller for RSS endpoints.
/// {@endtemplate}
class RSSController {
  /// {@macro rss_controller}
  const RSSController(ApiClient apiClient) : _apiClient = apiClient;

  final ApiClient _apiClient;

  /// Add folder
  /// [path] - Full path of added folder
  Future<void> addFolder({required String path}) async {
    await _apiClient.post<void>(
      '/rss/addFolder',
      body: {'path': path},
    );
  }

  /// Add feed
  /// [url] - URL of RSS feed
  /// [path] - Full path of added feed
  Future<void> addPath({required String url, String? path}) async {
    await _apiClient.post<void>(
      '/rss/addPath',
      body: {'url': url, 'path': path},
    );
  }

  /// Removes item
  /// Removes folder or feed.
  /// [path] - Full path of removed item
  Future<void> removeItem({required String path}) async {
    await _apiClient.post<void>(
      '/rss/removeItem',
      body: {'path': path},
    );
  }

  /// Move item
  /// Moves/renames folder or feed.
  /// [itemPath] - Current full path of item
  /// [destPath] - New full path of item
  Future<void> moveItem({
    required String itemPath,
    required String destPath,
  }) async {
    await _apiClient.post<void>(
      '/rss/moveItem',
      body: {'itemPath': itemPath, 'destPath': destPath},
    );
  }
}
