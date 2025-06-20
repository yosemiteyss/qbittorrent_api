import 'dart:io';

import 'package:qbittorrent_api/qbittorrent_api.dart';
import 'package:qbittorrent_api/src/network/api_client.dart';

/// {@template auth_controller}
/// Controller for authentication endpoints.
/// {@endtemplate}
class AuthController {
  /// {@macro auth_controller}
  const AuthController(ApiClient apiClient) : _apiClient = apiClient;

  final ApiClient _apiClient;

  /// Login
  Future<void> login({
    required String username,
    required String password,
  }) async {
    final uri = Uri.parse(_apiClient.baseUrl);
    final referer = '${uri.scheme}://${uri.host}:${uri.port}';

    final response = await _apiClient.post<String?>(
      '/auth/login',
      headers: {'Referer': referer},
      body: {
        'username': username,
        'password': password,
      },
    );

    // Throw unauthorized exception here as qBittorrent returns status code 200
    // even if login is failed.
    if (response != 'Ok.') {
      throw const QBittorrentException(
        statusCode: HttpStatus.unauthorized,
        statusMessage: 'Login failed.',
        message: 'Login failed.',
      );
    }
  }

  /// Logout
  Future<void> logout() async {
    await _apiClient.post<void>('/auth/logout');
    await _apiClient.clearCookies();
  }
}
