/// {@template torrent_filter}
/// Torrent filter.
/// {@endtemplate}
enum TorrentFilter {
  all('all'),
  downloading('downloading'),
  seeding('seeding'),
  completed('completed'),
  paused('paused'),
  active('active'),
  inactive('inactive'),
  resumed('resumed'),
  stalled('stalled'),
  stalledUploading('stalled_uploading'),
  stalledDownloading('stalled_downloading'),
  checking('checking'),
  moving('moving'),
  errored('errored');

  /// {@macro torrent_filter}
  const TorrentFilter(this.value);

  /// The value of the torrent filter.
  final String value;
}
