import 'package:qbittorrent_api/src/network/api_client.dart';
import 'package:qbittorrent_api/src/v2/sync/dto/main_data.dart';
import 'package:qbittorrent_api/src/v2/sync/dto/peers_data.dart';

/// Type definition for a function that generates a Response ID (RID).
typedef RIDGenerator = int? Function();

/// {@template sync_controller}
/// Controller for sync endpoints.
/// {@endtemplate}
class SyncController {
  /// {@macro sync_controller}
  const SyncController(ApiClient apiClient) : _apiClient = apiClient;

  final ApiClient _apiClient;

  /// Get main data
  /// [rid] - Response ID. If not provided, rid=0 will be assumed.
  /// If the given rid is different from the one of last server reply,
  /// full_update will be true (see the server reply details for more info)
  Future<MainData> getMainData({int? rid}) async {
    final response = await _apiClient.get<Map<String, dynamic>>(
      '/sync/maindata',
      params: {'rid': rid},
    );
    return MainData.fromJson(response);
  }

  /// Subscribe to main data changes by polling.
  /// [rid] - Response ID. If not provided, rid=0 will be assumed.
  /// [interval] - The polling interval.
  Stream<MainData> subscribeMainData({
    RIDGenerator? rid,
    Duration interval = const Duration(seconds: 1),
  }) async* {
    yield await getMainData(rid: rid?.call());
    yield* Stream.periodic(interval, (_) => getMainData(rid: rid?.call()))
        .asyncExpand(Stream.fromFuture);
  }

  /// Get torrent peers data
  /// [hash] - Torrent hash
  /// [rid] - Response ID. If not provided, rid=0 will be assumed.
  /// If the given rid is different from the one of last server reply,
  /// full_update will be true (see the server reply details for more info)
  Future<PeersData> getTorrentPeersData({
    required String hash,
    int? rid,
  }) async {
    final response = await _apiClient.get<Map<String, dynamic>>(
      '/sync/torrentPeers',
      params: {'hash': hash, 'rid': rid},
    );
    return PeersData.fromJson(response);
  }

  /// Subscribe to torrent peers data changes by polling.
  /// [hash] - Torrent hash
  /// [rid] - Response ID. If not provided, rid=0 will be assumed.
  /// [interval] - The polling interval.
  Stream<PeersData> subscribeTorrentPeersData({
    required String hash,
    RIDGenerator? rid,
    Duration interval = const Duration(seconds: 1),
  }) async* {
    yield await getTorrentPeersData(hash: hash, rid: rid?.call());
    yield* Stream.periodic(
      interval,
      (_) => getTorrentPeersData(hash: hash, rid: rid?.call()),
    ).asyncExpand(Stream.fromFuture);
  }
}
