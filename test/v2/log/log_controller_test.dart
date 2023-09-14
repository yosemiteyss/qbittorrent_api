import 'package:qbittorrent_api/src/v2/log/dto/log_type.dart';
import 'package:qbittorrent_api/src/v2/log/log_controller.dart';
import 'package:test/test.dart';

import '../../network/fake_api_client.dart';

void main() {
  late final FakeApiClient fakeApiClient;
  late final LogController logController;

  setUpAll(() async {
    fakeApiClient = FakeApiClient();
    logController = LogController(fakeApiClient);
  });

  group('test LogController', () {
    test('getLogs return a list of log', () async {
      fakeApiClient.setResponse('''
      [
        {
            "id":0,
            "message":"qBittorrent v3.4.0 started",
            "timestamp":1507969127,
            "type":1
        },
        {
            "id":1,
            "message":"qBittorrent is trying to listen on any interface port: 19036",
            "timestamp":1507969127,
            "type":2
        },
        {
            "id":2,
            "message":"Peer ID: -qB3400-",
            "timestamp":1507969127,
            "type":1
        },
        {
            "id":3,
            "message":"HTTP User-Agent is 'qBittorrent/3.4.0'",
            "timestamp":1507969127,
            "type":1
        },
        {
            "id":4,
            "message":"DHT support [ON]",
            "timestamp":1507969127,
            "type":2
        },
        {
            "id":5,
            "message":"Local Peer Discovery support [ON]",
            "timestamp":1507969127,
            "type":2
        },
        {
            "id":6,
            "message":"PeX support [ON]",
            "timestamp":1507969127,
            "type":2
        },
        {
            "id":7,
            "message":"Anonymous mode [OFF]",
            "timestamp":1507969127,
            "type":2
        },
        {
            "id":8,
            "message":"Encryption support [ON]",
            "timestamp":1507969127,
            "type":2
        },
        {
            "id":9,
            "message":"Embedded Tracker [OFF]",
            "timestamp":1507969127,
            "type":2
        },
        {
            "id":10,
            "message":"UPnP / NAT-PMP support [ON]",
            "timestamp":1507969127,
            "type":2
        },
        {
            "id":11,
            "message":"Web UI: Now listening on port 8080",
            "timestamp":1507969127,
            "type":1
        },
        {
            "id":12,
            "message":"Options were saved successfully.",
            "timestamp":1507969127,
            "type":1
        },
        {
            "id":13,
            "message":"qBittorrent is successfully listening on interface :: port: TCP/19036",
            "timestamp":1507969127,
            "type":2
        },
        {
            "id":14,
            "message":"qBittorrent is successfully listening on interface 0.0.0.0 port: TCP/19036",
            "timestamp":1507969127,
            "type":2
        },
        {
            "id":15,
            "message":"qBittorrent is successfully listening on interface 0.0.0.0 port: UDP/19036",
            "timestamp":1507969127,
            "type":2
        }
      ]
      ''', isJson: true);
      final logs = await logController.getLogs();
      expect(logs.length, 16);
      expect(logs[0].id, 0);
      expect(logs[0].message, 'qBittorrent v3.4.0 started');
      expect(logs[0].timestamp, 1507969127);
      expect(logs[0].type, LogType.normal);
    });

    test('getLogs set params correctly', () async {
      fakeApiClient.setResponse('''
      [
        {
          "id": 0,
          "ip": "1.2.3.4",
          "timestamp": 1507969127,
          "blocked": false,
          "reason": "none"
        }
      ]
      ''', isJson: true);
      await logController.getLogs(
        normal: true,
        info: true,
        warning: true,
        critical: true,
        lastKnownId: 1,
      );
      final params = fakeApiClient.getParams();
      expect(params?['normal'], true);
      expect(params?['info'], true);
      expect(params?['warning'], true);
      expect(params?['critical'], true);
      expect(params?['last_known_id'], 1);
    });

    test('getPeersLogs return a list of peers log', () async {
      fakeApiClient.setResponse('''
      [
        {
          "id": 0,
          "ip": "1.2.3.4",
          "timestamp": 1507969127,
          "blocked": false,
          "reason": "none"
        }
      ]
      ''', isJson: true);
      final logs = await logController.getPeersLogs();
      expect(logs.length, 1);
      expect(logs[0].id, 0);
      expect(logs[0].ip, '1.2.3.4');
      expect(logs[0].timestamp, 1507969127);
      expect(logs[0].blocked, false);
      expect(logs[0].reason, 'none');
    });

    test('getPeersLogs set params correctly', () async {
      fakeApiClient.setResponse('''
      [
        {
          "id": 0,
          "ip": "1.2.3.4",
          "timestamp": 1507969127,
          "blocked": false,
          "reason": "none"
        }
      ]
      ''', isJson: true);
      await logController.getPeersLogs(lastKnownId: 1);
      final params = fakeApiClient.getParams();
      expect(params?['last_known_id'], 1);
    });
  });
}
