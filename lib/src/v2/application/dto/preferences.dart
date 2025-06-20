import 'package:json_annotation/json_annotation.dart';
import 'package:qbittorrent_api/src/v2/application/dto/bittorrent_protocol.dart';
import 'package:qbittorrent_api/src/v2/application/dto/dyndns_service.dart';
import 'package:qbittorrent_api/src/v2/application/dto/encryption.dart';
import 'package:qbittorrent_api/src/v2/application/dto/max_ratio_act.dart';
import 'package:qbittorrent_api/src/v2/application/dto/proxy_type.dart';
import 'package:qbittorrent_api/src/v2/application/dto/scan_dir_type.dart';
import 'package:qbittorrent_api/src/v2/application/dto/scheduler_days.dart';
import 'package:qbittorrent_api/src/v2/application/dto/upload_choking_algorithm.dart';
import 'package:qbittorrent_api/src/v2/application/dto/upload_slots_behavior.dart';
import 'package:qbittorrent_api/src/v2/application/dto/utp_tcp_mixed_mode.dart';
import 'package:qbittorrent_api/src/v2/utils/list_item_converter.dart';

part 'preferences.g.dart';

/// {@template preferences}
/// Preferences.
/// {@endtemplate}
@JsonSerializable()
class Preferences {
  /// {@macro preferences}
  const Preferences({
    this.locale,
    this.createSubfolderEnabled,
    this.startPausedEnabled,
    this.autoDeleteMode,
    this.preallocateAll,
    this.incompleteFilesExt,
    this.autoTmmEnabled,
    this.torrentChangedTmmEnabled,
    this.savePathChangedTmmEnabled,
    this.categoryChangedTmmEnabled,
    this.savePath,
    this.tempPathEnabled,
    this.tempPath,
    this.scanDirs,
    this.exportDir,
    this.exportDirFin,
    this.mailNotificationEnabled,
    this.mailNotificationSender,
    this.mailNotificationEmail,
    this.mailNotificationSmtp,
    this.mailNotificationSslEnabled,
    this.mailNotificationAuthEnabled,
    this.mailNotificationUsername,
    this.mailNotificationPassword,
    this.autorunEnabled,
    this.autorunProgram,
    this.queueingEnabled,
    this.maxActiveDownloads,
    this.maxActiveTorrents,
    this.maxActiveUploads,
    this.dontCountSlowTorrents,
    this.slowTorrentDlRateThreshold,
    this.slowTorrentUlRateThreshold,
    this.slowTorrentInactiveTimer,
    this.maxRatioEnabled,
    this.maxRatio,
    this.maxRatioAct,
    this.listenPort,
    this.upnp,
    this.randomPort,
    this.dlLimit,
    this.upLimit,
    this.maxConnec,
    this.maxConnecPerTorrent,
    this.maxUploads,
    this.maxUploadsPerTorrent,
    this.stopTrackerTimeout,
    this.enablePieceExtentAffinity,
    this.bittorrentProtocol,
    this.limitUtpRate,
    this.limitTcpOverhead,
    this.limitLanPeers,
    this.altDlLimit,
    this.altUpLimit,
    this.schedulerEnabled,
    this.scheduleFromHour,
    this.scheduleFromMin,
    this.scheduleToHour,
    this.scheduleToMin,
    this.schedulerDays,
    this.dht,
    this.pex,
    this.lsd,
    this.encryption,
    this.anonymousMode,
    this.proxyType,
    this.proxyIp,
    this.proxyPort,
    this.proxyPeerConnections,
    this.proxyAuthEnabled,
    this.proxyUsername,
    this.proxyPassword,
    this.proxyTorrentsOnly,
    this.ipFilterEnabled,
    this.ipFilterPath,
    this.ipFilterTrackers,
    this.webUiDomainList,
    this.webUiAddress,
    this.webUiPort,
    this.webUiUpnp,
    this.webUiUsername,
    this.webUiPassword,
    this.webUiCsrfProtectionEnabled,
    this.webUiClickjackingProtectionEnabled,
    this.webUiSecureCookieEnabled,
    this.webUiMaxAuthFailCount,
    this.webUiBanDuration,
    this.webUiSessionTimeout,
    this.webUiHostHeaderValidationEnabled,
    this.bypassLocalAuth,
    this.bypassAuthSubnetWhitelistEnabled,
    this.bypassAuthSubnetWhitelist,
    this.alternativeWebUiEnabled,
    this.alternativeWebUiPath,
    this.useHttps,
    this.sslKey,
    this.sslCert,
    this.webUiHttpsKeyPath,
    this.webUiHttpsCertPath,
    this.dyndnsEnabled,
    this.dyndnsService,
    this.dyndnsUsername,
    this.dyndnsPassword,
    this.dyndnsDomain,
    this.rssRefreshInterval,
    this.rssMaxArticlesPerFeed,
    this.rssProcessingEnabled,
    this.rssAutoDownloadingEnabled,
    this.rssDownloadRepackProperEpisodes,
    this.rssSmartEpisodeFilters,
    this.addTrackersEnabled,
    this.addTrackers,
    this.webUiUseCustomHttpHeadersEnabled,
    this.webUiCustomHttpHeaders,
    this.maxSeedingTimeEnabled,
    this.maxSeedingTime,
    this.announceIp,
    this.announceToAllTiers,
    this.announceToAllTrackers,
    this.asyncIoThreads,
    this.bannedIPs,
    this.checkingMemoryUse,
    this.currentInterfaceAddress,
    this.currentNetworkInterface,
    this.diskCache,
    this.diskCacheTtl,
    this.embeddedTrackerPort,
    this.enableCoalesceReadWrite,
    this.enableEmbeddedTracker,
    this.enableMultiConnectionsFromSameIp,
    this.enableOsCache,
    this.enableUploadSuggestions,
    this.filePoolSize,
    this.outgoingPortsMax,
    this.outgoingPortsMin,
    this.recheckCompletedTorrents,
    this.resolvePeerCountries,
    this.saveResumeDataInterval,
    this.sendBufferLowWatermark,
    this.sendBufferWatermark,
    this.sendBufferWatermarkFactor,
    this.socketBacklogSize,
    this.uploadChokingAlgorithm,
    this.uploadSlotsBehavior,
    this.upnpLeaseDuration,
    this.utpTcpMixedMode,
  });

  /// Creates a new instance from a JSON map.
  factory Preferences.fromJson(Map<String, dynamic> json) =>
      _$PreferencesFromJson(json);

  /// Currently selected language (e.g. en_GB for English).
  @JsonKey(name: 'locale')
  final String? locale;

  /// True if a subfolder should be created when adding a torrent.
  @JsonKey(name: 'create_subfolder_enabled')
  final bool? createSubfolderEnabled;

  /// True if torrents should be added in a Paused state.
  @JsonKey(name: 'start_paused_enabled')
  final bool? startPausedEnabled;

  @JsonKey(name: 'auto_delete_mode')
  final int? autoDeleteMode;

  /// True if torrent should be deleted when its download is finished.
  @JsonKey(name: 'preallocate_all')
  final bool? preallocateAll;

  /// True if ".!qB" should be appended to incomplete files.
  @JsonKey(name: 'incomplete_files_ext')
  final bool? incompleteFilesExt;

  /// True if Automatic Torrent Management is enabled by default.
  @JsonKey(name: 'auto_tmm_enabled')
  final bool? autoTmmEnabled;

  /// True if torrent should be relocated when its Category changes.
  @JsonKey(name: 'torrent_changed_tmm_enabled')
  final bool? torrentChangedTmmEnabled;

  /// True if torrent should be relocated when the default save path changes.
  @JsonKey(name: 'save_path_changed_tmm_enabled')
  final bool? savePathChangedTmmEnabled;

  /// True if torrent should be relocated when its Category's save path changes.
  @JsonKey(name: 'category_changed_tmm_enabled')
  final bool? categoryChangedTmmEnabled;

  /// Default save path for torrents, separated by slashes.
  @JsonKey(name: 'save_path')
  final String? savePath;

  /// True if folder for incomplete torrents is enabled.
  @JsonKey(name: 'temp_path_enabled')
  final bool? tempPathEnabled;

  /// Path for incomplete torrents, separated by slashes.
  @JsonKey(name: 'temp_path')
  final String? tempPath;

  /// Property: directory to watch for torrent files,
  /// value: where torrents loaded from this directory should be downloaded to.
  @JsonKey(name: 'scan_dirs')
  @ScanDirsConverter()
  final Map<String, ScanDirType>? scanDirs;

  /// Path to directory to copy .torrent files to. Slashes are used as path separators.
  @JsonKey(name: 'export_dir')
  final String? exportDir;

  /// Path to directory to copy .torrent files of completed downloads to. Slashes are used as path separators.
  @JsonKey(name: 'export_dir_fin')
  final String? exportDirFin;

  /// True if e-mail notification should be enabled.
  @JsonKey(name: 'mail_notification_enabled')
  final bool? mailNotificationEnabled;

  /// e-mail where notifications should originate from.
  @JsonKey(name: 'mail_notification_sender')
  final String? mailNotificationSender;

  /// e-mail to send notifications to.
  @JsonKey(name: 'mail_notification_email')
  final String? mailNotificationEmail;

  /// smtp server for e-mail notifications.
  @JsonKey(name: 'mail_notification_smtp')
  final String? mailNotificationSmtp;

  /// True if smtp server requires SSL connection.
  @JsonKey(name: 'mail_notification_ssl_enabled')
  final bool? mailNotificationSslEnabled;

  /// True if smtp server requires authentication.
  @JsonKey(name: 'mail_notification_auth_enabled')
  final bool? mailNotificationAuthEnabled;

  /// Username for smtp authentication.
  @JsonKey(name: 'mail_notification_username')
  final String? mailNotificationUsername;

  /// Password for smtp authentication.
  @JsonKey(name: 'mail_notification_password')
  final String? mailNotificationPassword;

  /// True if external program should be run after torrent has finished downloading.
  @JsonKey(name: 'autorun_enabled')
  final bool? autorunEnabled;

  /// Program path/name/arguments to run if autorun_enabled is enabled;
  /// path is separated by slashes; you can use %f and %n arguments,
  /// which will be expanded by qBittorent as path_to_torrent_file and
  /// torrent_name (from the GUI; not the .torrent file name) respectively.
  @JsonKey(name: 'autorun_program')
  final String? autorunProgram;

  /// True if torrent queuing is enabled.
  @JsonKey(name: 'queueing_enabled')
  final bool? queueingEnabled;

  /// Maximum number of active simultaneous downloads.
  @JsonKey(name: 'max_active_downloads')
  final int? maxActiveDownloads;

  /// Maximum number of active simultaneous downloads and uploads.
  @JsonKey(name: 'max_active_torrents')
  final int? maxActiveTorrents;

  /// Maximum number of active simultaneous uploads.
  @JsonKey(name: 'max_active_uploads')
  final int? maxActiveUploads;

  /// If true torrents w/o any activity (stalled ones) will not be counted towards max_active_* limits;
  /// see dont_count_slow_torrents for more information.
  @JsonKey(name: 'dont_count_slow_torrents')
  final bool? dontCountSlowTorrents;

  /// Download rate in KiB/s for a torrent to be considered "slow".
  @JsonKey(name: 'slow_torrent_dl_rate_threshold')
  final int? slowTorrentDlRateThreshold;

  /// Upload rate in KiB/s for a torrent to be considered "slow".
  @JsonKey(name: 'slow_torrent_ul_rate_threshold')
  final int? slowTorrentUlRateThreshold;

  /// Seconds a torrent should be inactive before considered "slow".
  @JsonKey(name: 'slow_torrent_inactive_timer')
  final int? slowTorrentInactiveTimer;

  /// True if share ratio limit is enabled.
  @JsonKey(name: 'max_ratio_enabled')
  final bool? maxRatioEnabled;

  /// Get the global share ratio limit.
  @JsonKey(name: 'max_ratio')
  final double? maxRatio;

  /// Action performed when a torrent reaches the maximum share ratio.
  /// See list of possible values here below.
  @JsonKey(name: 'max_ratio_act')
  final MaxRatioAct? maxRatioAct;

  /// Port for incoming connections.
  @JsonKey(name: 'listen_port')
  final int? listenPort;

  /// True if UPnP/NAT-PMP is enabled.
  @JsonKey(name: 'upnp')
  final bool? upnp;

  /// True if the port is randomly selected.
  @JsonKey(name: 'random_port')
  final bool? randomPort;

  /// Global download speed limit in KiB/s; -1 means no limit is applied.
  @JsonKey(name: 'dl_limit')
  final int? dlLimit;

  /// Global upload speed limit in KiB/s; -1 means no limit is applied.
  @JsonKey(name: 'up_limit')
  final int? upLimit;

  /// Maximum global number of simultaneous connections.
  @JsonKey(name: 'max_connec')
  final int? maxConnec;

  /// Maximum number of simultaneous connections per torrent.
  @JsonKey(name: 'max_connec_per_torrent')
  final int? maxConnecPerTorrent;

  /// Maximum number of upload slots.
  @JsonKey(name: 'max_uploads')
  final int? maxUploads;

  /// Maximum number of upload slots per torrent.
  @JsonKey(name: 'max_uploads_per_torrent')
  final int? maxUploadsPerTorrent;

  /// Timeout in seconds for a stopped announce request to trackers.
  @JsonKey(name: 'stop_tracker_timeout')
  final int? stopTrackerTimeout;

  /// True if the advanced libtorrent option piece_extent_affinity is enabled.
  @JsonKey(name: 'enable_piece_extent_affinity')
  final bool? enablePieceExtentAffinity;

  /// Bittorrent Protocol to use (see list of possible values below).
  @JsonKey(name: 'bittorrent_protocol')
  final BittorrentProtocol? bittorrentProtocol;

  /// True if \[du\]l_limit should be applied to uTP connections;
  /// this option is only available in qBittorent built against libtorrent version 0.16.X and higher.
  @JsonKey(name: 'limit_utp_rate')
  final bool? limitUtpRate;

  /// True if \[du\]l_limit should be applied to estimated TCP overhead (service data: e.g. packet headers).
  @JsonKey(name: 'limit_tcp_overhead')
  final bool? limitTcpOverhead;

  /// True if \[du\]l_limit should be applied to peers on the LAN.
  @JsonKey(name: 'limit_lan_peers')
  final bool? limitLanPeers;

  /// Alternative global download speed limit in KiB/s.
  @JsonKey(name: 'alt_dl_limit')
  final int? altDlLimit;

  /// Alternative global upload speed limit in KiB/s.
  @JsonKey(name: 'alt_up_limit')
  final int? altUpLimit;

  /// True if alternative limits should be applied according to schedule.
  @JsonKey(name: 'scheduler_enabled')
  final bool? schedulerEnabled;

  /// Scheduler starting hour.
  @JsonKey(name: 'schedule_from_hour')
  final int? scheduleFromHour;

  /// Scheduler starting minute.
  @JsonKey(name: 'schedule_from_min')
  final int? scheduleFromMin;

  /// Scheduler ending hour.
  @JsonKey(name: 'schedule_to_hour')
  final int? scheduleToHour;

  /// Scheduler ending minute.
  @JsonKey(name: 'schedule_to_min')
  final int? scheduleToMin;

  /// Scheduler days. See possible values here below.
  @JsonKey(name: 'scheduler_days')
  final SchedulerDays? schedulerDays;

  /// True if DHT is enabled.
  @JsonKey(name: 'dht')
  final bool? dht;

  /// True if PeX is enabled.
  @JsonKey(name: 'pex')
  final bool? pex;

  /// True if LSD is enabled.
  @JsonKey(name: 'lsd')
  final bool? lsd;

  /// See list of possible values here below.
  @JsonKey(name: 'encryption')
  final Encryption? encryption;

  /// If true anonymous mode will be enabled; read more here;
  /// this option is only available in qBittorent built against libtorrent version 0.16.X and higher.
  @JsonKey(name: 'anonymous_mode')
  final bool? anonymousMode;

  /// See list of possible values here below.
  @JsonKey(fromJson: proxyTypeFromJson, toJson: proxyTypeToJson)
  final ProxyType? proxyType;

  /// Proxy IP address or domain name.
  @JsonKey(name: 'proxy_ip')
  final String? proxyIp;

  /// Proxy port.
  @JsonKey(name: 'proxy_port')
  final int? proxyPort;

  /// True if peer and web seed connections should be proxified;
  /// this option will have any effect only in qBittorent built against libtorrent version 0.16.X and higher.
  @JsonKey(name: 'proxy_peer_connections')
  final bool? proxyPeerConnections;

  /// True proxy requires authentication; doesn't apply to SOCKS4 proxies.
  @JsonKey(name: 'proxy_auth_enabled')
  final bool? proxyAuthEnabled;

  /// Username for proxy authentication.
  @JsonKey(name: 'proxy_username')
  final String? proxyUsername;

  /// Password for proxy authentication.
  @JsonKey(name: 'proxy_password')
  final String? proxyPassword;

  /// True if proxy is only used for torrents.
  @JsonKey(name: 'proxy_torrents_only')
  final bool? proxyTorrentsOnly;

  /// True if external IP filter should be enabled.
  @JsonKey(name: 'ip_filter_enabled')
  final bool? ipFilterEnabled;

  /// Path to IP filter file (.dat, .p2p, .p2b files are supported);
  /// path is separated by slashes.
  @JsonKey(name: 'ip_filter_path')
  final String? ipFilterPath;

  /// True if IP filters are applied to trackers.
  @JsonKey(name: 'ip_filter_trackers')
  final bool? ipFilterTrackers;

  /// Comma-separated list of domains to accept when performing Host header validation.
  @JsonKey(name: 'web_ui_domain_list')
  final String? webUiDomainList;

  /// IP address to use for the WebUI.
  @JsonKey(name: 'web_ui_address')
  final String? webUiAddress;

  /// WebUI port.
  @JsonKey(name: 'web_ui_port')
  final int? webUiPort;

  /// True if UPnP is used for the WebUI port.
  @JsonKey(name: 'web_ui_upnp')
  final bool? webUiUpnp;

  /// WebUI username.
  @JsonKey(name: 'web_ui_username')
  final String? webUiUsername;

  /// For API ≥ v2.3.0: Plaintext WebUI password, not readable, write-only.
  /// For API < v2.3.0: MD5 hash of WebUI password, hash is generated from the following string:
  /// username:Web UI Access:plain_text_web_ui_password.
  @JsonKey(name: 'web_ui_password')
  final String? webUiPassword;

  /// True if WebUI CSRF protection is enabled.
  @JsonKey(name: 'web_ui_csrf_protection_enabled')
  final bool? webUiCsrfProtectionEnabled;

  /// True if WebUI clickjacking protection is enabled.
  @JsonKey(name: 'web_ui_clickjacking_protection_enabled')
  final bool? webUiClickjackingProtectionEnabled;

  /// True if WebUI cookie Secure flag is enabled.
  @JsonKey(name: 'web_ui_secure_cookie_enabled')
  final bool? webUiSecureCookieEnabled;

  /// Maximum number of authentication failures before WebUI access ban.
  @JsonKey(name: 'web_ui_max_auth_fail_count')
  final int? webUiMaxAuthFailCount;

  /// WebUI access ban duration in seconds.
  @JsonKey(name: 'web_ui_ban_duration')
  final int? webUiBanDuration;

  /// Seconds until WebUI is automatically signed off.
  @JsonKey(name: 'web_ui_session_timeout')
  final int? webUiSessionTimeout;

  /// True if WebUI host header validation is enabled.
  @JsonKey(name: 'web_ui_host_header_validation_enabled')
  final bool? webUiHostHeaderValidationEnabled;

  /// True if authentication challenge for loopback address (127.0.0.1) should be disabled.
  @JsonKey(name: 'bypass_local_auth')
  final bool? bypassLocalAuth;

  /// True if webui authentication should be bypassed for clients whose ip
  /// resides within (at least) one of the subnets on the whitelist.
  @JsonKey(name: 'bypass_auth_subnet_whitelist_enabled')
  final bool? bypassAuthSubnetWhitelistEnabled;

  /// (White)list of ipv4/ipv6 subnets for which webui authentication should be bypassed; list entries are separated by commas.
  @JsonKey(name: 'bypass_auth_subnet_whitelist')
  final String? bypassAuthSubnetWhitelist;

  /// True if an alternative WebUI should be used.
  @JsonKey(name: 'alternative_webui_enabled')
  final bool? alternativeWebUiEnabled;

  /// File path to the alternative WebUI.
  @JsonKey(name: 'alternative_webui_path')
  final String? alternativeWebUiPath;

  /// True if WebUI HTTPS access is enabled.
  @JsonKey(name: 'use_https')
  final bool? useHttps;

  /// For API < v2.0.1: SSL keyfile contents (this is a not a path).
  @JsonKey(name: 'ssl_key')
  final String? sslKey;

  /// For API < v2.0.1: SSL certificate contents (this is a not a path).
  @JsonKey(name: 'ssl_cert')
  final String? sslCert;

  /// For API ≥ v2.0.1: Path to SSL keyfile.
  @JsonKey(name: 'web_ui_https_key_path')
  final String? webUiHttpsKeyPath;

  /// For API ≥ v2.0.1: Path to SSL certificate.
  @JsonKey(name: 'web_ui_https_cert_path')
  final String? webUiHttpsCertPath;

  /// True if server DNS should be updated dynamically.
  @JsonKey(name: 'dyndns_enabled')
  final bool? dyndnsEnabled;

  /// See list of possible values here below.
  @JsonKey(name: 'dyndns_service')
  final DyndnsService? dyndnsService;

  /// Username for DDNS service.
  @JsonKey(name: 'dyndns_username')
  final String? dyndnsUsername;

  /// Password for DDNS service.
  @JsonKey(name: 'dyndns_password')
  final String? dyndnsPassword;

  /// Your DDNS domain name.
  @JsonKey(name: 'dyndns_domain')
  final String? dyndnsDomain;

  /// RSS refresh interval.
  @JsonKey(name: 'rss_refresh_interval')
  final int? rssRefreshInterval;

  /// Max stored articles per RSS feed.
  @JsonKey(name: 'rss_max_articles_per_feed')
  final int? rssMaxArticlesPerFeed;

  /// Enable processing of RSS feeds.
  @JsonKey(name: 'rss_processing_enabled')
  final bool? rssProcessingEnabled;

  /// Enable auto-downloading of torrents from the RSS feeds.
  @JsonKey(name: 'rss_auto_downloading_enabled')
  final bool? rssAutoDownloadingEnabled;

  /// For API ≥ v2.5.1: Enable downloading of repack/proper Episodes.
  @JsonKey(name: 'rss_download_repack_proper_episodes')
  final bool? rssDownloadRepackProperEpisodes;

  /// For API ≥ v2.5.1: List of RSS Smart Episode Filters.
  @JsonKey(name: 'rss_smart_episode_filters')
  final String? rssSmartEpisodeFilters;

  /// Enable automatic adding of trackers to new torrents.
  @JsonKey(name: 'add_trackers_enabled')
  final bool? addTrackersEnabled;

  /// List of trackers to add to new torrent.
  @JsonKey(name: 'add_trackers')
  final String? addTrackers;

  /// For API ≥ v2.5.1: Enable custom http headers.
  @JsonKey(name: 'web_ui_use_custom_http_headers_enabled')
  final bool? webUiUseCustomHttpHeadersEnabled;

  /// For API ≥ v2.5.1: List of custom http headers.
  @JsonKey(name: 'web_ui_custom_http_headers')
  final String? webUiCustomHttpHeaders;

  /// True enables max seeding time.
  @JsonKey(name: 'max_seeding_time_enabled')
  final bool? maxSeedingTimeEnabled;

  /// Number of minutes to seed a torrent.
  @JsonKey(name: 'max_seeding_time')
  final int? maxSeedingTime;

  @JsonKey(name: 'announce_ip')
  final String? announceIp;

  /// True always announce to all tiers.
  @JsonKey(name: 'announce_to_all_tiers')
  final bool? announceToAllTiers;

  /// True always announce to all trackers in a tier.
  @JsonKey(name: 'announce_to_all_trackers')
  final bool? announceToAllTrackers;

  /// Number of asynchronous I/O threads.
  @JsonKey(name: 'async_io_threads')
  final int? asyncIoThreads;

  /// List of banned IPs.
  @JsonKey(name: 'banned_IPs')
  @ListItemConverter.newline()
  final List<String>? bannedIPs;

  /// Outstanding memory when checking torrents in MiB.
  @JsonKey(name: 'checking_memory_use')
  final int? checkingMemoryUse;

  /// IP Address to bind to. Empty String means All addresses.
  @JsonKey(name: 'current_interface_address')
  final String? currentInterfaceAddress;

  /// Network Interface used.
  @JsonKey(name: 'current_network_interface')
  final String? currentNetworkInterface;

  /// Disk cache used in MiB.
  @JsonKey(name: 'disk_cache')
  final int? diskCache;

  /// Disk cache expiry interval in seconds.
  @JsonKey(name: 'disk_cache_ttl')
  final int? diskCacheTtl;

  /// Port used for embedded tracker.
  @JsonKey(name: 'embedded_tracker_port')
  final int? embeddedTrackerPort;

  /// True enables coalesce reads & writes.
  @JsonKey(name: 'enable_coalesce_read_write')
  final bool? enableCoalesceReadWrite;

  /// True enables embedded tracker.
  @JsonKey(name: 'enable_embedded_tracker')
  final bool? enableEmbeddedTracker;

  /// True allows multiple connections from the same IP address.
  @JsonKey(name: 'enable_multi_connections_from_same_ip')
  final bool? enableMultiConnectionsFromSameIp;

  /// True enables os cache.
  @JsonKey(name: 'enable_os_cache')
  final bool? enableOsCache;

  /// True enables sending of upload piece suggestions.
  @JsonKey(name: 'enable_upload_suggestions')
  final bool? enableUploadSuggestions;

  /// File pool size.
  @JsonKey(name: 'file_pool_size')
  final int? filePoolSize;

  /// Maximal outgoing port (0: Disabled).
  @JsonKey(name: 'outgoing_ports_max')
  final int? outgoingPortsMax;

  /// Minimal outgoing port (0: Disabled).
  @JsonKey(name: 'outgoing_ports_min')
  final int? outgoingPortsMin;

  /// True rechecks torrents on completion.
  @JsonKey(name: 'recheck_completed_torrents')
  final bool? recheckCompletedTorrents;

  /// True resolves peer countries.
  @JsonKey(name: 'resolve_peer_countries')
  final bool? resolvePeerCountries;

  /// Save resume data interval in min.
  @JsonKey(name: 'save_resume_data_interval')
  final int? saveResumeDataInterval;

  /// Send buffer low watermark in KiB.
  @JsonKey(name: 'send_buffer_low_watermark')
  final int? sendBufferLowWatermark;

  /// Send buffer watermark in KiB.
  @JsonKey(name: 'send_buffer_watermark')
  final int? sendBufferWatermark;

  /// Send buffer watermark factor in percent.
  @JsonKey(name: 'send_buffer_watermark_factor')
  final int? sendBufferWatermarkFactor;

  /// Socket backlog size.
  @JsonKey(name: 'socket_backlog_size')
  final int? socketBacklogSize;

  /// Upload choking algorithm used (see list of possible values below).
  @JsonKey(name: 'upload_choking_algorithm')
  final UploadChokingAlgorithm? uploadChokingAlgorithm;

  /// Upload slots behavior used (see list of possible values below).
  @JsonKey(name: 'upload_slots_behavior')
  final UploadSlotsBehavior? uploadSlotsBehavior;

  /// UPnP lease duration (0: Permanent lease).
  @JsonKey(name: 'upnp_lease_duration')
  final int? upnpLeaseDuration;

  /// μTP-TCP mixed mode algorithm (see list of possible values below).
  @JsonKey(name: 'utp_tcp_mixed_mode')
  final UtpTcpMixedMode? utpTcpMixedMode;

  /// Convert the instance to JSON.
  Map<String, dynamic> toJson() => _$PreferencesToJson(this);
}

/// {@template scan_dirs_converter}
/// Convert for scan directories.
/// {@endtemplate}
class ScanDirsConverter
    implements JsonConverter<Map<String, ScanDirType>, Map<String, dynamic>> {
  /// {@macro scan_dirs_converter}
  const ScanDirsConverter();

  @override
  Map<String, ScanDirType> fromJson(Map<String, dynamic> json) {
    return json.map((key, value) {
      return MapEntry(key, ScanDirType.fromValue(value));
    });
  }

  @override
  Map<String, dynamic> toJson(Map<String, ScanDirType> object) {
    return object.map((key, value) {
      return MapEntry(key, value.value);
    });
  }
}
