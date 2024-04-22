import 'package:qbittorrent_api/src/v2/utils/empty_string_converter.dart';
import 'package:test/test.dart';

void main() {
  test('fromJson should convert empty string to null', () {
    const converter = EmptyStringToInt();
    expect(null, converter.fromJson(''));
  });
}
