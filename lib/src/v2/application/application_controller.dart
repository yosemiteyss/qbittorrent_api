import 'dart:convert';

import 'package:qbittorrent_api/src/network/api_client.dart';
import 'package:qbittorrent_api/src/v2/application/dto/build_info.dart';
import 'package:qbittorrent_api/src/v2/application/dto/preferences.dart';

class ApplicationController {
  const ApplicationController(ApiClient apiClient) : _apiClient = apiClient;

  final ApiClient _apiClient;

  /// Get application version
  Future<String?> getApplicationVersion() async {
    return await _apiClient.get('/app/version');
  }

  /// Get API version
  Future<String?> getWebAPIVersion() async {
    return await _apiClient.get('/app/webapiVersion');
  }

  /// Get build info
  Future<BuildInfo> getBuildInfo() async {
    final Map<String, dynamic> data = await _apiClient.get('/app/buildInfo');
    return BuildInfo.fromJson(data);
  }

  /// Shutdown application
  Future<void> shutdown() async {
    await _apiClient.post('/app/shutdown');
  }

  /// Get application preferences
  Future<Preferences> getApplicationPreferences() async {
    final Map<String, dynamic> data = await _apiClient.get('/app/preferences');
    return Preferences.fromJson(data);
  }

  /// Set application preferences
  /// [preferences] - the updated preferences.
  Future<void> setApplicationPreferences(Preferences preferences) async {
    final String request = 'json=${jsonEncode(preferences.toJson())}';
    await _apiClient.post('/app/setPreferences', body: request);
  }

  /// Get default save path
  Future<String?> getDefaultSavePath() async {
    return await _apiClient.get('/app/defaultSavePath');
  }
}
