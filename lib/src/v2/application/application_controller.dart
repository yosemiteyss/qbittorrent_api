import 'dart:convert';

import 'package:qbittorrent_api/src/network/api_client.dart';
import 'package:qbittorrent_api/src/v2/application/dto/build_info.dart';
import 'package:qbittorrent_api/src/v2/application/dto/preferences.dart';

/// {@template application_controller}
/// Controller for application endpoints.
/// {@endtemplate}
class ApplicationController {
  /// {@macro application_controller}
  const ApplicationController(ApiClient apiClient) : _apiClient = apiClient;

  final ApiClient _apiClient;

  /// Get application version
  Future<String?> getApplicationVersion() async {
    final response = await _apiClient.get<String?>('/app/version');
    return response;
  }

  /// Get API version
  Future<String?> getWebAPIVersion() async {
    final response = await _apiClient.get<String?>('/app/webapiVersion');
    return response;
  }

  /// Get build info
  Future<BuildInfo> getBuildInfo() async {
    final response =
        await _apiClient.get<Map<String, dynamic>>('/app/buildInfo');
    return BuildInfo.fromJson(response);
  }

  /// Shutdown application
  Future<void> shutdown() async {
    await _apiClient.post<void>('/app/shutdown');
  }

  /// Get application preferences
  Future<Preferences> getApplicationPreferences() async {
    final response =
        await _apiClient.get<Map<String, dynamic>>('/app/preferences');
    return Preferences.fromJson(response);
  }

  /// Set application preferences
  /// [preferences] - the updated preferences.
  Future<void> setApplicationPreferences(Preferences preferences) async {
    final body = 'json=${jsonEncode(preferences.toJson())}';
    await _apiClient.post<void>('/app/setPreferences', body: body);
  }

  /// Get default save path
  Future<String?> getDefaultSavePath() async {
    final response = await _apiClient.get<String?>('/app/defaultSavePath');
    return response;
  }
}
