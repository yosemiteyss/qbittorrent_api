import 'package:qbittorrent_api/qbittorrent_api.dart';
import 'package:test/test.dart';

void main() {
  group('test TorrentSort', () {
    test('should TorrentSort request parameters converted to snake case', () {
      const listOptions = TorrentListOptions(sort: TorrentSort.addedOn);
      final json = listOptions.toJson();
      expect(json['sort'], 'added_on');
    });
  });
}
