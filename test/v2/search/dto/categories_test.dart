import 'package:qbittorrent_api/src/v2/search/dto/categories.dart';
import 'package:test/test.dart';

void main() {
  group('test Categories', () {
    test(
        'Categories.multiple toRequestString '
        'returns categories concatenated by |', () {
      const selector = Categories(categories: ['cat1', 'cat2']);
      expect(selector.toRequestString(), 'cat1|cat2');
    });

    test('Categories.all toRequestString returns all', () {
      const selector = Categories.all();
      expect(selector.toRequestString(), 'all');
    });
  });
}
