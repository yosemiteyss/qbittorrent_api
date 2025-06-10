import 'dart:io';

import 'package:qbittorrent_api/qbittorrent_api.dart';
import 'package:qbittorrent_api/src/network/api_client.dart';

class AuthController {
  const AuthController(ApiClient apiClient) : _apiClient = apiClient;

  final ApiClient _apiClient;

  /// Login
  Future<void> login({
    required String username,
    required String password,
  }) async {
    final uri = Uri.parse(_apiClient.baseUrl);
    final referer = '${uri.scheme}://${uri.host}:${uri.port}';

    final String data = await _apiClient.post(
      '/auth/login',
      headers: {'Referer': referer},
      body: {
        'username': username,
        'password': password,
      },
      setCookies: true,
    );

    // Throw unauthorized exception here as qBittorrent returns status code 200
    // even if login is failed.
    if (data != 'Ok.') {
      throw const QBittorrentException(
        statusCode: HttpStatus.unauthorized,
        statusMessage: 'Login failed.',
        message: 'Login failed.',
      );
    }
  }

  /// Logout
  Future<void> logout() async {
    await _apiClient.post('/auth/logout');
    await _apiClient.clearCookies();
  }
}
