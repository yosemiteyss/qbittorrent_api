import 'package:fake_async/fake_async.dart';
import 'package:qbittorrent_api/src/v2/sync/dto/main_data.dart';
import 'package:qbittorrent_api/src/v2/sync/sync_controller.dart';
import 'package:qbittorrent_api/src/v2/torrents/dto/torrent_state.dart';
import 'package:qbittorrent_api/src/v2/transfer/dto/connection_status.dart';
import 'package:test/test.dart';

import '../../network/fake_api_client.dart';

void main() {
  late final FakeApiClient fakeApiClient;
  late final SyncController syncController;

  setUpAll(() async {
    fakeApiClient = FakeApiClient();
    syncController = SyncController(fakeApiClient);
  });

  String buildMainDataResponse({double torrentProgress = 1}) {
    return '''
      {
       "categories": {
          "bb": {
              "name": "bb",
              "savePath": "/path/to/dir"
          }
        },
        "full_update": true,
        "rid": 1,
        "server_state": {
            "alltime_dl": 20579270,
            "alltime_ul": 970184,
            "average_time_queue": 0,
            "connection_status": "firewalled",
            "dht_nodes": 201,
            "dl_info_data": 0,
            "dl_info_speed": 0,
            "dl_rate_limit": 0,
            "free_space_on_disk": 584817168384,
            "global_ratio": "0.04",
            "queued_io_jobs": 0,
            "queueing": true,
            "read_cache_hits": "0",
            "read_cache_overload": "0",
            "refresh_interval": 1500,
            "total_buffers_size": 0,
            "total_peer_connections": 0,
            "total_queued_size": 0,
            "total_wasted_session": 0,
            "up_info_data": 0,
            "up_info_speed": 0,
            "up_rate_limit": 0,
            "use_alt_speed_limits": false,
            "write_cache_overload": "0"
        },
        "tags": [],
        "torrents": {
            "d984f67af9917b214cd8b6048ab5624c7df6a07a": {
                "added_on": 1688905642,
                "amount_left": 0,
                "auto_tmm": false,
                "availability": -1,
                "category": "",
                "completed": 19296724,
                "completion_on": 1688905836,
                "content_path": "/downloads/test_folder",
                "dl_limit": 0,
                "dlspeed": 0,
                "download_path": "",
                "downloaded": 19706324,
                "downloaded_session": 0,
                "eta": 8640000,
                "f_l_piece_prio": false,
                "force_start": false,
                "infohash_v1": "d984f67af9917b214cd8b6048ab5624c7df6a07a",
                "infohash_v2": "",
                "last_activity": 1688905836,
                "magnet_uri": "magnet:?xt=urn:btih:d984f67af9917b214cd8b6048ab5624c7df6a07a&dn=test_folder&tr=https%3a%2f%2facademictorrents.com%2fannounce.php&tr=https%3a%2f%2fipv6.academictorrents.com%2fannounce.php&tr=udp%3a%2f%2ftracker.opentrackr.org%3a1337%2fannounce&tr=udp%3a%2f%2ftracker.openbittorrent.com%3a80%2fannounce",
                "max_ratio": -1,
                "max_seeding_time": -1,
                "name": "test_folder",
                "num_complete": 10,
                "num_incomplete": 0,
                "num_leechs": 0,
                "num_seeds": 0,
                "priority": 0,
                "progress": $torrentProgress,
                "ratio": 0,
                "ratio_limit": -2,
                "save_path": "/downloads",
                "seeding_time": 6529,
                "seeding_time_limit": -2,
                "seen_complete": 1688905836,
                "seq_dl": false,
                "size": 19296724,
                "state": "stalledUP",
                "super_seeding": false,
                "tags": "",
                "time_active": 6544,
                "total_size": 19296724,
                "tracker": "https://ipv6.academictorrents.com/announce.php",
                "trackers_count": 4,
                "up_limit": 0,
                "uploaded": 0,
                "uploaded_session": 0,
                "upspeed": 0
            }
        },
        "trackers": {
            "https://academictorrents.com/announce.php": [
                "d984f67af9917b214cd8b6048ab5624c7df6a07a"
            ],
            "https://ipv6.academictorrents.com/announce.php": [
                "d984f67af9917b214cd8b6048ab5624c7df6a07a"
            ],
            "udp://tracker.openbittorrent.com:80/announce": [
                "d984f67af9917b214cd8b6048ab5624c7df6a07a"
            ],
            "udp://tracker.opentrackr.org:1337/announce": [
                "d984f67af9917b214cd8b6048ab5624c7df6a07a"
            ]
        }
      }
      ''';
  }

  void expectMainDataResponse(MainData mainData, {double torrentProgress = 1}) {
    expect(mainData.categories?['bb']?.name, 'bb');
    expect(mainData.categories?['bb']?.savePath, '/path/to/dir');
    expect(mainData.fullUpdate, true);
    expect(mainData.rid, 1);
    expect(mainData.serverState?.alltimeDl, 20579270);
    expect(mainData.serverState?.alltimeUl, 970184);
    expect(mainData.serverState?.averageTimeQueue, 0);
    expect(
      mainData.serverState?.connectionStatus,
      ConnectionStatus.firewalled,
    );
    expect(mainData.serverState?.dhtNodes, 201);
    expect(mainData.serverState?.dlInfoData, 0);
    expect(mainData.serverState?.dlInfoSpeed, 0);
    expect(mainData.serverState?.dlRateLimit, 0);
    expect(mainData.serverState?.freeSpaceOnDisk, 584817168384);
    expect(mainData.serverState?.globalRatio, '0.04');
    expect(mainData.serverState?.queuedIoJobs, 0);
    expect(mainData.serverState?.queueing, true);
    expect(mainData.serverState?.readCacheHits, '0');
    expect(mainData.serverState?.readCacheOverload, '0');
    expect(mainData.serverState?.refreshInterval, 1500);
    expect(mainData.serverState?.totalBuffersSize, 0);
    expect(mainData.serverState?.totalPeerConnections, 0);
    expect(mainData.serverState?.totalQueuedSize, 0);
    expect(mainData.serverState?.totalWastedSession, 0);
    expect(mainData.serverState?.upInfoData, 0);
    expect(mainData.serverState?.upInfoSpeed, 0);
    expect(mainData.serverState?.upRateLimit, 0);
    expect(mainData.serverState?.useAltSpeedLimits, false);
    expect(mainData.serverState?.writeCacheOverload, '0');
    expect(mainData.tags, <String>[]);

    final torrentInfo =
        mainData.torrents?['d984f67af9917b214cd8b6048ab5624c7df6a07a'];
    expect(torrentInfo?.addedOn, 1688905642);
    expect(torrentInfo?.amountLeft, 0);
    expect(torrentInfo?.autoTmm, false);
    expect(torrentInfo?.availability, -1);
    expect(torrentInfo?.category, '');
    expect(torrentInfo?.completed, 19296724);
    expect(torrentInfo?.completionOn, 1688905836);
    expect(torrentInfo?.contentPath, '/downloads/test_folder');
    expect(torrentInfo?.dlLimit, 0);
    expect(torrentInfo?.dlSpeed, 0);
    expect(torrentInfo?.downloadPath, '');
    expect(torrentInfo?.downloaded, 19706324);
    expect(torrentInfo?.downloadedSession, 0);
    expect(torrentInfo?.eta, 8640000);
    expect(torrentInfo?.fLPiecePrio, false);
    expect(torrentInfo?.forceStart, false);
    expect(torrentInfo?.infohashV1, 'd984f67af9917b214cd8b6048ab5624c7df6a07a');
    expect(torrentInfo?.infohashV2, '');
    expect(torrentInfo?.lastActivity, 1688905836);
    expect(
      torrentInfo?.magnetUri,
      'magnet:?xt=urn:btih:d984f67af9917b214cd8b6048ab5624c7df6a07a&dn=test_folder&tr=https%3a%2f%2facademictorrents.com%2fannounce.php&tr=https%3a%2f%2fipv6.academictorrents.com%2fannounce.php&tr=udp%3a%2f%2ftracker.opentrackr.org%3a1337%2fannounce&tr=udp%3a%2f%2ftracker.openbittorrent.com%3a80%2fannounce',
    );
    expect(torrentInfo?.maxRatio, -1);
    expect(torrentInfo?.maxSeedingTime, -1);
    expect(torrentInfo?.name, 'test_folder');
    expect(torrentInfo?.numComplete, 10);
    expect(torrentInfo?.numIncomplete, 0);
    expect(torrentInfo?.numLeechs, 0);
    expect(torrentInfo?.numSeeds, 0);
    expect(torrentInfo?.priority, 0);
    expect(torrentInfo?.progress, torrentProgress);
    expect(torrentInfo?.ratio, 0);
    expect(torrentInfo?.ratioLimit, -2);
    expect(torrentInfo?.savePath, '/downloads');
    expect(torrentInfo?.seedingTime, 6529);
    expect(torrentInfo?.seedingTimeLimit, -2);
    expect(torrentInfo?.seenComplete, 1688905836);
    expect(torrentInfo?.seqDl, false);
    expect(torrentInfo?.size, 19296724);
    expect(torrentInfo?.state, TorrentState.stalledUP);
    expect(torrentInfo?.superSeeding, false);
    expect(torrentInfo?.tags, <String>[]);
    expect(torrentInfo?.timeActive, 6544);
    expect(torrentInfo?.totalSize, 19296724);
    expect(
      torrentInfo?.tracker,
      'https://ipv6.academictorrents.com/announce.php',
    );
    expect(torrentInfo?.trackersCount, 4);
    expect(torrentInfo?.upLimit, 0);
    expect(torrentInfo?.uploaded, 0);
    expect(torrentInfo?.uploadedSession, 0);
    expect(torrentInfo?.upSpeed, 0);

    expect(mainData.trackers, <String, List<String>>{
      'https://academictorrents.com/announce.php': <String>[
        'd984f67af9917b214cd8b6048ab5624c7df6a07a'
      ],
      'https://ipv6.academictorrents.com/announce.php': <String>[
        'd984f67af9917b214cd8b6048ab5624c7df6a07a'
      ],
      'udp://tracker.openbittorrent.com:80/announce': <String>[
        'd984f67af9917b214cd8b6048ab5624c7df6a07a'
      ],
      'udp://tracker.opentrackr.org:1337/announce': <String>[
        'd984f67af9917b214cd8b6048ab5624c7df6a07a'
      ],
    });
  }

  group('test SyncController', () {
    test('getMainData returns main data', () async {
      fakeApiClient.setResponse(buildMainDataResponse(), isJson: true);
      final mainData = await syncController.getMainData();
      expectMainDataResponse(mainData);
    });

    test('subscribeMainData emits main data changes', () {
      fakeAsync((async) {
        var count = 0;
        const interval = Duration(seconds: 3);
        final List<double> progress = [0, 0.5, 1];
        final stream = syncController.subscribeMainData(interval: interval);

        fakeApiClient.setResponse(
          buildMainDataResponse(torrentProgress: progress[count]),
          isJson: true,
        );
        stream.listen(
          expectAsync1<void, MainData>((mainData) {
            expectMainDataResponse(
              mainData,
              torrentProgress: progress[count],
            );
            count++;
            if (count < progress.length) {
              fakeApiClient.setResponse(
                buildMainDataResponse(torrentProgress: progress[count]),
                isJson: true,
              );
            }
          }, count: progress.length),
        );

        // Advance the time by the polling interval for the expected number of events.
        for (var i = 0; i < progress.length; i++) {
          async.elapse(interval);
        }
      });
    });

    test('getTorrentPeersData returns peers data', () async {
      fakeApiClient.setResponse(r'''
      {
        "full_update": true,
        "peers": {
            "1.2.3.4:1234": {
                "client": "qBittorrent/4.5.4",
                "connection": "μTP",
                "country": "Latvia",
                "country_code": "lv",
                "dl_speed": 311786,
                "downloaded": 3201438,
                "files": "1234/1234.mp4",
                "flags": "d P",
                "flags_desc": "d = Interested (local) and choked (peer)\nP = μTP",
                "ip": "1.2.3.4",
                "peer_id_client": "-qB4540-",
                "port": 39432,
                "progress": 1,
                "relevance": 1,
                "up_speed": 0,
                "uploaded": 0
            }
        },
        "rid": 1,
        "show_flags": true
      }
      ''', isJson: true);
      final peersData = await syncController.getTorrentPeersData(hash: '');
      expect(peersData.fullUpdate, true);
      expect(peersData.rid, 1);
      expect(peersData.showFlags, true);

      final peer = peersData.peers?['1.2.3.4:1234'];
      expect(peer?.client, 'qBittorrent/4.5.4');
      expect(peer?.connection, 'μTP');
      expect(peer?.country, 'Latvia');
      expect(peer?.countryCode, 'lv');
      expect(peer?.dlSpeed, 311786);
      expect(peer?.downloaded, 3201438);
      expect(peer?.files, '1234/1234.mp4');
      expect(peer?.flags, 'd P');
      expect(
        peer?.flagsDesc,
        'd = Interested (local) and choked (peer)\nP = μTP',
      );
      expect(peer?.ip, '1.2.3.4');
      expect(peer?.peerIdClient, '-qB4540-');
      expect(peer?.port, 39432);
      expect(peer?.progress, 1);
      expect(peer?.relevance, 1);
      expect(peer?.upSpeed, 0);
      expect(peer?.uploaded, 0);
    });
  });
}
