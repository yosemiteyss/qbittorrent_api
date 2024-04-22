import 'package:qbittorrent_api/src/v2/utils/list_item_converter.dart';
import 'package:test/test.dart';

void main() {
  group('test ListItemConverter.comma', () {
    test('fromJson splits values by comma', () {
      const converter = ListItemConverter.comma();
      expect(converter.fromJson('a,b,c'), ['a', 'b', 'c']);
    });

    test('fromJson returns empty list if json is empty', () {
      const converter = ListItemConverter.comma();
      expect(converter.fromJson(''), <String>[]);
    });

    test('fromJson returns trimmed items', () async {
      const converter = ListItemConverter.comma();
      expect(converter.fromJson('a, b, c'), ['a', 'b', 'c']);
    });

    test('toJson join values by comma', () {
      const converter = ListItemConverter.comma();
      expect(converter.toJson(['a', 'b', 'c']), 'a,b,c');
    });
  });

  group('test ListItemConverter.bar', () {
    test('fromJson splits values by bar', () {
      const converter = ListItemConverter.bar();
      expect(converter.fromJson('a|b|c'), ['a', 'b', 'c']);
    });

    test('fromJson returns empty list if json is empty', () {
      const converter = ListItemConverter.bar();
      expect(converter.fromJson(''), <String>[]);
    });

    test('fromJson returns trimmed items', () async {
      const converter = ListItemConverter.bar();
      expect(converter.fromJson('a| b| c'), ['a', 'b', 'c']);
    });

    test('toJson join values by bar', () {
      const converter = ListItemConverter.bar();
      expect(converter.toJson(['a', 'b', 'c']), 'a|b|c');
    });
  });

  group('test ListItemConverter.newline', () {
    test('fromJson splits values by newline', () {
      const converter = ListItemConverter.newline();
      expect(converter.fromJson('a\nb\nc'), ['a', 'b', 'c']);
    });

    test('fromJson returns empty list if json is empty', () {
      const converter = ListItemConverter.newline();
      expect(converter.fromJson(''), <String>[]);
    });

    test('fromJson returns trimmed items', () async {
      const converter = ListItemConverter.newline();
      expect(converter.fromJson('a\n b\n c'), ['a', 'b', 'c']);
    });

    test('toJson join values by newline', () {
      const converter = ListItemConverter.newline();
      expect(converter.toJson(['a', 'b', 'c']), 'a\nb\nc');
    });
  });
}
