import 'package:qbittorrent_api/qbittorrent_api.dart';

Future<void> main() async {
  final qbittorrent = QBittorrentApiV2(
    baseUrl: 'http://localhost:8090',
    cookiePath: '.',
    logger: true,
  );

  // Login
  await qbittorrent.auth.login(username: 'admin', password: 'adminadmin');

  // Add torrents by urls
  const torrents = NewTorrents.urls(
    urls: ['https://example.torrent', 'https://example-2.torrent'],
  );
  await qbittorrent.torrents.addNewTorrents(torrents: torrents);

  // Subscribe to torrent list
  qbittorrent.sync.subscribeMainData().listen((data) {
    print(data.rid);
  });
}
