import 'package:qbittorrent_api/src/v2/transfer/dto/peer.dart';
import 'package:test/test.dart';

void main() {
  group('test Peer', () {
    test('toString returns colon-separated host:port', () {
      const peer = Peer(host: '1.1.1.1', port: 1234);
      expect(peer.toString(), '1.1.1.1:1234');
    });
  });
}
