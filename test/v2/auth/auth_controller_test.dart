import 'dart:io';

import 'package:qbittorrent_api/src/v2/auth/auth_controller.dart';
import 'package:qbittorrent_api/src/v2/exception/qbittorrent_exception.dart';
import 'package:test/test.dart';

import '../../network/fake_api_client.dart';
import '../fixture.dart';

void main() {
  late final FakeApiClient fakeApiClient;
  late final AuthController authController;

  setUpAll(() {
    fakeApiClient = FakeApiClient();
    authController = AuthController(fakeApiClient);
  });

  group('test AuthController', () {
    test('login returns nothing', () async {
      fakeApiClient.setResponse('Ok.');
      await authController.login(
        username: defaultUsername,
        password: defaultPassword,
      );
    });

    test('login throws unauthorized exceptions when response is not Ok',
        () async {
      fakeApiClient.setResponse('Fails.');
      try {
        await authController.login(
          username: defaultUsername,
          password: defaultPassword,
        );
      } on QBittorrentException catch (e) {
        expect(e.statusCode, HttpStatus.unauthorized);
        return;
      }
      throw Exception('Expected QBittorrentException');
    });

    test('logout returns nothing', () async {
      fakeApiClient.setResponse('Ok.');
      await authController.logout();
    });
  });
}
