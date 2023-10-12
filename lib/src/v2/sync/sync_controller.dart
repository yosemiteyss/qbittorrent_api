import 'package:qbittorrent_api/src/network/api_client.dart';
import 'package:qbittorrent_api/src/v2/sync/dto/main_data.dart';
import 'package:qbittorrent_api/src/v2/sync/dto/peers_data.dart';

typedef RIDGenerator = int? Function();

class SyncController {
  const SyncController(ApiClient apiClient) : _apiClient = apiClient;

  final ApiClient _apiClient;

  /// Get main data
  /// [rid] - Response ID. If not provided, rid=0 will be assumed.
  /// If the given rid is different from the one of last server reply, full_update will be true (see the server reply details for more info)
  Future<MainData> getMainData({int? rid}) async {
    final Map<String, dynamic> data = await _apiClient.get(
      '/sync/maindata',
      params: {'rid': rid},
    );
    return MainData.fromJson(data);
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
  /// If the given rid is different from the one of last server reply, full_update will be true (see the server reply details for more info)
  Future<PeersData> getTorrentPeersData({
    required String hash,
    int? rid,
  }) async {
    final Map<String, dynamic> data = await _apiClient.get(
      '/sync/torrentPeersData',
      params: {'hash': hash, 'rid': rid},
    );
    return PeersData.fromJson(data);
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
