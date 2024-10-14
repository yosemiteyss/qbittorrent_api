# qbittorrent_api
Dart wrapper for qBittorrent Web API.

[![pub package](https://img.shields.io/pub/v/qbittorrent_api.svg)](https://pub.dev/packages/qbittorrent_api)

## Overview
This package provides a Dart wrapper for qBittorrent Web API.

To use this package, you will need a qBittorrent server running with the Web API enabled. 

## Web API Version
Supported Web API version: `qBittorrent v4.1+`

## Setup
Create a `QBittorrentApiV2` instance by providing the URL of your qBittorrent server.
```dart
final qbittorrent = QBittorrentApiV2(
  baseUrl: 'http://localhost:8080',   // Replace with the actual URL of your qBittorrent server
  cookiePath: cookiePath,             // Path where login cookies is stored
  logger: true,                       // Enable logging
);
```

For Flutter application, set `cookiePath: null` for web environment as cookies are managed by the browser.
```dart
String? cookiePath;

// Cookies path for non-web applications.
if (!kIsWeb) {
    final directory = await getApplicationDocumentsDirectory();
    cookiePath = '${directory.path}/.cookies';
}

final qbittorrent = QBittorrentApiV2(
  baseUrl: 'http://localhost:8080',
  cookiePath: cookiePath,
  logger: kDebugMode,
);
```

## Basic Usage
This package provides methods to interact with various API endpoints. Belows are some of the examples.

To see all available methods, check out [qBittorrent WebUI API Documentation](https://github.com/qbittorrent/qBittorrent/wiki/WebUI-API-(qBittorrent-4.1)).

### Login
```dart
await qbittorent.auth.login(username: 'username', password: 'password');
```

### Add New Torrent
```dart
// Add torrents by urls.
final torrents = NewTorrents.urls(urls: ['https://example.torrent', 'https://example-2.torrent']);
await qbittorrent.torrents.addNewTorrents(torrents: torrents);

// Add torrents by files.
final torrents = NewTorrents.files(files: [File('./example.torrent')]);
await qbittorrent.torrents.addNewTorrents(torrents: torrents);

// Add torrent by bytes.
final newTorrents = NewTorrents.bytes(bytes: [FileBytes(filename: 'example.torrent', bytes: bytes)]);
await qbittorrent.torrents.addNewTorrents(torrents: torrents);
```

### Subscribe to Torrent List
```dart
const interval = Duration(seconds: 3);  // Refresh interval
final stream = qbittorrent.sync.subscribeMainData(interval: interval).listen((data) {
  // Handle main data update
});
```

### Subscribe to Torrent Properties
```dart
const hash = "123123";                  // Torrent hash
const interval = Duration(seconds: 3);  // Refresh interval
final stream = qbittorrent.torrents.subscribeProperties(hash: hash, interval: interval).listen((data) {
  // Handle torrent properties update
});
```

## Having Bugs?
- This package is under active development. If you find any bug, please create an issue on Github.

## Support
[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/guidelines/download-assets-sm-1.svg)](https://buymeacoffee.com/yosemiteyss)