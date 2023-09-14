// ignore_for_file: unnecessary_lambdas

import 'package:qbittorrent_api/src/network/api_client.dart';
import 'package:qbittorrent_api/src/v2/search/dto/categories.dart';
import 'package:qbittorrent_api/src/v2/search/dto/plugins.dart';
import 'package:qbittorrent_api/src/v2/search/dto/search_job.dart';
import 'package:qbittorrent_api/src/v2/search/dto/search_plugin.dart';
import 'package:qbittorrent_api/src/v2/search/dto/search_result.dart';
import 'package:qbittorrent_api/src/v2/search/dto/search_status.dart';
import 'package:qbittorrent_api/src/v2/utils/list_item_converter.dart';

class SearchController {
  const SearchController(ApiClient apiClient) : _apiClient = apiClient;

  final ApiClient _apiClient;

  /// Start search
  /// [pattern] - Search pattern
  /// [plugins] - Plugins to use for searching
  /// [categories] - Categories to limit your search to
  Future<SearchJob> startSearch({
    required String pattern,
    required Plugins plugins,
    required Categories categories,
  }) async {
    final Map<String, dynamic> data = await _apiClient.post(
      '/search/start',
      body: {
        'pattern': pattern,
        'category': categories.toRequestString(),
        'plugins': plugins.toRequestString(),
      },
    );
    return SearchJob.fromJson(data);
  }

  /// Stop search
  /// [id] - ID of the search job
  Future<void> stopSearch({required int id}) async {
    await _apiClient.post(
      '/search/stop',
      body: {'id': id},
    );
  }

  /// Get search status
  /// [id] - ID of the search job. If not specified, all search jobs are returned.
  Future<List<SearchStatus>> getSearchStatus({int? id}) async {
    final List<dynamic> data = await _apiClient.post(
      '/search/status',
      body: {'id': id},
    );
    return data.map((e) => SearchStatus.fromJson(e)).toList();
  }

  /// Get search results
  /// [id] - ID of the search job
  /// [limit] - max number of results to return. 0 or negative means no limit
  /// [offset] - result to start at. A negative number means count backwards
  /// (e.g. -2 returns the 2 most recent results)
  Future<SearchResult> getSearchResults({
    required int id,
    required int? limit,
    required int? offset,
  }) async {
    final Map<String, dynamic> data = await _apiClient.post(
      '/search/results',
      body: {
        'id': id,
        'limit': limit,
        'offset': offset,
      },
    );
    return SearchResult.fromJson(data);
  }

  /// Delete search
  /// [id] - ID of the search job
  Future<void> deleteSearch({required int id}) async {
    await _apiClient.post(
      '/search/delete',
      body: {'id': id},
    );
  }

  /// Get search plugins
  Future<List<SearchPlugin>> getPlugins() async {
    final List<dynamic> data = await _apiClient.get('/search/plugins');
    return data.map((e) => SearchPlugin.fromJson(e)).toList();
  }

  /// Install search plugin
  /// [sources] - Url or file path of the plugin to install
  Future<void> installPlugin({required List<String> sources}) async {
    await _apiClient.post(
      '/search/installPlugin',
      body: {
        'sources': const ListItemConverter.bar().toJson(sources),
      },
    );
  }

  /// Uninstall search plugin
  /// [names] - Name of the plugin to uninstall
  Future<void> uninstallPlugin({required List<String> names}) async {
    await _apiClient.post(
      '/search/uninstallPlugin',
      body: {
        'names': const ListItemConverter.bar().toJson(names),
      },
    );
  }

  /// Enable search plugin
  /// [names] - Name of the plugin to enable/disable
  /// [enable] - Whether the plugins should be enabled
  Future<void> enablePlugin({
    required List<String> names,
    required bool enable,
  }) async {
    await _apiClient.post(
      '/search/enablePlugin',
      body: {
        'names': const ListItemConverter.bar().toJson(names),
        'enable': enable,
      },
    );
  }

  /// Update search plugins
  Future<void> updatePlugins() async {
    await _apiClient.post('/search/updatePlugins');
  }
}
