import 'package:qbittorrent_api/src/network/api_client.dart';
import 'package:qbittorrent_api/src/v2/transfer/dto/peer.dart';
import 'package:qbittorrent_api/src/v2/transfer/dto/transfer_info.dart';
import 'package:qbittorrent_api/src/v2/utils/list_item_converter.dart';

class TransferController {
  const TransferController(ApiClient apiClient) : _apiClient = apiClient;

  final ApiClient _apiClient;

  /// Get global transfer info
  Future<TransferInfo> getGlobalTransferInfo() async {
    final Map<String, dynamic> data = await _apiClient.get('/transfer/info');
    return TransferInfo.fromJson(data);
  }

  /// Get alternative speed limits state
  /// Return true if alternative speed limits are enabled.
  Future<bool> getAlternativeSpeedLimitsMode() async {
    final String data = await _apiClient.get('/transfer/speedLimitsMode');
    return data == '1';
  }

  /// Toggle alternative speed limits
  Future<void> toggleSpeedLimitsMode() async {
    await _apiClient.post('/transfer/toggleSpeedLimitsMode');
  }

  /// Get global download limit
  /// Return the value of current global download speed limit in bytes/second;
  /// this value will be zero if no limit is applied.
  Future<int> getGlobalDownloadLimit() async {
    final String data = await _apiClient.get('/transfer/downloadLimit');
    return int.parse(data);
  }

  /// Set global download limit
  /// [limit] - The global download speed limit to set in bytes/second
  Future<void> setGlobalDownloadLimit({required int limit}) async {
    await _apiClient.post(
      '/transfer/setDownloadLimit',
      body: {'limit': limit},
    );
  }

  /// Get global upload limit
  /// Return the value of current global upload speed limit in bytes/second;
  /// this value will be zero if no limit is applied.
  Future<int> getGlobalUploadLimit() async {
    final String data = await _apiClient.get('/transfer/uploadLimit');
    return int.parse(data);
  }

  /// Set global upload limit
  /// [limit] - The global upload speed limit to set in bytes/second
  Future<void> setGlobalUploadLimit({required int limit}) async {
    await _apiClient.post(
      '/transfer/setUploadLimit',
      body: {'limit': limit},
    );
  }

  /// Ban peers
  /// [peers] - The peer to ban, or multiple peers
  Future<void> banPeers({required List<Peer> peers}) async {
    await _apiClient.post(
      '/transfer/banPeers',
      body: {
        'peers': const ListItemConverter.bar().toJson(
          peers.map((e) => e.toString()).toList(),
        ),
      },
    );
  }
}
