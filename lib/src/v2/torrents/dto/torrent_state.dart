import 'package:json_annotation/json_annotation.dart';

/// {@template torrent_state}
/// Torrent state.
/// {@endtemplate}
enum TorrentState {
  /// Some error occurred, applies to paused torrents
  @JsonValue('error')
  error,

  /// Torrent data files is missing
  @JsonValue('missingFiles')
  missingFiles,

  /// Torrent is being seeded and data is being transferred
  @JsonValue('uploading')
  uploading,

  /// Torrent is paused and has finished downloading
  /// [pausedUP] was renamed to stoppedUP in Web API v2.11.0
  @JsonValue('pausedUP')
  pausedUP,

  /// Queuing is enabled and torrent is queued for upload
  @JsonValue('queuedUP')
  queuedUP,

  /// Torrent is being seeded, but no connection were made
  @JsonValue('stalledUP')
  stalledUP,

  /// Torrent has finished downloading and is being checked
  @JsonValue('checkingUP')
  checkingUP,

  /// Torrent is forced to uploading and ignore queue limit
  @JsonValue('forcedUP')
  forcedUP,

  /// Torrent is allocating disk space for download
  @JsonValue('allocating')
  allocating,

  /// Torrent is being downloaded and data is being transferred
  @JsonValue('downloading')
  downloading,

  /// Torrent has just started downloading and is fetching metadata
  @JsonValue('metaDL')
  metaDL,

  /// Torrent is forced fetching metadata.
  @JsonValue('forcedMetaDL')
  forcedMetaDL,

  /// Torrent is paused and has NOT finished downloading
  /// [pausedDL] was renamed to stoppedDL in Web API v2.11.0
  @JsonValue('pausedDL')
  pausedDL,

  /// Queuing is enabled and torrent is queued for download
  @JsonValue('queuedDL')
  queuedDL,

  /// Torrent is being downloaded, but no connection were made
  @JsonValue('stalledDL')
  stalledDL,

  /// Same as checkingUP, but torrent has NOT finished downloading
  @JsonValue('checkingDL')
  checkingDL,

  /// Torrent is forced to downloading to ignore queue limit
  @JsonValue('forcedDL')
  forcedDL,

  /// Torrent is paused and has finished downloading
  @JsonValue('stoppedUP')
  stoppedUP,

  /// Torrent is paused and has NOT finished downloading
  @JsonValue('stoppedDL')
  stoppedDL,

  /// Checking resume data on qBt startup
  @JsonValue('checkingResumeData')
  checkingResumeData,

  /// Torrent is moving to another location
  @JsonValue('moving')
  moving,

  /// Unknown status
  @JsonValue('unknown')
  unknown,
}
