import 'package:qbittorrent_api/src/network/api_client.dart';
import 'package:qbittorrent_api/src/v2/transfer/dto/peer.dart';
import 'package:qbittorrent_api/src/v2/transfer/dto/transfer_info.dart';
import 'package:qbittorrent_api/src/v2/utils/list_item_converter.dart';

/// {@template transfer_controller}
/// Controller for transfer endpoints.
/// {@endtemplate}
class TransferController {
  /// {@macro transfer_controller}
  const TransferController(ApiClient apiClient) : _apiClient = apiClient;

  final ApiClient _apiClient;

  /// Get global transfer info
  Future<TransferInfo> getGlobalTransferInfo() async {
    final response =
        await _apiClient.get<Map<String, dynamic>>('/transfer/info');
    return TransferInfo.fromJson(response);
  }

  /// Get alternative speed limits state
  /// Return true if alternative speed limits are enabled.
  Future<bool> getAlternativeSpeedLimitsMode() async {
    final response = await _apiClient.get<String>('/transfer/speedLimitsMode');
    return response == '1';
  }

  /// Toggle alternative speed limits
  Future<void> toggleSpeedLimitsMode() async {
    await _apiClient.post<void>('/transfer/toggleSpeedLimitsMode');
  }

  /// Get global download limit
  /// Return the value of current global download speed limit in bytes/second;
  /// this value will be zero if no limit is applied.
  Future<int> getGlobalDownloadLimit() async {
    final response = await _apiClient.get<String>('/transfer/downloadLimit');
    return int.parse(response);
  }

  /// Set global download limit
  /// [limit] - The global download speed limit to set in bytes/second
  Future<void> setGlobalDownloadLimit({required int limit}) async {
    await _apiClient.post<void>(
      '/transfer/setDownloadLimit',
      body: {'limit': limit},
    );
  }

  /// Get global upload limit
  /// Return the value of current global upload speed limit in bytes/second;
  /// this value will be zero if no limit is applied.
  Future<int> getGlobalUploadLimit() async {
    final response = await _apiClient.get<String>('/transfer/uploadLimit');
    return int.parse(response);
  }

  /// Set global upload limit
  /// [limit] - The global upload speed limit to set in bytes/second
  Future<void> setGlobalUploadLimit({required int limit}) async {
    await _apiClient.post<void>(
      '/transfer/setUploadLimit',
      body: {'limit': limit},
    );
  }

  /// Ban peers
  /// [peers] - The peer to ban, or multiple peers
  Future<void> banPeers({required List<Peer> peers}) async {
    await _apiClient.post<void>(
      '/transfer/banPeers',
      body: {
        'peers': const ListItemConverter.bar().toJson(
          peers.map((e) => e.toString()).toList(),
        ),
      },
    );
  }
}
