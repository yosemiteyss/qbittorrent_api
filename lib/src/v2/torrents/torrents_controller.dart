// ignore_for_file: unnecessary_lambdas

import 'package:qbittorrent_api/src/network/api_client.dart';
import 'package:qbittorrent_api/src/v2/torrents/dto/add_peers_result.dart';
import 'package:qbittorrent_api/src/v2/torrents/dto/category.dart';
import 'package:qbittorrent_api/src/v2/torrents/dto/file_priority.dart';
import 'package:qbittorrent_api/src/v2/torrents/dto/new_torrents.dart';
import 'package:qbittorrent_api/src/v2/torrents/dto/piece_state.dart';
import 'package:qbittorrent_api/src/v2/torrents/dto/ratio_limit.dart';
import 'package:qbittorrent_api/src/v2/torrents/dto/torrent_contents.dart';
import 'package:qbittorrent_api/src/v2/torrents/dto/torrent_info.dart';
import 'package:qbittorrent_api/src/v2/torrents/dto/torrent_list_options.dart';
import 'package:qbittorrent_api/src/v2/torrents/dto/torrent_properties.dart';
import 'package:qbittorrent_api/src/v2/torrents/dto/torrents.dart';
import 'package:qbittorrent_api/src/v2/torrents/dto/tracker.dart';
import 'package:qbittorrent_api/src/v2/torrents/dto/web_seed.dart';
import 'package:qbittorrent_api/src/v2/transfer/dto/peer.dart';
import 'package:qbittorrent_api/src/v2/utils/list_item_converter.dart';

class TorrentsController {
  const TorrentsController(ApiClient apiClient) : _apiClient = apiClient;

  final ApiClient _apiClient;

  /// Get torrent list
  Future<List<TorrentInfo>> getTorrentsList({
    required TorrentListOptions options,
  }) async {
    final List<dynamic> data = await _apiClient.get(
      '/torrents/info',
      params: options.toJson(),
    );
    return data.map((e) => TorrentInfo.fromJson(e)).toList();
  }

  /// Get torrent generic properties
  /// [hash] - The hash of the torrent you want to get the generic properties of.
  Future<TorrentProperties> getProperties({required String hash}) async {
    final Map<String, dynamic> data = await _apiClient.get(
      '/torrents/properties',
      params: {'hash': hash},
    );
    return TorrentProperties.fromJson(data);
  }

  /// Subscribe to torrent generic properties changes by polling.
  /// [hash] - The hash of the torrent you want to get the generic properties of.
  /// [interval] - The polling interval.
  Stream<TorrentProperties> subscribeProperties({
    required String hash,
    Duration interval = const Duration(seconds: 5),
  }) {
    return Stream.periodic(interval, (_) => getProperties(hash: hash))
        .asyncExpand(Stream.fromFuture);
  }

  /// Get torrent trackers
  /// [hash] - The hash of the torrent you want to get the trackers of
  Future<List<Tracker>> getTrackers({
    required String hash,
  }) async {
    final List<dynamic> data = await _apiClient.get(
      '/torrents/trackers',
      params: {'hash': hash},
    );
    return data.map((e) => Tracker.fromJson(e)).toList();
  }

  /// Get torrent web seeds
  /// [hash] - The hash of the torrent you want to get the webseeds of
  Future<List<WebSeed>> getWebSeeds({
    required String hash,
  }) async {
    final List<dynamic> data = await _apiClient.get(
      '/torrents/webseeds',
      params: {'hash': hash},
    );
    return data.map((e) => WebSeed.fromJson(e)).toList();
  }

  /// Get torrent contents
  /// [hash] - The hash of the torrent you want to get the contents of
  /// [indexes] - The indexes of the files you want to retrieve. indexes can contain multiple values separated by |.
  Future<List<TorrentContents>> getContents({
    required String hash,
    String? indexes,
  }) async {
    final List<dynamic> data = await _apiClient.get(
      '/torrents/files',
      params: {
        'hash': hash,
        'indexes': indexes,
      },
    );
    return data.map((e) => TorrentContents.fromJson(e)).toList();
  }

  /// Get torrent pieces' states
  /// [hash] - The hash of the torrent you want to get the pieces' states of
  Future<List<PieceState>> getPieceStates({
    required String hash,
  }) async {
    final List<dynamic> data = await _apiClient.get(
      '/torrents/pieceStates',
      params: {'hash': hash},
    );
    return data.map((e) => PieceState.byValue(e)).toList();
  }

  /// Subscribe to torrent pieces' states changes by polling.
  /// [hash] - The hash of the torrent you want to get the pieces' states of.
  /// [interval] - The polling interval.
  Stream<List<PieceState>> subscribePieceStates({
    required String hash,
    Duration interval = const Duration(seconds: 5),
  }) {
    return Stream.periodic(interval, (_) => getPieceStates(hash: hash))
        .asyncExpand(Stream.fromFuture);
  }

  /// Get torrent pieces' hashes
  /// [hash] - The hash of the torrent you want to get the pieces' hashes of
  Future<List<String>> getPieceHashes({
    required String hash,
  }) async {
    final List<dynamic> data = await _apiClient.get(
      '/torrents/pieceHashes',
      params: {'hash': hash},
    );
    return data.map((e) => e as String).toList();
  }

  /// Pause torrents
  /// [torrents] - The torrents to pause
  Future<void> pauseTorrents({required Torrents torrents}) async {
    await _apiClient.post(
      '/torrents/pause',
      body: {'hashes': torrents.toRequestString()},
    );
  }

  /// Resume torrents
  /// [torrents] - The torrents to resume
  Future<void> resumeTorrents({required Torrents torrents}) async {
    await _apiClient.post(
      '/torrents/resume',
      body: {'hashes': torrents.toRequestString()},
    );
  }

  /// Delete torrents
  /// [torrents] - The torrents to delete.
  /// [deleteFiles] - If set to true, the downloaded data will also be deleted, otherwise has no effect.
  Future<void> deleteTorrents({
    required Torrents torrents,
    bool? deleteFiles,
  }) async {
    await _apiClient.post(
      '/torrents/delete',
      body: {
        'hashes': torrents.toRequestString(),
        'deleteFiles': deleteFiles,
      },
    );
  }

  /// Recheck torrents
  /// [torrents] - The torrents to recheck
  Future<void> recheckTorrents({required Torrents torrents}) async {
    await _apiClient.post(
      '/torrents/recheck',
      body: {'hashes': torrents.toRequestString()},
    );
  }

  /// Reannounce torrents
  /// [torrents] - The torrents to reannounce
  Future<void> reannounceTorrents({required Torrents torrents}) async {
    await _apiClient.post(
      '/torrents/reannounce',
      body: {'hashes': torrents.toRequestString()},
    );
  }

  /// Add new torrent
  /// [torrents] - The torrent files or urls to add
  Future<void> addNewTorrents({required NewTorrents torrents}) async {
    await _apiClient.post(
      '/torrents/add',
      formData: torrents.toFormData(),
    );
  }

  /// Add trackers to torrent
  /// [hash] - The hash of the torrent you want to add trackers to
  /// [urls] - The URLs of the trackers you want to add.
  Future<void> addTrackers({
    required String hash,
    required List<String> urls,
  }) async {
    await _apiClient.post(
      '/torrents/addTrackers',
      body: {
        'hash': hash,
        'urls': urls.join('%0A'),
      },
    );
  }

  /// Edit trackers
  /// [hash] - The hash of the torrent you want to edit trackers of
  /// [origUrl] - The tracker URL you want to edit
  /// [newUrl] - The new URL to replace the [origUrl]
  Future<void> editTracker({
    required String hash,
    required String origUrl,
    required String newUrl,
  }) async {
    await _apiClient.post(
      '/torrents/editTracker',
      body: {
        'hash': hash,
        'origUrl': origUrl,
        'newUrl': newUrl,
      },
    );
  }

  /// Remove trackers
  /// [hash] - The hash of the torrent
  /// [urls] - URLs to remove
  Future<void> removeTrackers({
    required String hash,
    required List<String> urls,
  }) async {
    await _apiClient.post(
      '/torrents/removeTrackers',
      body: {
        'hash': hash,
        'urls': const ListItemConverter.bar().toJson(urls),
      },
    );
  }

  /// Add peers.
  /// Returns a map of results, with the key being the hash of the torrent and
  /// the value being the result of the operation.
  /// [hash] - The hash of the torrent you want to add peers to
  /// [peers] - The peers to add
  Future<Map<String, AddPeersResult>> addPeers({
    required List<String> hashes,
    required List<Peer> peers,
  }) async {
    final Map<String, dynamic> data = await _apiClient.post(
      '/torrents/addPeers',
      body: {
        'hashes': const ListItemConverter.bar().toJson(hashes),
        'peers': const ListItemConverter.bar().toJson(
          peers.map((e) => e.toString()).toList(),
        ),
      },
    );
    return data.map(
      (key, value) => MapEntry(key, AddPeersResult.fromJson(value)),
    );
  }

  /// Increase torrent priority
  /// [torrents] - The torrents you want to increase the priority of.
  Future<void> increasePriority({required Torrents torrents}) async {
    await _apiClient.post(
      '/torrents/increasePrio',
      body: {'hashes': torrents.toRequestString()},
    );
  }

  /// Decrease torrent priority
  /// [torrents] - The torrents you want to decrease the priority of.
  Future<void> decreasePriority({required Torrents torrents}) async {
    await _apiClient.post(
      '/torrents/decreasePrio',
      body: {'hashes': torrents.toRequestString()},
    );
  }

  /// Maximal torrent priority
  /// [torrents] - The torrents you want to set to the maximum priority.
  Future<void> maxPriority({required Torrents torrents}) async {
    await _apiClient.post(
      '/torrents/topPrio',
      body: {'hashes': torrents.toRequestString()},
    );
  }

  /// Minimal torrent priority
  /// [torrents] - The torrents you want to set to the minimum priority.
  Future<void> minPriority({required Torrents torrents}) async {
    await _apiClient.post(
      '/torrents/bottomPrio',
      body: {'hashes': torrents.toRequestString()},
    );
  }

  /// Set file priority
  /// [hash] - The hash of the torrent
  /// [fileIds] - List of file IDs
  /// [priority] - File priority to set
  Future<void> setFilePriority({
    required String hash,
    required List<String> fileIds,
    required FilePriority priority,
  }) async {
    await _apiClient.post(
      '/torrents/filePrio',
      body: {
        'hash': hash,
        'id': const ListItemConverter.bar().toJson(fileIds),
        'priority': priority.value,
      },
    );
  }

  /// Get torrent download limit.
  /// Returns a map of torrents with their download limits.
  /// [torrents] - The torrents to get the download limit of.
  Future<Map<String, int>> getDownloadLimit({
    required Torrents torrents,
  }) async {
    final Map<String, dynamic> data = await _apiClient.post(
      '/torrents/downloadLimit',
      body: {'hashes': torrents.toRequestString()},
    );
    return data.map((key, value) => MapEntry(key, value as int));
  }

  /// Set torrent download limit
  /// [torrents] - The torrents to set the download limit of.
  /// [limit] - The download limit in bytes per second.
  Future<void> setDownloadLimit({
    required Torrents torrents,
    required int limit,
  }) async {
    await _apiClient.post(
      '/torrents/setDownloadLimit',
      body: {
        'hashes': torrents.toRequestString(),
        'limit': limit,
      },
    );
  }

  /// Set torrent share limit
  /// [torrents] - The torrents to set the share limit of.
  /// [ratioLimit] - the max ratio the torrent should be seeded until.
  /// [seedingTimeLimit] - the max amount of time (minutes) the torrent should be seeded.
  Future<void> setShareLimit({
    required Torrents torrents,
    required RatioLimit ratioLimit,
    required RatioLimit seedingTimeLimit,
  }) async {
    await _apiClient.post(
      '/torrents/setShareLimits',
      body: {
        'hashes': torrents.toRequestString(),
        'ratioLimit': ratioLimit.ratio,
        'seedingTimeLimit': seedingTimeLimit.ratio,
      },
    );
  }

  /// Get torrent upload limit
  /// Returns a map of torrents with their upload limits.
  /// [torrents] - The torrents to get the upload limit of.
  Future<Map<String, int>> getUploadLimit({
    required Torrents torrents,
  }) async {
    final Map<String, dynamic> data = await _apiClient.post(
      '/torrents/uploadLimit',
      body: {'hashes': torrents.toRequestString()},
    );
    return data.map((key, value) => MapEntry(key, value as int));
  }

  /// Set torrent upload limit
  /// [torrents] - The torrents to set the upload limit of.
  /// [limit] - The upload limit in bytes per second
  Future<void> setUploadLimit({
    required Torrents torrents,
    required int limit,
  }) async {
    await _apiClient.post(
      '/torrents/setUploadLimit',
      body: {
        'hashes': torrents.toRequestString(),
        'limit': limit,
      },
    );
  }

  /// Set torrent location
  /// [torrents] - The torrents to set the location of.
  /// [location] - The location to download the torrent to.
  /// If the location doesn't exist, the torrent's location is unchanged.
  Future<void> setLocation({
    required Torrents torrents,
    required String location,
  }) async {
    await _apiClient.post(
      '/torrents/setLocation',
      body: {
        'hashes': torrents.toRequestString(),
        'location': location,
      },
    );
  }

  /// Set torrent name
  /// [hash] - The hash of the torrent
  /// [name] - The new name of the torrent
  Future<void> rename({required String hash, required String name}) async {
    await _apiClient.post(
      '/torrents/rename',
      body: {'hash': hash, 'name': name},
    );
  }

  /// Set torrent category
  /// [torrents] - The torrents to set the category of.
  /// [category] - The torrent category you want to set.
  Future<void> setCategory({
    required Torrents torrents,
    required String category,
  }) async {
    await _apiClient.post(
      '/torrents/setCategory',
      body: {
        'hashes': torrents.toRequestString(),
        'category': category,
      },
    );
  }

  /// Get all categories
  Future<Map<String, Category>> getCategories() async {
    final Map<String, dynamic> data = await _apiClient.get(
      '/torrents/categories',
    );
    return data.map(
      (key, value) => MapEntry(key, Category.fromJson(value)),
    );
  }

  /// Add new category
  Future<void> createCategory({
    required String name,
    required String savePath,
  }) async {
    await _apiClient.post(
      '/torrents/createCategory',
      body: {'category': name, 'savePath': savePath},
    );
  }

  /// Edit category
  Future<void> editCategory({
    required String name,
    required String savePath,
  }) async {
    await _apiClient.post(
      '/torrents/editCategory',
      body: {'category': name, 'savePath': savePath},
    );
  }

  /// Remove categories
  /// [categories] - Names of the categories to remove
  Future<void> removeCategories({required List<String> categories}) async {
    await _apiClient.post(
      '/torrents/removeCategories',
      body: {
        'categories': const ListItemConverter.newline().toJson(categories),
      },
    );
  }

  /// Add torrent tags
  /// [torrents] - The torrents to add tags to.
  /// [tags] - The list of tags you want to add to passed torrents.
  Future<void> addTags({
    required Torrents torrents,
    required List<String> tags,
  }) async {
    await _apiClient.post(
      '/torrents/addTags',
      body: {
        'hashes': torrents.toRequestString(),
        'tags': const ListItemConverter.comma().toJson(tags),
      },
    );
  }

  /// Remove torrent tags
  /// [torrents] - The torrents to remove tags from.
  /// [tags] - The list of tags you want to remove from passed torrents.
  /// Empty list removes all tags from relevant torrents.
  Future<void> removeTags({
    required Torrents torrents,
    required List<String> tags,
  }) async {
    await _apiClient.post(
      '/torrents/removeTags',
      body: {
        'hashes': torrents.toRequestString(),
        'tags': const ListItemConverter.comma().toJson(tags),
      },
    );
  }

  /// Get all tags
  Future<List<String>> getTags() async {
    final List<dynamic> data = await _apiClient.get('/torrents/tags');
    return data.map((e) => e as String).toList();
  }

  /// Create tags
  /// [tags] - The list of tags you want to create
  Future<void> createTags({required List<String> tags}) async {
    await _apiClient.post(
      '/torrents/createTags',
      body: {
        'tags': const ListItemConverter.comma().toJson(tags),
      },
    );
  }

  /// Delete tags
  /// [tags] - The list of tags you want to delete
  Future<void> deleteTags({required List<String> tags}) async {
    await _apiClient.post(
      '/torrents/deleteTags',
      body: {
        'tags': const ListItemConverter.comma().toJson(tags),
      },
    );
  }

  /// Set automatic torrent management
  /// [torrents] - The torrents to set automatic management of.
  /// [enable] - Enable or disable automatic torrent management
  Future<void> setAutoManagement({
    required Torrents torrents,
    required bool enable,
  }) async {
    await _apiClient.post(
      '/torrents/setAutoManagement',
      body: {
        'hashes': torrents.toRequestString(),
        'enable': enable,
      },
    );
  }

  /// Toggle sequential download
  /// [torrents] - The torrents to toggle sequential download of.
  Future<void> toggleSequentialDownload({required Torrents torrents}) async {
    await _apiClient.post(
      '/torrents/toggleSequentialDownload',
      body: {'hashes': torrents.toRequestString()},
    );
  }

  /// Toggle first/last piece priority
  /// [torrents] - The torrents to toggle first/last piece priority of.
  Future<void> toggleFirstLastPiecePriority({
    required Torrents torrents,
  }) async {
    await _apiClient.post(
      '/torrents/toggleFirstLastPiecePrio',
      body: {'hashes': torrents.toRequestString()},
    );
  }

  /// Set force start
  /// [torrents] - The torrents to set force start of.
  /// [enable] - Enable or disable force start.
  Future<void> setForceStart({
    required Torrents torrents,
    required bool enable,
  }) async {
    await _apiClient.post(
      '/torrents/setForceStart',
      body: {
        'hashes': torrents.toRequestString(),
        'value': enable,
      },
    );
  }

  /// Set super seeding
  /// [torrents] - The torrents to set super seeding of.
  Future<void> setSuperSeeding({
    required Torrents torrents,
    required bool enable,
  }) async {
    await _apiClient.post(
      '/torrents/setSuperSeeding',
      body: {
        'hashes': torrents.toRequestString(),
        'value': enable,
      },
    );
  }

  /// Rename file
  /// [hash] - The hash of the torrent
  /// [oldPath] - The path of the file to rename
  /// [newPath] - The new path of the file
  Future<void> renameFile({
    required String hash,
    required String oldPath,
    required String newPath,
  }) async {
    await _apiClient.post(
      '/torrents/renameFile',
      body: {
        'hash': hash,
        'oldPath': oldPath,
        'newPath': newPath,
      },
    );
  }

  /// Rename folder
  /// [hash] - The hash of the torrent
  /// [oldPath] - The path of the folder to rename
  /// [newPath] - The new path of the folder
  Future<void> renameFolder({
    required String hash,
    required String oldPath,
    required String newPath,
  }) async {
    await _apiClient.post(
      '/torrents/renameFolder',
      body: {
        'hash': hash,
        'oldPath': oldPath,
        'newPath': newPath,
      },
    );
  }
}
