import 'dart:io';

import 'package:qbittorrent_api/qbittorrent_api.dart';
import 'package:test/test.dart';

void main() {
  group('InMemoryCookiesStrategy', () {
    test('should supports equality', () {
      expect(
        const InMemoryCookiesStrategy(),
        equals(const InMemoryCookiesStrategy()),
      );
    });
  });

  group('DiskCookiesStrategy', () {
    test('should be equal when directories are the same', () {
      const strategy1 = DiskCookiesStrategy(directory: '/tmp/cookies');
      const strategy2 = DiskCookiesStrategy(directory: '/tmp/cookies');
      expect(strategy1, equals(strategy2));
    });

    test('should not be equal when directories differ', () {
      const strategy1 = DiskCookiesStrategy(directory: '/tmp/cookies');
      const strategy2 = DiskCookiesStrategy(directory: '/tmp/other');
      expect(strategy1, isNot(equals(strategy2)));
    });

    test('should normalizes directory with trailing separator', () {
      final separator = Platform.pathSeparator;

      final strategyWithSlash = DiskCookiesStrategy(
        directory: '/tmp$separator',
      );
      expect(
        strategyWithSlash.normalizedDirectory,
        equals('/tmp$separator'),
      );

      const strategyWithoutSlash = DiskCookiesStrategy(directory: '/tmp');
      expect(
        strategyWithoutSlash.normalizedDirectory,
        equals('/tmp$separator'),
      );
    });
  });

  group('WebCookiesStrategy', () {
    test('should supports equality', () {
      expect(
        const WebCookiesStrategy(),
        equals(const WebCookiesStrategy()),
      );
    });
  });
}
