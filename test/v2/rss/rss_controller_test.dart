import 'package:qbittorrent_api/src/v2/rss/rss_controller.dart';
import 'package:test/test.dart';

import '../../network/fake_api_client.dart';

void main() {
  late final FakeApiClient fakeApiClient;
  late final RSSController rssController;

  setUpAll(() async {
    fakeApiClient = FakeApiClient();
    rssController = RSSController(fakeApiClient);
  });

  group('RSSController', () {
    test('addFolder set params correctly', () async {
      fakeApiClient.setResponse('');
      await rssController.addFolder(path: 'path');
      final body = fakeApiClient.getBody() as Map<String, dynamic>?;
      expect(body?['path'], 'path');
    });

    test('addFeed set params correctly', () async {
      fakeApiClient.setResponse('');
      await rssController.addPath(url: 'url', path: 'path');
      final body = fakeApiClient.getBody() as Map<String, dynamic>?;
      expect(body?['url'], 'url');
      expect(body?['path'], 'path');
    });

    test('removeItem set params correctly', () async {
      fakeApiClient.setResponse('');
      await rssController.removeItem(path: 'path');
      final body = fakeApiClient.getBody() as Map<String, dynamic>?;
      expect(body?['path'], 'path');
    });

    test('moveItem set params correctly', () async {
      fakeApiClient.setResponse('');
      await rssController.moveItem(itemPath: 'itemPath', destPath: 'destPath');
      final body = fakeApiClient.getBody() as Map<String, dynamic>?;
      expect(body?['itemPath'], 'itemPath');
      expect(body?['destPath'], 'destPath');
    });
  });
}
