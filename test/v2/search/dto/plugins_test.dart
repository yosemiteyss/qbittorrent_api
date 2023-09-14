import 'package:qbittorrent_api/src/v2/search/dto/plugins.dart';
import 'package:test/test.dart';

void main() {
  group('test Plugins', () {
    test('Plugins.multiple toRequestString returns plugins concatenated by |',
        () {
      const selector = Plugins(plugins: ['plugin1', 'plugin12']);
      expect(selector.toRequestString(), 'plugin1|plugin12');
    });

    test('Plugins.all toRequestString returns all', () {
      const selector = Plugins.all();
      expect(selector.toRequestString(), 'all');
    });

    test('Plugins::enabled toRequestString returns enabled', () async {
      const selector = Plugins.enabled();
      expect(selector.toRequestString(), 'enabled');
    });
  });
}
