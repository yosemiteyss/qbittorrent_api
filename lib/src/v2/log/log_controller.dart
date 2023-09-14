// ignore_for_file: unnecessary_lambdas

import 'package:qbittorrent_api/src/network/api_client.dart';
import 'package:qbittorrent_api/src/v2/log/dto/log.dart';
import 'package:qbittorrent_api/src/v2/log/dto/peers_log.dart';

class LogController {
  const LogController(ApiClient apiClient) : _apiClient = apiClient;

  final ApiClient _apiClient;

  /// Get log
  /// [normal] - Include normal messages
  /// [info] - Include info messages
  /// [warning] - Include warning messages
  /// [critical] - Include critical messages
  /// [lastKnownId] - Exclude messages with "message id" <= last_known_id (default: -1)
  Future<List<Log>> getLogs({
    bool? normal,
    bool? info,
    bool? warning,
    bool? critical,
    int? lastKnownId,
  }) async {
    final List<dynamic> data = await _apiClient.get(
      '/log/main',
      params: {
        'normal': normal,
        'info': info,
        'warning': warning,
        'critical': critical,
        'last_known_id': lastKnownId,
      },
    );
    return data.map((e) => Log.fromJson(e)).toList();
  }

  /// Get peers log
  /// [lastKnownId] - Exclude messages with "message id" <= last_known_id (default: -1)
  Future<List<PeersLog>> getPeersLogs({int? lastKnownId}) async {
    final List<dynamic> data = await _apiClient.get(
      '/log/peers',
      params: {
        'last_known_id': lastKnownId,
      },
    );
    return data.map((e) => PeersLog.fromJson(e)).toList();
  }
}
