import 'package:qbittorrent_api/src/v2/torrents/dto/torrents.dart';
import 'package:test/test.dart';

void main() {
  group('test Torrents', () {
    test('Torrents.multiple toRequestString returns hashes concatenated by |',
        () {
      const selector = Torrents(hashes: ['hash1', 'hash2']);
      expect(selector.toRequestString(), 'hash1|hash2');
    });

    test('Torrents.all toRequestString returns all', () {
      const selector = Torrents.all();
      expect(selector.toRequestString(), 'all');
    });
  });
}
