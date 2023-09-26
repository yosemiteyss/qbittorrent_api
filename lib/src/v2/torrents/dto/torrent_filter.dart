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

  const TorrentFilter(this.value);

  final String value;
}
