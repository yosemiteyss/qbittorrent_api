import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:qbittorrent_api/src/v2/torrents/dto/file_priority.dart';
import 'package:qbittorrent_api/src/v2/torrents/dto/new_torrents.dart';
import 'package:qbittorrent_api/src/v2/torrents/dto/piece_state.dart';
import 'package:qbittorrent_api/src/v2/torrents/dto/ratio_limit.dart';
import 'package:qbittorrent_api/src/v2/torrents/dto/torrent_list_options.dart';
import 'package:qbittorrent_api/src/v2/torrents/dto/torrent_state.dart';
import 'package:qbittorrent_api/src/v2/torrents/dto/torrents.dart';
import 'package:qbittorrent_api/src/v2/torrents/dto/tracker_status.dart';
import 'package:qbittorrent_api/src/v2/torrents/torrents_controller.dart';
import 'package:qbittorrent_api/src/v2/transfer/dto/peer.dart';
import 'package:test/test.dart';

import '../../network/fake_api_client.dart';

void main() {
  late final FakeApiClient fakeApiClient;
  late final TorrentsController torrentsController;

  setUpAll(() async {
    fakeApiClient = FakeApiClient();
    torrentsController = TorrentsController(fakeApiClient);
  });

  group('test TorrentsController', () {
    test('getTorrentsList returns a list of torrent info', () async {
      fakeApiClient.setResponse('''
      [
        {
            "added_on": 1688720589,
            "amount_left": 0,
            "auto_tmm": false,
            "availability": -1,
            "category": "",
            "completed": 19296724,
            "completion_on": 1688720601,
            "content_path": "/downloads/test_folder",
            "dl_limit": 0,
            "dlspeed": 0,
            "download_path": "",
            "downloaded": 19306633,
            "downloaded_session": 0,
            "eta": 8640000,
            "f_l_piece_prio": false,
            "force_start": false,
            "hash": "d984f67af9917b214cd8b6048ab5624c7df6a07a",
            "infohash_v1": "d984f67af9917b214cd8b6048ab5624c7df6a07a",
            "infohash_v2": "",
            "last_activity": 1688720601,
            "magnet_uri": "magnet:123",
            "max_ratio": -1,
            "max_seeding_time": -1,
            "name": "test_folder",
            "num_complete": 0,
            "num_incomplete": 10,
            "num_leechs": 0,
            "num_seeds": 0,
            "priority": 0,
            "progress": 1,
            "ratio": 0,
            "ratio_limit": -2,
            "save_path": "/downloads",
            "seeding_time": 110,
            "seeding_time_limit": -2,
            "seen_complete": 1688720601,
            "seq_dl": false,
            "size": 19296724,
            "state": "pausedUP",
            "super_seeding": false,
            "tags": "haha, haha2",
            "time_active": 122,
            "total_size": 19296724,
            "tracker": "",
            "trackers_count": 4,
            "up_limit": 0,
            "uploaded": 0,
            "uploaded_session": 0,
            "upspeed": 0
        }
      ]
      ''', isJson: true);
      final torrentsList = await torrentsController.getTorrentsList(
        options: const TorrentListOptions(),
      );
      expect(torrentsList.length, 1);
      expect(torrentsList[0].addedOn, 1688720589);
      expect(torrentsList[0].amountLeft, 0);
      expect(torrentsList[0].autoTmm, false);
      expect(torrentsList[0].availability, -1);
      expect(torrentsList[0].category, '');
      expect(torrentsList[0].completed, 19296724);
      expect(torrentsList[0].completionOn, 1688720601);
      expect(torrentsList[0].contentPath, '/downloads/test_folder');
      expect(torrentsList[0].dlLimit, 0);
      expect(torrentsList[0].dlSpeed, 0);
      expect(torrentsList[0].downloadPath, '');
      expect(torrentsList[0].downloaded, 19306633);
      expect(torrentsList[0].downloadedSession, 0);
      expect(torrentsList[0].eta, 8640000);
      expect(torrentsList[0].fLPiecePrio, false);
      expect(torrentsList[0].forceStart, false);
      expect(torrentsList[0].hash, 'd984f67af9917b214cd8b6048ab5624c7df6a07a');
      expect(
        torrentsList[0].infohashV1,
        'd984f67af9917b214cd8b6048ab5624c7df6a07a',
      );
      expect(torrentsList[0].infohashV2, '');
      expect(torrentsList[0].lastActivity, 1688720601);
      expect(torrentsList[0].magnetUri, 'magnet:123');
      expect(torrentsList[0].maxRatio, -1);
      expect(torrentsList[0].maxSeedingTime, -1);
      expect(torrentsList[0].name, 'test_folder');
      expect(torrentsList[0].numComplete, 0);
      expect(torrentsList[0].numIncomplete, 10);
      expect(torrentsList[0].numLeechs, 0);
      expect(torrentsList[0].numSeeds, 0);
      expect(torrentsList[0].priority, 0);
      expect(torrentsList[0].progress, 1);
      expect(torrentsList[0].ratio, 0);
      expect(torrentsList[0].ratioLimit, -2);
      expect(torrentsList[0].savePath, '/downloads');
      expect(torrentsList[0].seedingTime, 110);
      expect(torrentsList[0].seedingTimeLimit, -2);
      expect(torrentsList[0].seenComplete, 1688720601);
      expect(torrentsList[0].seqDl, false);
      expect(torrentsList[0].size, 19296724);
      expect(torrentsList[0].state, TorrentState.pausedUP);
      expect(torrentsList[0].superSeeding, false);
      expect(torrentsList[0].tags, ['haha', 'haha2']);
      expect(torrentsList[0].timeActive, 122);
      expect(torrentsList[0].totalSize, 19296724);
      expect(torrentsList[0].tracker, '');
      expect(torrentsList[0].trackersCount, 4);
      expect(torrentsList[0].upLimit, 0);
      expect(torrentsList[0].uploaded, 0);
      expect(torrentsList[0].uploadedSession, 0);
      expect(torrentsList[0].upSpeed, 0);
    });

    test('getProperties returns the torrent properties', () async {
      fakeApiClient.setResponse('''
      {
        "addition_date": 1688720589,
        "comment": "",
        "completion_date": 1688720601,
        "created_by": "Transmission/2.92 (14714)",
        "creation_date": 1495908054,
        "dl_limit": -1,
        "dl_speed": 0,
        "dl_speed_avg": 1608886,
        "download_path": "",
        "eta": 8640000,
        "hash": "d984f67af9917b214cd8b6048ab5624c7df6a07a",
        "infohash_v1": "d984f67af9917b214cd8b6048ab5624c7df6a07a",
        "infohash_v2": "",
        "is_private": false,
        "last_seen": 1688720601,
        "name": "test_folder",
        "nb_connections": 0,
        "nb_connections_limit": 100,
        "peers": 0,
        "peers_total": 10,
        "piece_size": 32768,
        "pieces_have": 589,
        "pieces_num": 589,
        "reannounce": 0,
        "save_path": "/downloads",
        "seeding_time": 110,
        "seeds": 0,
        "seeds_total": 0,
        "share_ratio": 0,
        "time_elapsed": 122,
        "total_downloaded": 19306633,
        "total_downloaded_session": 0,
        "total_size": 19296724,
        "total_uploaded": 0,
        "total_uploaded_session": 0,
        "total_wasted": 0,
        "up_limit": -1,
        "up_speed": 0,
        "up_speed_avg": 0
      }
      ''', isJson: true);
      final properties = await torrentsController.getProperties(
        hash: 'd984f67af9917b214cd8b6048ab5624c7df6a07a',
      );
      expect(properties.additionDate, 1688720589);
      expect(properties.comment, '');
      expect(properties.completionDate, 1688720601);
      expect(properties.createdBy, 'Transmission/2.92 (14714)');
      expect(properties.creationDate, 1495908054);
      expect(properties.dlLimit, -1);
      expect(properties.dlSpeed, 0);
      expect(properties.dlSpeedAvg, 1608886);
      expect(properties.downloadPath, '');
      expect(properties.eta, 8640000);
      expect(properties.hash, 'd984f67af9917b214cd8b6048ab5624c7df6a07a');
      expect(properties.infohashV1, 'd984f67af9917b214cd8b6048ab5624c7df6a07a');
      expect(properties.infohashV2, '');
      expect(properties.isPrivate, false);
      expect(properties.lastSeen, 1688720601);
      expect(properties.name, 'test_folder');
      expect(properties.nbConnections, 0);
      expect(properties.nbConnectionsLimit, 100);
      expect(properties.peers, 0);
      expect(properties.peersTotal, 10);
      expect(properties.pieceSize, 32768);
      expect(properties.piecesHave, 589);
      expect(properties.piecesNum, 589);
      expect(properties.reannounce, 0);
      expect(properties.savePath, '/downloads');
      expect(properties.seedingTime, 110);
      expect(properties.seeds, 0);
      expect(properties.seedsTotal, 0);
      expect(properties.shareRatio, 0);
      expect(properties.timeElapsed, 122);
      expect(properties.totalDownloaded, 19306633);
      expect(properties.totalDownloadedSession, 0);
      expect(properties.totalSize, 19296724);
      expect(properties.totalUploaded, 0);
      expect(properties.totalUploadedSession, 0);
      expect(properties.totalWasted, 0);
      expect(properties.upLimit, -1);
      expect(properties.upSpeed, 0);
      expect(properties.upSpeedAvg, 0);
    });

    test('getTrackers returns the torrent trackers', () async {
      fakeApiClient.setResponse('''
      [
        {
            "msg": "",
            "num_downloaded": -1,
            "num_leeches": -1,
            "num_peers": -1,
            "num_seeds": -1,
            "status": 1,
            "tier": 3,
            "url": "udp://tracker.openbittorrent.com:80/announce"
        }
      ]
      ''', isJson: true);
      final trackers = await torrentsController.getTrackers(
        hash: 'd984f67af9917b214cd8b6048ab5624c7df6a07a',
      );
      expect(trackers.length, 1);
      expect(trackers[0].msg, '');
      expect(trackers[0].numDownloaded, -1);
      expect(trackers[0].numLeeches, -1);
      expect(trackers[0].numPeers, -1);
      expect(trackers[0].numSeeds, -1);
      expect(trackers[0].status, TrackerStatus.notContacted);
      expect(trackers[0].tier, 3);
      expect(trackers[0].url, 'udp://tracker.openbittorrent.com:80/announce');
    });

    test('getWebSeeds returns a list of web seeds', () async {
      fakeApiClient.setResponse('''
      [
        {
            "url":"http://some_url/"
        },
        {
            "url":"http://some_other_url/"
        }
      ]
      ''', isJson: true);
      final webSeeds = await torrentsController.getWebSeeds(
        hash: 'd984f67af9917b214cd8b6048ab5624c7df6a07a',
      );
      expect(webSeeds.length, 2);
      expect(webSeeds[0].url, 'http://some_url/');
      expect(webSeeds[1].url, 'http://some_other_url/');
    });

    test('getContents returns a list of contents', () async {
      fakeApiClient.setResponse('''
      [
        {
            "availability": -1,
            "index": 0,
            "is_seed": true,
            "name": "test_folder/images/LOC_Main_Reading_Room_Highsmith.jpg",
            "piece_range": [
                0,
                537
            ],
            "priority": 1,
            "progress": 1,
            "size": 17614527
        }
      ]
      ''', isJson: true);
      final contents = await torrentsController.getContents(
        hash: 'd984f67af9917b214cd8b6048ab5624c7df6a07a',
      );
      expect(contents.length, 1);
      expect(contents[0].availability, -1);
      expect(contents[0].index, 0);
      expect(contents[0].isSeed, true);
      expect(
        contents[0].name,
        'test_folder/images/LOC_Main_Reading_Room_Highsmith.jpg',
      );
      expect(contents[0].pieceRange, [0, 537]);
      expect(contents[0].priority, FilePriority.normal);
      expect(contents[0].progress, 1);
      expect(contents[0].size, 17614527);
    });

    test('getPiecesStates returns a list of piece states', () async {
      fakeApiClient.setResponse('[0,0,2,1,0,0,2,1]', isJson: true);
      final piecesStates = await torrentsController.getPieceStates(
        hash: 'd984f67af9917b214cd8b6048ab5624c7df6a07a',
      );
      expect(piecesStates.length, 8);
      expect(piecesStates[0], PieceState.notDownloaded);
      expect(piecesStates[1], PieceState.notDownloaded);
      expect(piecesStates[2], PieceState.downloaded);
      expect(piecesStates[3], PieceState.downloading);
      expect(piecesStates[4], PieceState.notDownloaded);
      expect(piecesStates[5], PieceState.notDownloaded);
      expect(piecesStates[6], PieceState.downloaded);
      expect(piecesStates[7], PieceState.downloading);
    });

    test('getPieceHashes returns a list of piece hashes', () async {
      fakeApiClient.setResponse('''
      [
        "218cacad5b2dc79c74352390271a35f81b6661cc",
        "7ec833397ac668ef59ada9c7def999cbc9642c4b",
        "c12f2ba2659b44fc5c3205614eeb93df4aa1e156"
      ]
      ''', isJson: true);
      final pieceHashes = await torrentsController.getPieceHashes(
        hash: 'd984f67af9917b214cd8b6048ab5624c7df6a07a',
      );
      expect(pieceHashes.length, 3);
      expect(
        pieceHashes[0],
        '218cacad5b2dc79c74352390271a35f81b6661cc',
      );
      expect(
        pieceHashes[1],
        '7ec833397ac668ef59ada9c7def999cbc9642c4b',
      );
      expect(
        pieceHashes[2],
        'c12f2ba2659b44fc5c3205614eeb93df4aa1e156',
      );
    });

    test('pauseTorrents returns nothing', () async {
      fakeApiClient.setResponse('');
      await torrentsController.pauseTorrents(
        torrents: const Torrents(
          hashes: ['d984f67af9917b214cd8b6048ab5624c7df6a07a'],
        ),
      );
    });

    test('resumeTorrents returns nothing', () async {
      fakeApiClient.setResponse('');
      await torrentsController.pauseTorrents(
        torrents: const Torrents(
          hashes: ['d984f67af9917b214cd8b6048ab5624c7df6a07a'],
        ),
      );
    });

    test('setTorrentLocation returns nothing', () async {
      fakeApiClient.setResponse('');
      await torrentsController.deleteTorrents(
        torrents: const Torrents(
          hashes: ['d984f67af9917b214cd8b6048ab5624c7df6a07a'],
        ),
      );
    });

    test('recheckTorrents returns nothing', () async {
      fakeApiClient.setResponse('');
      await torrentsController.recheckTorrents(
        torrents: const Torrents(
          hashes: ['d984f67af9917b214cd8b6048ab5624c7df6a07a'],
        ),
      );
    });

    test('reannounceTorrents returns nothing', () async {
      fakeApiClient.setResponse('');
      await torrentsController.reannounceTorrents(
        torrents: const Torrents(
          hashes: ['d984f67af9917b214cd8b6048ab5624c7df6a07a'],
        ),
      );
    });

    test('addNewTorrents by urls set params correctly', () async {
      fakeApiClient.setResponse('');
      const newTorrents = NewTorrents.urls(
        urls: [
          'https://torcache.net/torrent/3B1A1469C180F447B77021074DBBCCAEF62611E7.torrent',
          'https://torcache.net/torrent/3B1A1469C180F447B77021074DBBCCAEF62611E8.torrent',
        ],
        savePath: '/downloads',
        cookie: 'cookie',
        category: 'category',
        tags: ['tag1', 'tag2'],
        skipChecking: true,
        paused: true,
        rootFolder: true,
        rename: 'rename',
        upLimit: 100,
        dlLimit: 200,
        ratioLimit: 1.5,
        seedingTimeLimit: 100,
        autoTMM: true,
        sequentialDownload: true,
        firstLastPiecePrio: true,
      );
      await torrentsController.addNewTorrents(torrents: newTorrents);

      final formData = fakeApiClient.getFormData();
      expect(
        formData?['urls'],
        'https://torcache.net/torrent/3B1A1469C180F447B77021074DBBCCAEF62611E7.torrent\nhttps://torcache.net/torrent/3B1A1469C180F447B77021074DBBCCAEF62611E8.torrent',
      );
      expect(formData?['savepath'], '/downloads');
      expect(formData?['torrents'], null);
      expect(formData?['cookie'], 'cookie');
      expect(formData?['category'], 'category');
      expect(formData?['tags'], 'tag1,tag2');
      expect(formData?['skip_checking'], true);
      expect(formData?['paused'], true);
      expect(formData?['root_folder'], true);
      expect(formData?['rename'], 'rename');
      expect(formData?['upLimit'], 100);
      expect(formData?['dlLimit'], 200);
      expect(formData?['ratioLimit'], 1.5);
      expect(formData?['seedingTimeLimit'], 100);
      expect(formData?['autoTMM'], true);
      expect(formData?['sequentialDownload'], true);
      expect(formData?['firstLastPiecePrio'], true);
    });

    test('addNewTorrents by files set params correctly', () async {
      fakeApiClient.setResponse('');
      final newTorrents = NewTorrents.files(
        files: [File('./test/test.torrent')],
      );
      await torrentsController.addNewTorrents(torrents: newTorrents);

      final formData = fakeApiClient.getFormData();
      final firstFile = formData?['torrents']?[0];
      expect(firstFile, isA<File>());
      expect((firstFile as File?)?.path, './test/test.torrent');
    });

    test('addNewTorrent by ByteFiles set params correctly', () async {
      fakeApiClient.setResponse('');
      final bytes = Uint8List.fromList(
        List.generate(256, (_) => Random().nextInt(256)),
      );
      final newTorrents = NewTorrents.bytes(
        bytes: [FileBytes(filename: 'test.torrent', bytes: bytes)],
      );
      await torrentsController.addNewTorrents(torrents: newTorrents);

      final formData = fakeApiClient.getFormData();
      final firstFile = formData?['torrents']?[0];
      expect(firstFile, isA<FileBytes>());
      expect((firstFile as FileBytes?)?.filename, 'test.torrent');
      expect(firstFile?.bytes, bytes);
    });

    test('addTrackers returns nothing', () async {
      fakeApiClient.setResponse('');
      await torrentsController.addTrackers(
        hash: 'd984f67af9917b214cd8b6048ab5624c7df6a07a',
        urls: [
          'http://192.168.0.1/announce',
          'udp://192.168.0.1:3333/dummyAnnounce',
        ],
      );
    });

    test('addTrackers urls ampersand are escaped', () async {
      fakeApiClient.setResponse('');
      await torrentsController.addTrackers(
        hash: 'd984f67af9917b214cd8b6048ab5624c7df6a07a',
        urls: [
          'http://192.168.0.1/announce',
          'udp://192.168.0.1:3333/dummyAnnounce',
        ],
      );
      expect(
        (fakeApiClient.getBody() as Map<String, dynamic>?)?['hash'],
        'd984f67af9917b214cd8b6048ab5624c7df6a07a',
      );
      expect(
        (fakeApiClient.getBody() as Map<String, dynamic>?)?['urls'],
        'http://192.168.0.1/announce%0Audp://192.168.0.1:3333/dummyAnnounce',
      );
    });

    test('editTracker returns nothing', () async {
      fakeApiClient.setResponse('');
      await torrentsController.editTracker(
        hash: 'd984f67af9917b214cd8b6048ab5624c7df6a07a',
        origUrl: 'about:blank',
        newUrl: 'about:blank2',
      );
    });

    test('removeTrackers returns nothing', () async {
      fakeApiClient.setResponse('');
      await torrentsController.removeTrackers(
        hash: 'd984f67af9917b214cd8b6048ab5624c7df6a07a',
        urls: [
          'http://192.168.0.1/announce',
          'udp://192.168.0.1:3333/dummyAnnounce',
        ],
      );
    });

    test('removeTrackers url are separated with |', () async {
      fakeApiClient.setResponse('');
      await torrentsController.removeTrackers(
        hash: 'd984f67af9917b214cd8b6048ab5624c7df6a07a',
        urls: [
          'http://192.168.0.1/announce',
          'udp://192.168.0.1:3333/dummyAnnounce',
        ],
      );
      expect(
        (fakeApiClient.getBody() as Map<String, dynamic>?)?['hash'],
        'd984f67af9917b214cd8b6048ab5624c7df6a07a',
      );
      expect(
        (fakeApiClient.getBody() as Map<String, dynamic>?)?['urls'],
        'http://192.168.0.1/announce|udp://192.168.0.1:3333/dummyAnnounce',
      );
    });

    test('addPeers returns a map of add peers result', () async {
      fakeApiClient.setResponse('''
      {
          "d984f67af9917b214cd8b6048ab5624c7df6a07a": {
              "added": 2,
              "failed": 0
          }
      }
      ''', isJson: true);
      final results = await torrentsController.addPeers(
        hashes: ['d984f67af9917b214cd8b6048ab5624c7df6a07a'],
        peers: const [
          Peer(host: '1.2.3.4', port: 1234),
          Peer(host: '2.3.4.5', port: 5678),
        ],
      );
      expect(results.length, 1);
      expect(results['d984f67af9917b214cd8b6048ab5624c7df6a07a']?.added, 2);
      expect(results['d984f67af9917b214cd8b6048ab5624c7df6a07a']?.failed, 0);
    });

    test('addPeers hashes and peers are separated by |', () async {
      fakeApiClient.setResponse('''
      {
          "d984f67af9917b214cd8b6048ab5624c7df6a07a": {
              "added": 2,
              "failed": 0
          }
      }
      ''', isJson: true);
      await torrentsController.addPeers(
        hashes: [
          'd984f67af9917b214cd8b6048ab5624c7df6a07a',
          'a88fda5954e89178c372716a6a78b8180ed4dad3',
        ],
        peers: const [
          Peer(host: '1.2.3.4', port: 1234),
          Peer(host: '2.3.4.5', port: 5678),
        ],
      );
      final body = fakeApiClient.getBody() as Map<String, dynamic>?;
      expect(
        body?['hashes'],
        'd984f67af9917b214cd8b6048ab5624c7df6a07a|a88fda5954e89178c372716a6a78b8180ed4dad3',
      );
      expect(body?['peers'], '1.2.3.4:1234|2.3.4.5:5678');
    });

    test('increasePriority returns nothing', () async {
      fakeApiClient.setResponse('');
      await torrentsController.increasePriority(
        torrents: const Torrents(
          hashes: [
            'd984f67af9917b214cd8b6048ab5624c7df6a07a',
            'a88fda5954e89178c372716a6a78b8180ed4dad3',
          ],
        ),
      );
    });

    test('decreasePriority returns nothing', () async {
      fakeApiClient.setResponse('');
      await torrentsController.decreasePriority(
        torrents: const Torrents(
          hashes: [
            'd984f67af9917b214cd8b6048ab5624c7df6a07a',
            'a88fda5954e89178c372716a6a78b8180ed4dad3',
          ],
        ),
      );
    });

    test('maxPriority returns nothing', () async {
      fakeApiClient.setResponse('');
      await torrentsController.maxPriority(
        torrents: const Torrents(
          hashes: [
            'd984f67af9917b214cd8b6048ab5624c7df6a07a',
            'a88fda5954e89178c372716a6a78b8180ed4dad3',
          ],
        ),
      );
    });

    test('minPriority returns nothing', () async {
      fakeApiClient.setResponse('');
      await torrentsController.minPriority(
        torrents: const Torrents(
          hashes: [
            'd984f67af9917b214cd8b6048ab5624c7df6a07a',
            'a88fda5954e89178c372716a6a78b8180ed4dad3',
          ],
        ),
      );
    });

    test('setFilePriority returns nothing', () async {
      fakeApiClient.setResponse('');
      await torrentsController.setFilePriority(
        hash: 'd984f67af9917b214cd8b6048ab5624c7df6a07a',
        fileIds: ['0', '1'],
        priority: FilePriority.ignored,
      );
    });

    test('setFilePriority file ids separated by |', () async {
      fakeApiClient.setResponse('');
      await torrentsController.setFilePriority(
        hash: 'd984f67af9917b214cd8b6048ab5624c7df6a07a',
        fileIds: ['0', '1'],
        priority: FilePriority.ignored,
      );
      final body = fakeApiClient.getBody() as Map<String, dynamic>?;
      expect(body?['id'], '0|1');
    });

    test('getDownloadLimit returns a map of download limits', () async {
      fakeApiClient.setResponse('''
      {
        "8c212779b4abde7c6bc608063a0d008b7e40ce32": 338944,
        "284b83c9c7935002391129fd97f43db5d7cc2ba0": 123
      }
      ''', isJson: true);
      final limits = await torrentsController.getDownloadLimit(
        torrents: const Torrents(
          hashes: [
            '8c212779b4abde7c6bc608063a0d008b7e40ce32',
            '8c212779b4abde7c6bc608063a0d008b7e40ce32',
          ],
        ),
      );
      expect(limits.length, 2);
      expect(limits['8c212779b4abde7c6bc608063a0d008b7e40ce32'], 338944);
      expect(limits['284b83c9c7935002391129fd97f43db5d7cc2ba0'], 123);
    });

    test('getDownloadLimit set params correctly', () async {
      fakeApiClient.setResponse('''
      {
        "8c212779b4abde7c6bc608063a0d008b7e40ce32": 338944,
        "284b83c9c7935002391129fd97f43db5d7cc2ba0": 123
      }
      ''', isJson: true);
      await torrentsController.getDownloadLimit(
        torrents: const Torrents(
          hashes: [
            'd984f67af9917b214cd8b6048ab5624c7df6a07a',
            'a88fda5954e89178c372716a6a78b8180ed4dad3',
          ],
        ),
      );
      final body = fakeApiClient.getBody() as Map<String, dynamic>?;
      expect(
        body?['hashes'],
        'd984f67af9917b214cd8b6048ab5624c7df6a07a|a88fda5954e89178c372716a6a78b8180ed4dad3',
      );
    });

    test('setDownloadLimit set params correctly', () async {
      fakeApiClient.setResponse('');
      await torrentsController.setDownloadLimit(
        torrents: const Torrents(
          hashes: [
            'd984f67af9917b214cd8b6048ab5624c7df6a07a',
            'a88fda5954e89178c372716a6a78b8180ed4dad3',
          ],
        ),
        limit: 100,
      );
      final body = fakeApiClient.getBody() as Map<String, dynamic>?;
      expect(
        body?['hashes'],
        'd984f67af9917b214cd8b6048ab5624c7df6a07a|a88fda5954e89178c372716a6a78b8180ed4dad3',
      );
      expect(body?['limit'], 100);
    });

    test('setShareLimit ratioLimit set accordingly', () async {
      fakeApiClient.setResponse('');
      // No ratio limit
      await torrentsController.setShareLimit(
        torrents: const Torrents.all(),
        ratioLimit: const RatioLimit.none(),
        seedingTimeLimit: const RatioLimit.none(),
      );
      expect(
        (fakeApiClient.getBody() as Map<String, dynamic>?)?['ratioLimit'],
        -1,
      );

      // Custom ratio limit
      await torrentsController.setShareLimit(
        torrents: const Torrents.all(),
        ratioLimit: const RatioLimit(2),
        seedingTimeLimit: const RatioLimit.none(),
      );
      expect(
        (fakeApiClient.getBody() as Map<String, dynamic>?)?['ratioLimit'],
        2.0,
      );

      // Global ratio limit
      await torrentsController.setShareLimit(
        torrents: const Torrents.all(),
        ratioLimit: const RatioLimit.global(),
        seedingTimeLimit: const RatioLimit.none(),
      );
      expect(
        (fakeApiClient.getBody() as Map<String, dynamic>?)?['ratioLimit'],
        -2,
      );
    });

    test('setShareLimit seedingTimeLimit set accordingly', () async {
      fakeApiClient.setResponse('');
      // No ratio limit
      await torrentsController.setShareLimit(
        torrents: const Torrents.all(),
        ratioLimit: const RatioLimit.none(),
        seedingTimeLimit: const RatioLimit.none(),
      );
      expect(
        (fakeApiClient.getBody() as Map<String, dynamic>?)?['seedingTimeLimit'],
        -1,
      );

      // Custom ratio limit
      await torrentsController.setShareLimit(
        torrents: const Torrents.all(),
        ratioLimit: const RatioLimit.none(),
        seedingTimeLimit: const RatioLimit(2),
      );
      expect(
        (fakeApiClient.getBody() as Map<String, dynamic>?)?['seedingTimeLimit'],
        2.0,
      );

      // Global ratio limit
      await torrentsController.setShareLimit(
        torrents: const Torrents.all(),
        ratioLimit: const RatioLimit.none(),
        seedingTimeLimit: const RatioLimit.global(),
      );
      expect(
        (fakeApiClient.getBody() as Map<String, dynamic>?)?['seedingTimeLimit'],
        -2,
      );
    });

    test('getUploadLimit returns a map of upload limits', () async {
      fakeApiClient.setResponse('''
      {
        "8c212779b4abde7c6bc608063a0d008b7e40ce32": 338944,
        "284b83c9c7935002391129fd97f43db5d7cc2ba0": 123
      }
      ''', isJson: true);
      final limits = await torrentsController.getUploadLimit(
        torrents: const Torrents.all(),
      );
      expect(limits.length, 2);
      expect(limits['8c212779b4abde7c6bc608063a0d008b7e40ce32'], 338944);
      expect(limits['284b83c9c7935002391129fd97f43db5d7cc2ba0'], 123);
    });

    test('getUploadLimit set params correctly', () async {
      fakeApiClient.setResponse('''
      {
        "8c212779b4abde7c6bc608063a0d008b7e40ce32": 338944,
        "284b83c9c7935002391129fd97f43db5d7cc2ba0": 123
      }
      ''', isJson: true);
      await torrentsController.getUploadLimit(
        torrents: const Torrents.all(),
      );
      final body = fakeApiClient.getBody() as Map<String, dynamic>?;
      expect(body?['hashes'], 'all');
    });

    test('setUploadLimit set params correctly', () async {
      fakeApiClient.setResponse('');
      await torrentsController.setUploadLimit(
        torrents: const Torrents.all(),
        limit: 100,
      );
      final body = fakeApiClient.getBody() as Map<String, dynamic>?;
      expect(body?['hashes'], 'all');
      expect(body?['limit'], 100);
    });

    test('setLocation set params correctly', () async {
      fakeApiClient.setResponse('');
      await torrentsController.setLocation(
        torrents: const Torrents.all(),
        location: '/home/user/Downloads',
      );
      final body = fakeApiClient.getBody() as Map<String, dynamic>?;
      expect(body?['hashes'], 'all');
      expect(body?['location'], '/home/user/Downloads');
    });

    test('rename set params correctly', () async {
      fakeApiClient.setResponse('');
      await torrentsController.rename(
        hash: '8c212779b4abde7c6bc608063a0d008b7e40ce32',
        name: 'New name',
      );
      final body = fakeApiClient.getBody() as Map<String, dynamic>?;
      expect(body?['hash'], '8c212779b4abde7c6bc608063a0d008b7e40ce32');
      expect(body?['name'], 'New name');
    });

    test('setCategory set params correctly', () async {
      fakeApiClient.setResponse('');
      await torrentsController.setCategory(
        torrents: const Torrents.all(),
        category: 'New category',
      );
      final body = fakeApiClient.getBody() as Map<String, dynamic>?;
      expect(body?['hashes'], 'all');
      expect(body?['category'], 'New category');
    });

    test('getCategories returns a map of category', () async {
      fakeApiClient.setResponse('''
      {
        "Video": {
            "name": "Video",
            "savePath": "/home/user/torrents/video/"
        },
        "eBooks": {
            "name": "eBooks",
            "savePath": "/home/user/torrents/eBooks/"
        }
      }
      ''', isJson: true);
      final categories = await torrentsController.getCategories();
      expect(categories.length, 2);
      expect(categories['Video']?.name, 'Video');
      expect(categories['Video']?.savePath, '/home/user/torrents/video/');
      expect(categories['eBooks']?.name, 'eBooks');
      expect(categories['eBooks']?.savePath, '/home/user/torrents/eBooks/');
    });

    test('createCategory set params correctly', () async {
      fakeApiClient.setResponse('');
      await torrentsController.createCategory(
        name: 'New category',
        savePath: '/home/user/torrents/new-category/',
      );
      final body = fakeApiClient.getBody() as Map<String, dynamic>?;
      expect(body?['category'], 'New category');
      expect(body?['savePath'], '/home/user/torrents/new-category/');
    });

    test('editCategory set params correctly', () async {
      fakeApiClient.setResponse('');
      await torrentsController.editCategory(
        name: 'New category',
        savePath: '/home/user/torrents/new-category/',
      );
      final body = fakeApiClient.getBody() as Map<String, dynamic>?;
      expect(body?['category'], 'New category');
      expect(body?['savePath'], '/home/user/torrents/new-category/');
    });

    test('removeCategories set params correctly', () async {
      fakeApiClient.setResponse('');
      await torrentsController.removeCategories(
        categories: ['Video', 'eBooks'],
      );
      final body = fakeApiClient.getBody() as Map<String, dynamic>?;
      expect(body?['categories'], 'Video\neBooks');
    });

    test('addTags set params correctly', () async {
      fakeApiClient.setResponse('');
      await torrentsController.addTags(
        torrents: const Torrents.all(),
        tags: ['tag1', 'tag2'],
      );
      final body = fakeApiClient.getBody() as Map<String, dynamic>?;
      expect(body?['hashes'], 'all');
      expect(body?['tags'], 'tag1,tag2');
    });

    test('removeTags set params correctly', () async {
      fakeApiClient.setResponse('');
      await torrentsController.removeTags(
        torrents: const Torrents.all(),
        tags: ['tag1', 'tag2'],
      );
      final body = fakeApiClient.getBody() as Map<String, dynamic>?;
      expect(body?['hashes'], 'all');
      expect(body?['tags'], 'tag1,tag2');
    });

    test('getTags returns a list of tags', () async {
      fakeApiClient.setResponse('''
      [
          "TagName1",
          "haha",
          "wtf"
      ]
      ''', isJson: true);
      final tags = await torrentsController.getTags();
      expect(tags.length, 3);
      expect(tags[0], 'TagName1');
      expect(tags[1], 'haha');
      expect(tags[2], 'wtf');
    });

    test('createTags set params correctly', () async {
      fakeApiClient.setResponse('');
      await torrentsController.createTags(
        tags: ['tag1', 'tag2'],
      );
      final body = fakeApiClient.getBody() as Map<String, dynamic>?;
      expect(body?['tags'], 'tag1,tag2');
    });

    test('deleteTags set params correctly', () async {
      fakeApiClient.setResponse('');
      await torrentsController.deleteTags(
        tags: ['tag1', 'tag2'],
      );
      final body = fakeApiClient.getBody() as Map<String, dynamic>?;
      expect(body?['tags'], 'tag1,tag2');
    });

    test('setAutoManagement set params correctly', () async {
      fakeApiClient.setResponse('');
      await torrentsController.setAutoManagement(
        torrents: const Torrents.all(),
        enable: true,
      );
      final body = fakeApiClient.getBody() as Map<String, dynamic>?;
      expect(body?['hashes'], 'all');
      expect(body?['enable'], true);
    });

    test('toggleSequentialDownload set params correctly', () async {
      fakeApiClient.setResponse('');
      await torrentsController.toggleSequentialDownload(
        torrents: const Torrents.all(),
      );
      final body = fakeApiClient.getBody() as Map<String, dynamic>?;
      expect(body?['hashes'], 'all');
    });

    test('toggleFirstLastPiecePrio set params correctly', () async {
      fakeApiClient.setResponse('');
      await torrentsController.toggleFirstLastPiecePriority(
        torrents: const Torrents.all(),
      );
      final body = fakeApiClient.getBody() as Map<String, dynamic>?;
      expect(body?['hashes'], 'all');
    });

    test('setForceStart set params correctly', () async {
      fakeApiClient.setResponse('');
      await torrentsController.setForceStart(
        torrents: const Torrents.all(),
        enable: true,
      );
      final body = fakeApiClient.getBody() as Map<String, dynamic>?;
      expect(body?['hashes'], 'all');
      expect(body?['value'], true);
    });

    test('setSuperSeeding set params correctly', () async {
      fakeApiClient.setResponse('');
      await torrentsController.setSuperSeeding(
        torrents: const Torrents.all(),
        enable: true,
      );
      final body = fakeApiClient.getBody() as Map<String, dynamic>?;
      expect(body?['hashes'], 'all');
      expect(body?['value'], true);
    });

    test('renameFile set params correctly', () async {
      fakeApiClient.setResponse('');
      await torrentsController.renameFile(
        hash: 'hash',
        oldPath: 'oldPath',
        newPath: 'newPath',
      );
      final body = fakeApiClient.getBody() as Map<String, dynamic>?;
      expect(body?['hash'], 'hash');
      expect(body?['oldPath'], 'oldPath');
      expect(body?['newPath'], 'newPath');
    });

    test('renameFolder set params correctly', () async {
      fakeApiClient.setResponse('');
      await torrentsController.renameFolder(
        hash: 'hash',
        oldPath: 'oldPath',
        newPath: 'newPath',
      );
      final body = fakeApiClient.getBody() as Map<String, dynamic>?;
      expect(body?['hash'], 'hash');
      expect(body?['oldPath'], 'oldPath');
      expect(body?['newPath'], 'newPath');
    });

    test('exportTorrent returns bytes', () async {
      fakeApiClient.setResponse(Uint8List.fromList([1, 2, 3]));
      final bytes = await torrentsController.exportTorrent(hash: 'hash');
      final body = fakeApiClient.getBody() as Map<String, dynamic>?;
      expect(body?['hash'], 'hash');
      expect(bytes, Uint8List.fromList([1, 2, 3]));
    });
  });
}
