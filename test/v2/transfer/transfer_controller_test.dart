import 'package:qbittorrent_api/src/v2/transfer/dto/connection_status.dart';
import 'package:qbittorrent_api/src/v2/transfer/dto/peer.dart';
import 'package:qbittorrent_api/src/v2/transfer/transfer_controller.dart';
import 'package:test/test.dart';

import '../../network/fake_api_client.dart';

void main() {
  late final FakeApiClient fakeApiClient;
  late final TransferController transferController;

  setUpAll(() async {
    fakeApiClient = FakeApiClient();
    transferController = TransferController(fakeApiClient);
  });

  group('TransferController', () {
    test('getGlobalTransferInfo returns transfer info', () async {
      fakeApiClient.setResponse('''
      {
        "connection_status": "firewalled",
        "dht_nodes": 0,
        "dl_info_data": 0,
        "dl_info_speed": 0,
        "dl_rate_limit": 0,
        "up_info_data": 0,
        "up_info_speed": 0,
        "up_rate_limit": 0,
        "queueing": false,
        "refresh_interval": 1000,
        "use_alt_speed_limits": false
      }
      ''', isJson: true);
      final info = await transferController.getGlobalTransferInfo();
      expect(info.connectionStatus, ConnectionStatus.firewalled);
      expect(info.dhtNodes, 0);
      expect(info.dlInfoData, 0);
      expect(info.dlInfoSpeed, 0);
      expect(info.dlRateLimit, 0);
      expect(info.upInfoData, 0);
      expect(info.upInfoSpeed, 0);
      expect(info.upRateLimit, 0);
      expect(info.queueing, false);
      expect(info.refreshInterval, 1000);
      expect(info.useAltSpeedLimits, false);
    });

    test('getAlternativeSpeedLimitsMode returns mode', () async {
      fakeApiClient.setResponse('0');
      final mode = await transferController.getAlternativeSpeedLimitsMode();
      expect(mode, false);
    });

    test('toggleSpeedLimitsMode returns nothing', () async {
      fakeApiClient.setResponse('');
      await transferController.toggleSpeedLimitsMode();
    });

    test('getGlobalDownloadLimit returns download limit', () async {
      fakeApiClient.setResponse('0');
      final limit = await transferController.getGlobalDownloadLimit();
      expect(limit, 0);
    });

    test('setGlobalDownloadLimit returns nothing', () async {
      fakeApiClient.setResponse('');
      await transferController.setGlobalDownloadLimit(limit: 0);
    });

    test('getGlobalUploadLimit returns upload limit', () async {
      fakeApiClient.setResponse('0');
      final limit = await transferController.getGlobalUploadLimit();
      expect(limit, 0);
    });

    test('setGlobalUploadLimit successfully', () async {
      fakeApiClient.setResponse('');
      await transferController.setGlobalUploadLimit(limit: 0);
    });

    test('banPeers returns nothing', () async {
      fakeApiClient.setResponse('');
      const peers = <Peer>[
        Peer(host: '1.1.1.1', port: 1234),
        Peer(host: '2.3.4.5', port: 2345),
      ];
      await transferController.banPeers(peers: peers);
    });

    test('banPeers peers are separated by |', () async {
      fakeApiClient.setResponse('');
      const peers = <Peer>[
        Peer(host: '1.1.1.1', port: 1234),
        Peer(host: '2.3.4.5', port: 2345),
      ];
      await transferController.banPeers(peers: peers);
      expect(
        (fakeApiClient.getBody() as Map<String, dynamic>?)?['peers'],
        '1.1.1.1:1234|2.3.4.5:2345',
      );
    });
  });
}
