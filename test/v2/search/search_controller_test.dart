import 'package:qbittorrent_api/src/v2/search/dto/categories.dart';
import 'package:qbittorrent_api/src/v2/search/dto/plugins.dart';
import 'package:qbittorrent_api/src/v2/search/dto/search_job_status.dart';
import 'package:qbittorrent_api/src/v2/search/search_controller.dart';
import 'package:test/test.dart';

import '../../network/fake_api_client.dart';

void main() {
  late final FakeApiClient fakeApiClient;
  late final SearchController searchController;

  setUpAll(() async {
    fakeApiClient = FakeApiClient();
    searchController = SearchController(fakeApiClient);
  });

  group('SearchController', () {
    test('startSearch returns a search job', () async {
      fakeApiClient.setResponse('''
      {
        "id": 12345
      }
      ''', isJson: true);
      final job = await searchController.startSearch(
        pattern: 'pattern',
        plugins: const Plugins.all(),
        categories: const Categories.all(),
      );
      expect(job.id, 12345);
    });

    test('startSearch set params correctly', () async {
      fakeApiClient.setResponse('''
      {
        "id": 12345
      }
      ''', isJson: true);
      await searchController.startSearch(
        pattern: 'pattern',
        plugins: const Plugins.all(),
        categories: const Categories.all(),
      );
      final body = fakeApiClient.getBody() as Map<String, dynamic>?;
      expect(body?['pattern'], 'pattern');
      expect(body?['plugins'], 'all');
      expect(body?['category'], 'all');
    });

    test('stopSearch set params correctly', () async {
      fakeApiClient.setResponse('''
      {
        "id": 12345
      }
      ''', isJson: true);
      await searchController.stopSearch(id: 12345);
      final body = fakeApiClient.getBody() as Map<String, dynamic>?;
      expect(body?['id'], 12345);
    });

    test('getSearchStatus returns a list of search status', () async {
      fakeApiClient.setResponse('''
      [
          {
              "id": 1524051718,
              "status": "Stopped",
              "total": 0
          }
      ]
      ''', isJson: true);
      final status = await searchController.getSearchStatus(id: 12345);
      expect(status.length, 1);
      expect(status[0].id, 1524051718);
      expect(status[0].status, SearchJobStatus.stopped);
      expect(status[0].total, 0);
    });

    test('getSearchStatus set params correctly', () async {
      fakeApiClient.setResponse('''
      [
          {
              "id": 1524051718,
              "status": "Stopped",
              "total": 0
          }
      ]
      ''', isJson: true);
      await searchController.getSearchStatus(id: 12345);
      final body = fakeApiClient.getBody() as Map<String, dynamic>?;
      expect(body?['id'], 12345);
    });

    test('getSearchResults returns search result', () async {
      fakeApiClient.setResponse('''
      {
          "results": [
              {
                  "descrLink": "http://www.legittorrents.info/index.php?page=torrent-details&id=8d5f512e1acb687029b8d7cc6c5a84dce51d7a41",
                  "fileName": "Ubuntu-10.04-32bit-NeTV.ova",
                  "fileSize": -1,
                  "fileUrl": "http://www.legittorrents.info/download.php?id=8d5f512e1acb687029b8d7cc6c5a84dce51d7a41&f=Ubuntu-10.04-32bit-NeTV.ova.torrent",
                  "nbLeechers": 1,
                  "nbSeeders": 0,
                  "siteUrl": "http://www.legittorrents.info"
              },
              {
                  "descrLink": "http://www.legittorrents.info/index.php?page=torrent-details&id=d5179f53e105dc2c2401bcfaa0c2c4936a6aa475",
                  "fileName": "mangOH-Legato-17_06-Ubuntu-16_04.ova",
                  "fileSize": -1,
                  "fileUrl": "http://www.legittorrents.info/download.php?id=d5179f53e105dc2c2401bcfaa0c2c4936a6aa475&f=mangOH-Legato-17_06-Ubuntu-16_04.ova.torrent",
                  "nbLeechers": 0,
                  "nbSeeders": 59,
                  "siteUrl": "http://www.legittorrents.info"
              }
          ],
          "status": "Running",
          "total": 2
      }
      ''', isJson: true);
      final result = await searchController.getSearchResults(
        id: 12345,
        limit: 2,
        offset: 0,
      );
      expect(result.status, SearchJobStatus.running);
      expect(result.total, 2);
      expect(result.results?.length, 2);
      expect(
        result.results?[0].descrLink,
        'http://www.legittorrents.info/index.php?page=torrent-details&id=8d5f512e1acb687029b8d7cc6c5a84dce51d7a41',
      );
      expect(result.results?[0].fileName, 'Ubuntu-10.04-32bit-NeTV.ova');
      expect(result.results?[0].fileSize, -1);
      expect(
        result.results?[0].fileUrl,
        'http://www.legittorrents.info/download.php?id=8d5f512e1acb687029b8d7cc6c5a84dce51d7a41&f=Ubuntu-10.04-32bit-NeTV.ova.torrent',
      );
      expect(result.results?[0].nbLeechers, 1);
      expect(result.results?[0].nbSeeders, 0);
      expect(result.results?[0].siteUrl, 'http://www.legittorrents.info');
    });

    test('getSearchResults set params correctly', () async {
      fakeApiClient.setResponse('''
      {
          "results": [
              {
                  "descrLink": "http://www.legittorrents.info/index.php?page=torrent-details&id=8d5f512e1acb687029b8d7cc6c5a84dce51d7a41",
                  "fileName": "Ubuntu-10.04-32bit-NeTV.ova",
                  "fileSize": -1,
                  "fileUrl": "http://www.legittorrents.info/download.php?id=8d5f512e1acb687029b8d7cc6c5a84dce51d7a41&f=Ubuntu-10.04-32bit-NeTV.ova.torrent",
                  "nbLeechers": 1,
                  "nbSeeders": 0,
                  "siteUrl": "http://www.legittorrents.info"
              },
              {
                  "descrLink": "http://www.legittorrents.info/index.php?page=torrent-details&id=d5179f53e105dc2c2401bcfaa0c2c4936a6aa475",
                  "fileName": "mangOH-Legato-17_06-Ubuntu-16_04.ova",
                  "fileSize": -1,
                  "fileUrl": "http://www.legittorrents.info/download.php?id=d5179f53e105dc2c2401bcfaa0c2c4936a6aa475&f=mangOH-Legato-17_06-Ubuntu-16_04.ova.torrent",
                  "nbLeechers": 0,
                  "nbSeeders": 59,
                  "siteUrl": "http://www.legittorrents.info"
              }
          ],
          "status": "Running",
          "total": 2
      }
      ''', isJson: true);
      await searchController.getSearchResults(
        id: 12345,
        limit: 2,
        offset: 0,
      );
      final body = fakeApiClient.getBody() as Map<String, dynamic>?;
      expect(body?['id'], 12345);
      expect(body?['limit'], 2);
      expect(body?['offset'], 0);
    });

    test('deleteSearch set params correctly', () async {
      fakeApiClient.setResponse('');
      await searchController.deleteSearch(id: 12345);
      final body = fakeApiClient.getBody() as Map<String, dynamic>?;
      expect(body?['id'], 12345);
    });

    test('getPlugins returns a list of plugins', () async {
      fakeApiClient.setResponse('''
      [
          {
              "enabled": true,
              "fullName": "Legit Torrents",
              "name": "legittorrents",
              "supportedCategories": [{
                  "id": "all",
                  "name": "All categories"
              }, {
                  "id": "anime",
                  "name": "Anime"
              }, {
                  "id": "books",
                  "name": "Books"
              }, {
                  "id": "games",
                  "name": "Games"
              }, {
                  "id": "movies",
                  "name": "Movies"
              }, {
                  "id": "music",
                  "name": "Music"
              }, {
                  "id": "tv",
                  "name": "TV shows"
              }],
              "url": "http://www.legittorrents.info",
              "version": "2.3"
          }
      ]
      ''', isJson: true);
      final plugins = await searchController.getPlugins();
      expect(plugins.length, 1);
      expect(plugins[0].enabled, true);
      expect(plugins[0].fullName, 'Legit Torrents');
      expect(plugins[0].name, 'legittorrents');
      expect(plugins[0].supportedCategories?.length, 7);
      expect(plugins[0].supportedCategories?[0].id, 'all');
      expect(plugins[0].supportedCategories?[0].name, 'All categories');
      expect(plugins[0].url, 'http://www.legittorrents.info');
      expect(plugins[0].version, '2.3');
    });

    test('installPlugin set params correctly', () async {
      fakeApiClient.setResponse('');
      await searchController.installPlugin(
        sources: [
          'http://example.com/plugin.zip',
          'http://example.com/plugin2.zip',
        ],
      );
      final body = fakeApiClient.getBody() as Map<String, dynamic>?;
      expect(
        body?['sources'],
        'http://example.com/plugin.zip|http://example.com/plugin2.zip',
      );
    });

    test('uninstallPlugin set params correctly', () async {
      fakeApiClient.setResponse('');
      await searchController.uninstallPlugin(
        names: ['legittorrents', 'other'],
      );
      final body = fakeApiClient.getBody() as Map<String, dynamic>?;
      expect(body?['names'], 'legittorrents|other');
    });

    test('enablePlugin set params correctly', () async {
      fakeApiClient.setResponse('');
      await searchController.enablePlugin(
        names: ['legittorrents', 'other'],
        enable: true,
      );
      final body = fakeApiClient.getBody() as Map<String, dynamic>?;
      expect(body?['names'], 'legittorrents|other');
    });
  });
}
