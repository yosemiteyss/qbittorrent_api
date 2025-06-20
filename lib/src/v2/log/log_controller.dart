import 'package:qbittorrent_api/src/network/api_client.dart';
import 'package:qbittorrent_api/src/v2/log/dto/log.dart';
import 'package:qbittorrent_api/src/v2/log/dto/peers_log.dart';

/// {@template log_controller}
/// Controller for log endpoints.
/// {@endtemplate}
class LogController {
  /// {@macro log_controller}
  const LogController(ApiClient apiClient) : _apiClient = apiClient;

  final ApiClient _apiClient;

  /// Get log
  /// [normal] - Include normal messages
  /// [info] - Include info messages
  /// [warning] - Include warning messages
  /// [critical] - Include critical messages
  /// [lastKnownId] - Exclude messages with "message id" <= last_known_id
  /// (default: -1)
  Future<List<Log>> getLogs({
    bool? normal,
    bool? info,
    bool? warning,
    bool? critical,
    int? lastKnownId,
  }) async {
    final response = await _apiClient.get<List<dynamic>>(
      '/log/main',
      params: {
        'normal': normal,
        'info': info,
        'warning': warning,
        'critical': critical,
        'last_known_id': lastKnownId,
      },
    );

    return response
        .map((e) => Log.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// Get peers log
  /// [lastKnownId] - Exclude messages with "message id" <= last_known_id
  /// (default: -1)
  Future<List<PeersLog>> getPeersLogs({int? lastKnownId}) async {
    final response = await _apiClient.get<List<dynamic>>(
      '/log/peers',
      params: {
        'last_known_id': lastKnownId,
      },
    );

    return response
        .map((e) => PeersLog.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
