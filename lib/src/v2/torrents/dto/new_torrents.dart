import 'dart:io';
import 'dart:typed_data';

import 'package:qbittorrent_api/src/v2/utils/list_item_converter.dart';

/// Represents a torrent file by bytes.
class FileBytes {
  const FileBytes({
    required this.filename,
    required this.bytes,
  });

  /// Name of the file.
  final String filename;

  /// Bytes of the file.
  final Uint8List bytes;
}

class NewTorrents {
  /// Add new torrents by files.
  const NewTorrents.files({
    required List<File> this.files,
    this.savePath,
    this.cookie,
    this.category,
    this.tags,
    this.skipChecking,
    this.paused,
    this.rootFolder,
    this.rename,
    this.upLimit,
    this.dlLimit,
    this.ratioLimit,
    this.seedingTimeLimit,
    this.autoTMM,
    this.sequentialDownload,
    this.firstLastPiecePrio,
  })  : urls = null,
        bytes = null;

  /// Add new torrents by file bytes.
  const NewTorrents.bytes({
    required List<FileBytes> this.bytes,
    this.savePath,
    this.cookie,
    this.category,
    this.tags,
    this.skipChecking,
    this.paused,
    this.rootFolder,
    this.rename,
    this.upLimit,
    this.dlLimit,
    this.ratioLimit,
    this.seedingTimeLimit,
    this.autoTMM,
    this.sequentialDownload,
    this.firstLastPiecePrio,
  })  : files = null,
        urls = null;

  /// Add new torrents by urls.
  const NewTorrents.urls({
    required List<String> this.urls,
    this.savePath,
    this.cookie,
    this.category,
    this.tags,
    this.skipChecking,
    this.paused,
    this.rootFolder,
    this.rename,
    this.upLimit,
    this.dlLimit,
    this.ratioLimit,
    this.seedingTimeLimit,
    this.autoTMM,
    this.sequentialDownload,
    this.firstLastPiecePrio,
  })  : files = null,
        bytes = null;

  /// Torrent urls.
  final List<String>? urls;

  /// Torrent files.
  final List<File>? files;

  /// Torrent bytes.
  final List<FileBytes>? bytes;

  /// Download folder
  final String? savePath;

  /// Cookie sent to download the .torrent file
  final String? cookie;

  /// Category for the torrent
  final String? category;

  /// Tags for the torrent, split by ','
  @ListItemConverter.comma()
  final List<String>? tags;

  /// Skip hash checking. Possible values are true, false (default)
  final bool? skipChecking;

  /// Add torrents in the paused state. Possible values are true, false (default)
  final bool? paused;

  /// Create the root folder. Possible values are true, false (default)
  final bool? rootFolder;

  /// Rename torrent
  final String? rename;

  /// Set torrent upload speed limit. Unit in bytes/second
  final int? upLimit;

  /// Set torrent download speed limit. Unit in bytes/second
  final int? dlLimit;

  /// Set torrent share ratio limit (Since 2.8.1)
  final double? ratioLimit;

  /// Set torrent seeding time limit. Unit in minutes. (Since 2.8.1)
  final int? seedingTimeLimit;

  /// Whether Automatic Torrent Management should be used
  final bool? autoTMM;

  /// Enable sequential download. Possible values are true, false (default)
  final bool? sequentialDownload;

  /// Prioritize download first last piece. Possible values are true, false (default)
  final bool? firstLastPiecePrio;

  Map<String, dynamic> toFormData() {
    return {
      if (urls != null) 'urls': const ListItemConverter.newline().toJson(urls!),
      if (files != null) 'torrents': files,
      if (bytes != null) 'torrents': bytes,
      if (savePath != null) 'savepath': savePath,
      if (cookie != null) 'cookie': cookie,
      if (category != null) 'category': category,
      if (tags != null) 'tags': const ListItemConverter.comma().toJson(tags!),
      if (skipChecking != null) 'skip_checking': skipChecking,
      if (paused != null) 'paused': paused,
      if (rootFolder != null) 'root_folder': rootFolder,
      if (rename != null) 'rename': rename,
      if (upLimit != null) 'upLimit': upLimit,
      if (dlLimit != null) 'dlLimit': dlLimit,
      if (ratioLimit != null) 'ratioLimit': ratioLimit,
      if (seedingTimeLimit != null) 'seedingTimeLimit': seedingTimeLimit,
      if (autoTMM != null) 'autoTMM': autoTMM,
      if (sequentialDownload != null) 'sequentialDownload': sequentialDownload,
      if (firstLastPiecePrio != null) 'firstLastPiecePrio': firstLastPiecePrio,
    };
  }
}
