// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Preferences _$PreferencesFromJson(Map<String, dynamic> json) => Preferences(
      locale: json['locale'] as String?,
      createSubfolderEnabled: json['create_subfolder_enabled'] as bool?,
      startPausedEnabled: json['start_paused_enabled'] as bool?,
      autoDeleteMode: json['auto_delete_mode'] as int?,
      preallocateAll: json['preallocate_all'] as bool?,
      incompleteFilesExt: json['incomplete_files_ext'] as bool?,
      autoTmmEnabled: json['auto_tmm_enabled'] as bool?,
      torrentChangedTmmEnabled: json['torrent_changed_tmm_enabled'] as bool?,
      savePathChangedTmmEnabled: json['save_path_changed_tmm_enabled'] as bool?,
      categoryChangedTmmEnabled: json['category_changed_tmm_enabled'] as bool?,
      savePath: json['save_path'] as String?,
      tempPathEnabled: json['temp_path_enabled'] as bool?,
      tempPath: json['temp_path'] as String?,
      scanDirs: _$JsonConverterFromJson<Map<String, dynamic>,
              Map<String, ScanDirType>>(
          json['scan_dirs'], const ScanDirsConverter().fromJson),
      exportDir: json['export_dir'] as String?,
      exportDirFin: json['export_dir_fin'] as String?,
      mailNotificationEnabled: json['mail_notification_enabled'] as bool?,
      mailNotificationSender: json['mail_notification_sender'] as String?,
      mailNotificationEmail: json['mail_notification_email'] as String?,
      mailNotificationSmtp: json['mail_notification_smtp'] as String?,
      mailNotificationSslEnabled:
          json['mail_notification_ssl_enabled'] as bool?,
      mailNotificationAuthEnabled:
          json['mail_notification_auth_enabled'] as bool?,
      mailNotificationUsername: json['mail_notification_username'] as String?,
      mailNotificationPassword: json['mail_notification_password'] as String?,
      autorunEnabled: json['autorun_enabled'] as bool?,
      autorunProgram: json['autorun_program'] as String?,
      queueingEnabled: json['queueing_enabled'] as bool?,
      maxActiveDownloads: json['max_active_downloads'] as int?,
      maxActiveTorrents: json['max_active_torrents'] as int?,
      maxActiveUploads: json['max_active_uploads'] as int?,
      dontCountSlowTorrents: json['dont_count_slow_torrents'] as bool?,
      slowTorrentDlRateThreshold:
          json['slow_torrent_dl_rate_threshold'] as int?,
      slowTorrentUlRateThreshold:
          json['slow_torrent_ul_rate_threshold'] as int?,
      slowTorrentInactiveTimer: json['slow_torrent_inactive_timer'] as int?,
      maxRatioEnabled: json['max_ratio_enabled'] as bool?,
      maxRatio: (json['max_ratio'] as num?)?.toDouble(),
      maxRatioAct:
          $enumDecodeNullable(_$MaxRatioActEnumMap, json['max_ratio_act']),
      listenPort: json['listen_port'] as int?,
      upnp: json['upnp'] as bool?,
      randomPort: json['random_port'] as bool?,
      dlLimit: json['dl_limit'] as int?,
      upLimit: json['up_limit'] as int?,
      maxConnec: json['max_connec'] as int?,
      maxConnecPerTorrent: json['max_connec_per_torrent'] as int?,
      maxUploads: json['max_uploads'] as int?,
      maxUploadsPerTorrent: json['max_uploads_per_torrent'] as int?,
      stopTrackerTimeout: json['stop_tracker_timeout'] as int?,
      enablePieceExtentAffinity: json['enable_piece_extent_affinity'] as bool?,
      bittorrentProtocol: $enumDecodeNullable(
          _$BittorrentProtocolEnumMap, json['bittorrent_protocol']),
      limitUtpRate: json['limit_utp_rate'] as bool?,
      limitTcpOverhead: json['limit_tcp_overhead'] as bool?,
      limitLanPeers: json['limit_lan_peers'] as bool?,
      altDlLimit: json['alt_dl_limit'] as int?,
      altUpLimit: json['alt_up_limit'] as int?,
      schedulerEnabled: json['scheduler_enabled'] as bool?,
      scheduleFromHour: json['schedule_from_hour'] as int?,
      scheduleFromMin: json['schedule_from_min'] as int?,
      scheduleToHour: json['schedule_to_hour'] as int?,
      scheduleToMin: json['schedule_to_min'] as int?,
      schedulerDays:
          $enumDecodeNullable(_$SchedulerDaysEnumMap, json['scheduler_days']),
      dht: json['dht'] as bool?,
      pex: json['pex'] as bool?,
      lsd: json['lsd'] as bool?,
      encryption: $enumDecodeNullable(_$EncryptionEnumMap, json['encryption']),
      anonymousMode: json['anonymous_mode'] as bool?,
      proxyType: $enumDecodeNullable(_$ProxyTypeEnumMap, json['proxy_type']),
      proxyIp: json['proxy_ip'] as String?,
      proxyPort: json['proxy_port'] as int?,
      proxyPeerConnections: json['proxy_peer_connections'] as bool?,
      proxyAuthEnabled: json['proxy_auth_enabled'] as bool?,
      proxyUsername: json['proxy_username'] as String?,
      proxyPassword: json['proxy_password'] as String?,
      proxyTorrentsOnly: json['proxy_torrents_only'] as bool?,
      ipFilterEnabled: json['ip_filter_enabled'] as bool?,
      ipFilterPath: json['ip_filter_path'] as String?,
      ipFilterTrackers: json['ip_filter_trackers'] as bool?,
      webUiDomainList: json['web_ui_domain_list'] as String?,
      webUiAddress: json['web_ui_address'] as String?,
      webUiPort: json['web_ui_port'] as int?,
      webUiUpnp: json['web_ui_upnp'] as bool?,
      webUiUsername: json['web_ui_username'] as String?,
      webUiPassword: json['web_ui_password'] as String?,
      webUiCsrfProtectionEnabled:
          json['web_ui_csrf_protection_enabled'] as bool?,
      webUiClickjackingProtectionEnabled:
          json['web_ui_clickjacking_protection_enabled'] as bool?,
      webUiSecureCookieEnabled: json['web_ui_secure_cookie_enabled'] as bool?,
      webUiMaxAuthFailCount: json['web_ui_max_auth_fail_count'] as int?,
      webUiBanDuration: json['web_ui_ban_duration'] as int?,
      webUiSessionTimeout: json['web_ui_session_timeout'] as int?,
      webUiHostHeaderValidationEnabled:
          json['web_ui_host_header_validation_enabled'] as bool?,
      bypassLocalAuth: json['bypass_local_auth'] as bool?,
      bypassAuthSubnetWhitelistEnabled:
          json['bypass_auth_subnet_whitelist_enabled'] as bool?,
      bypassAuthSubnetWhitelist:
          json['bypass_auth_subnet_whitelist'] as String?,
      alternativeWebUiEnabled: json['alternative_webui_enabled'] as bool?,
      alternativeWebUiPath: json['alternative_webui_path'] as String?,
      useHttps: json['use_https'] as bool?,
      sslKey: json['ssl_key'] as String?,
      sslCert: json['ssl_cert'] as String?,
      webUiHttpsKeyPath: json['web_ui_https_key_path'] as String?,
      webUiHttpsCertPath: json['web_ui_https_cert_path'] as String?,
      dyndnsEnabled: json['dyndns_enabled'] as bool?,
      dyndnsService:
          $enumDecodeNullable(_$DyndnsServiceEnumMap, json['dyndns_service']),
      dyndnsUsername: json['dyndns_username'] as String?,
      dyndnsPassword: json['dyndns_password'] as String?,
      dyndnsDomain: json['dyndns_domain'] as String?,
      rssRefreshInterval: json['rss_refresh_interval'] as int?,
      rssMaxArticlesPerFeed: json['rss_max_articles_per_feed'] as int?,
      rssProcessingEnabled: json['rss_processing_enabled'] as bool?,
      rssAutoDownloadingEnabled: json['rss_auto_downloading_enabled'] as bool?,
      rssDownloadRepackProperEpisodes:
          json['rss_download_repack_proper_episodes'] as bool?,
      rssSmartEpisodeFilters: json['rss_smart_episode_filters'] as String?,
      addTrackersEnabled: json['add_trackers_enabled'] as bool?,
      addTrackers: json['add_trackers'] as String?,
      webUiUseCustomHttpHeadersEnabled:
          json['web_ui_use_custom_http_headers_enabled'] as bool?,
      webUiCustomHttpHeaders: json['web_ui_custom_http_headers'] as String?,
      maxSeedingTimeEnabled: json['max_seeding_time_enabled'] as bool?,
      maxSeedingTime: json['max_seeding_time'] as int?,
      announceIp: json['announce_ip'] as String?,
      announceToAllTiers: json['announce_to_all_tiers'] as bool?,
      announceToAllTrackers: json['announce_to_all_trackers'] as bool?,
      asyncIoThreads: json['async_io_threads'] as int?,
      bannedIPs: _$JsonConverterFromJson<String, List<String>>(
          json['banned_IPs'], const ListItemConverter.newline().fromJson),
      checkingMemoryUse: json['checking_memory_use'] as int?,
      currentInterfaceAddress: json['current_interface_address'] as String?,
      currentNetworkInterface: json['current_network_interface'] as String?,
      diskCache: json['disk_cache'] as int?,
      diskCacheTtl: json['disk_cache_ttl'] as int?,
      embeddedTrackerPort: json['embedded_tracker_port'] as int?,
      enableCoalesceReadWrite: json['enable_coalesce_read_write'] as bool?,
      enableEmbeddedTracker: json['enable_embedded_tracker'] as bool?,
      enableMultiConnectionsFromSameIp:
          json['enable_multi_connections_from_same_ip'] as bool?,
      enableOsCache: json['enable_os_cache'] as bool?,
      enableUploadSuggestions: json['enable_upload_suggestions'] as bool?,
      filePoolSize: json['file_pool_size'] as int?,
      outgoingPortsMax: json['outgoing_ports_max'] as int?,
      outgoingPortsMin: json['outgoing_ports_min'] as int?,
      recheckCompletedTorrents: json['recheck_completed_torrents'] as bool?,
      resolvePeerCountries: json['resolve_peer_countries'] as bool?,
      saveResumeDataInterval: json['save_resume_data_interval'] as int?,
      sendBufferLowWatermark: json['send_buffer_low_watermark'] as int?,
      sendBufferWatermark: json['send_buffer_watermark'] as int?,
      sendBufferWatermarkFactor: json['send_buffer_watermark_factor'] as int?,
      socketBacklogSize: json['socket_backlog_size'] as int?,
      uploadChokingAlgorithm: $enumDecodeNullable(
          _$UploadChokingAlgorithmEnumMap, json['upload_choking_algorithm']),
      uploadSlotsBehavior: $enumDecodeNullable(
          _$UploadSlotsBehaviorEnumMap, json['upload_slots_behavior']),
      upnpLeaseDuration: json['upnp_lease_duration'] as int?,
      utpTcpMixedMode: $enumDecodeNullable(
          _$UtpTcpMixedModeEnumMap, json['utp_tcp_mixed_mode']),
    );

Map<String, dynamic> _$PreferencesToJson(Preferences instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('locale', instance.locale);
  writeNotNull('create_subfolder_enabled', instance.createSubfolderEnabled);
  writeNotNull('start_paused_enabled', instance.startPausedEnabled);
  writeNotNull('auto_delete_mode', instance.autoDeleteMode);
  writeNotNull('preallocate_all', instance.preallocateAll);
  writeNotNull('incomplete_files_ext', instance.incompleteFilesExt);
  writeNotNull('auto_tmm_enabled', instance.autoTmmEnabled);
  writeNotNull(
      'torrent_changed_tmm_enabled', instance.torrentChangedTmmEnabled);
  writeNotNull(
      'save_path_changed_tmm_enabled', instance.savePathChangedTmmEnabled);
  writeNotNull(
      'category_changed_tmm_enabled', instance.categoryChangedTmmEnabled);
  writeNotNull('save_path', instance.savePath);
  writeNotNull('temp_path_enabled', instance.tempPathEnabled);
  writeNotNull('temp_path', instance.tempPath);
  writeNotNull(
      'scan_dirs',
      _$JsonConverterToJson<Map<String, dynamic>, Map<String, ScanDirType>>(
          instance.scanDirs, const ScanDirsConverter().toJson));
  writeNotNull('export_dir', instance.exportDir);
  writeNotNull('export_dir_fin', instance.exportDirFin);
  writeNotNull('mail_notification_enabled', instance.mailNotificationEnabled);
  writeNotNull('mail_notification_sender', instance.mailNotificationSender);
  writeNotNull('mail_notification_email', instance.mailNotificationEmail);
  writeNotNull('mail_notification_smtp', instance.mailNotificationSmtp);
  writeNotNull(
      'mail_notification_ssl_enabled', instance.mailNotificationSslEnabled);
  writeNotNull(
      'mail_notification_auth_enabled', instance.mailNotificationAuthEnabled);
  writeNotNull('mail_notification_username', instance.mailNotificationUsername);
  writeNotNull('mail_notification_password', instance.mailNotificationPassword);
  writeNotNull('autorun_enabled', instance.autorunEnabled);
  writeNotNull('autorun_program', instance.autorunProgram);
  writeNotNull('queueing_enabled', instance.queueingEnabled);
  writeNotNull('max_active_downloads', instance.maxActiveDownloads);
  writeNotNull('max_active_torrents', instance.maxActiveTorrents);
  writeNotNull('max_active_uploads', instance.maxActiveUploads);
  writeNotNull('dont_count_slow_torrents', instance.dontCountSlowTorrents);
  writeNotNull(
      'slow_torrent_dl_rate_threshold', instance.slowTorrentDlRateThreshold);
  writeNotNull(
      'slow_torrent_ul_rate_threshold', instance.slowTorrentUlRateThreshold);
  writeNotNull(
      'slow_torrent_inactive_timer', instance.slowTorrentInactiveTimer);
  writeNotNull('max_ratio_enabled', instance.maxRatioEnabled);
  writeNotNull('max_ratio', instance.maxRatio);
  writeNotNull('max_ratio_act', _$MaxRatioActEnumMap[instance.maxRatioAct]);
  writeNotNull('listen_port', instance.listenPort);
  writeNotNull('upnp', instance.upnp);
  writeNotNull('random_port', instance.randomPort);
  writeNotNull('dl_limit', instance.dlLimit);
  writeNotNull('up_limit', instance.upLimit);
  writeNotNull('max_connec', instance.maxConnec);
  writeNotNull('max_connec_per_torrent', instance.maxConnecPerTorrent);
  writeNotNull('max_uploads', instance.maxUploads);
  writeNotNull('max_uploads_per_torrent', instance.maxUploadsPerTorrent);
  writeNotNull('stop_tracker_timeout', instance.stopTrackerTimeout);
  writeNotNull(
      'enable_piece_extent_affinity', instance.enablePieceExtentAffinity);
  writeNotNull('bittorrent_protocol',
      _$BittorrentProtocolEnumMap[instance.bittorrentProtocol]);
  writeNotNull('limit_utp_rate', instance.limitUtpRate);
  writeNotNull('limit_tcp_overhead', instance.limitTcpOverhead);
  writeNotNull('limit_lan_peers', instance.limitLanPeers);
  writeNotNull('alt_dl_limit', instance.altDlLimit);
  writeNotNull('alt_up_limit', instance.altUpLimit);
  writeNotNull('scheduler_enabled', instance.schedulerEnabled);
  writeNotNull('schedule_from_hour', instance.scheduleFromHour);
  writeNotNull('schedule_from_min', instance.scheduleFromMin);
  writeNotNull('schedule_to_hour', instance.scheduleToHour);
  writeNotNull('schedule_to_min', instance.scheduleToMin);
  writeNotNull(
      'scheduler_days', _$SchedulerDaysEnumMap[instance.schedulerDays]);
  writeNotNull('dht', instance.dht);
  writeNotNull('pex', instance.pex);
  writeNotNull('lsd', instance.lsd);
  writeNotNull('encryption', _$EncryptionEnumMap[instance.encryption]);
  writeNotNull('anonymous_mode', instance.anonymousMode);
  writeNotNull('proxy_type', _$ProxyTypeEnumMap[instance.proxyType]);
  writeNotNull('proxy_ip', instance.proxyIp);
  writeNotNull('proxy_port', instance.proxyPort);
  writeNotNull('proxy_peer_connections', instance.proxyPeerConnections);
  writeNotNull('proxy_auth_enabled', instance.proxyAuthEnabled);
  writeNotNull('proxy_username', instance.proxyUsername);
  writeNotNull('proxy_password', instance.proxyPassword);
  writeNotNull('proxy_torrents_only', instance.proxyTorrentsOnly);
  writeNotNull('ip_filter_enabled', instance.ipFilterEnabled);
  writeNotNull('ip_filter_path', instance.ipFilterPath);
  writeNotNull('ip_filter_trackers', instance.ipFilterTrackers);
  writeNotNull('web_ui_domain_list', instance.webUiDomainList);
  writeNotNull('web_ui_address', instance.webUiAddress);
  writeNotNull('web_ui_port', instance.webUiPort);
  writeNotNull('web_ui_upnp', instance.webUiUpnp);
  writeNotNull('web_ui_username', instance.webUiUsername);
  writeNotNull('web_ui_password', instance.webUiPassword);
  writeNotNull(
      'web_ui_csrf_protection_enabled', instance.webUiCsrfProtectionEnabled);
  writeNotNull('web_ui_clickjacking_protection_enabled',
      instance.webUiClickjackingProtectionEnabled);
  writeNotNull(
      'web_ui_secure_cookie_enabled', instance.webUiSecureCookieEnabled);
  writeNotNull('web_ui_max_auth_fail_count', instance.webUiMaxAuthFailCount);
  writeNotNull('web_ui_ban_duration', instance.webUiBanDuration);
  writeNotNull('web_ui_session_timeout', instance.webUiSessionTimeout);
  writeNotNull('web_ui_host_header_validation_enabled',
      instance.webUiHostHeaderValidationEnabled);
  writeNotNull('bypass_local_auth', instance.bypassLocalAuth);
  writeNotNull('bypass_auth_subnet_whitelist_enabled',
      instance.bypassAuthSubnetWhitelistEnabled);
  writeNotNull(
      'bypass_auth_subnet_whitelist', instance.bypassAuthSubnetWhitelist);
  writeNotNull('alternative_webui_enabled', instance.alternativeWebUiEnabled);
  writeNotNull('alternative_webui_path', instance.alternativeWebUiPath);
  writeNotNull('use_https', instance.useHttps);
  writeNotNull('ssl_key', instance.sslKey);
  writeNotNull('ssl_cert', instance.sslCert);
  writeNotNull('web_ui_https_key_path', instance.webUiHttpsKeyPath);
  writeNotNull('web_ui_https_cert_path', instance.webUiHttpsCertPath);
  writeNotNull('dyndns_enabled', instance.dyndnsEnabled);
  writeNotNull(
      'dyndns_service', _$DyndnsServiceEnumMap[instance.dyndnsService]);
  writeNotNull('dyndns_username', instance.dyndnsUsername);
  writeNotNull('dyndns_password', instance.dyndnsPassword);
  writeNotNull('dyndns_domain', instance.dyndnsDomain);
  writeNotNull('rss_refresh_interval', instance.rssRefreshInterval);
  writeNotNull('rss_max_articles_per_feed', instance.rssMaxArticlesPerFeed);
  writeNotNull('rss_processing_enabled', instance.rssProcessingEnabled);
  writeNotNull(
      'rss_auto_downloading_enabled', instance.rssAutoDownloadingEnabled);
  writeNotNull('rss_download_repack_proper_episodes',
      instance.rssDownloadRepackProperEpisodes);
  writeNotNull('rss_smart_episode_filters', instance.rssSmartEpisodeFilters);
  writeNotNull('add_trackers_enabled', instance.addTrackersEnabled);
  writeNotNull('add_trackers', instance.addTrackers);
  writeNotNull('web_ui_use_custom_http_headers_enabled',
      instance.webUiUseCustomHttpHeadersEnabled);
  writeNotNull('web_ui_custom_http_headers', instance.webUiCustomHttpHeaders);
  writeNotNull('max_seeding_time_enabled', instance.maxSeedingTimeEnabled);
  writeNotNull('max_seeding_time', instance.maxSeedingTime);
  writeNotNull('announce_ip', instance.announceIp);
  writeNotNull('announce_to_all_tiers', instance.announceToAllTiers);
  writeNotNull('announce_to_all_trackers', instance.announceToAllTrackers);
  writeNotNull('async_io_threads', instance.asyncIoThreads);
  writeNotNull(
      'banned_IPs',
      _$JsonConverterToJson<String, List<String>>(
          instance.bannedIPs, const ListItemConverter.newline().toJson));
  writeNotNull('checking_memory_use', instance.checkingMemoryUse);
  writeNotNull('current_interface_address', instance.currentInterfaceAddress);
  writeNotNull('current_network_interface', instance.currentNetworkInterface);
  writeNotNull('disk_cache', instance.diskCache);
  writeNotNull('disk_cache_ttl', instance.diskCacheTtl);
  writeNotNull('embedded_tracker_port', instance.embeddedTrackerPort);
  writeNotNull('enable_coalesce_read_write', instance.enableCoalesceReadWrite);
  writeNotNull('enable_embedded_tracker', instance.enableEmbeddedTracker);
  writeNotNull('enable_multi_connections_from_same_ip',
      instance.enableMultiConnectionsFromSameIp);
  writeNotNull('enable_os_cache', instance.enableOsCache);
  writeNotNull('enable_upload_suggestions', instance.enableUploadSuggestions);
  writeNotNull('file_pool_size', instance.filePoolSize);
  writeNotNull('outgoing_ports_max', instance.outgoingPortsMax);
  writeNotNull('outgoing_ports_min', instance.outgoingPortsMin);
  writeNotNull('recheck_completed_torrents', instance.recheckCompletedTorrents);
  writeNotNull('resolve_peer_countries', instance.resolvePeerCountries);
  writeNotNull('save_resume_data_interval', instance.saveResumeDataInterval);
  writeNotNull('send_buffer_low_watermark', instance.sendBufferLowWatermark);
  writeNotNull('send_buffer_watermark', instance.sendBufferWatermark);
  writeNotNull(
      'send_buffer_watermark_factor', instance.sendBufferWatermarkFactor);
  writeNotNull('socket_backlog_size', instance.socketBacklogSize);
  writeNotNull('upload_choking_algorithm',
      _$UploadChokingAlgorithmEnumMap[instance.uploadChokingAlgorithm]);
  writeNotNull('upload_slots_behavior',
      _$UploadSlotsBehaviorEnumMap[instance.uploadSlotsBehavior]);
  writeNotNull('upnp_lease_duration', instance.upnpLeaseDuration);
  writeNotNull(
      'utp_tcp_mixed_mode', _$UtpTcpMixedModeEnumMap[instance.utpTcpMixedMode]);
  return val;
}

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

const _$MaxRatioActEnumMap = {
  MaxRatioAct.pause: 0,
  MaxRatioAct.remove: 1,
};

const _$BittorrentProtocolEnumMap = {
  BittorrentProtocol.both: 0,
  BittorrentProtocol.tcp: 1,
  BittorrentProtocol.utp: 2,
};

const _$SchedulerDaysEnumMap = {
  SchedulerDays.everyDay: 0,
  SchedulerDays.weekday: 1,
  SchedulerDays.weekend: 2,
  SchedulerDays.monday: 3,
  SchedulerDays.tuesday: 4,
  SchedulerDays.wednesday: 5,
  SchedulerDays.thursday: 6,
  SchedulerDays.friday: 7,
  SchedulerDays.saturday: 8,
  SchedulerDays.sunday: 9,
};

const _$EncryptionEnumMap = {
  Encryption.prefer: 0,
  Encryption.forceOn: 1,
  Encryption.forceOff: 2,
};

const _$ProxyTypeEnumMap = {
  ProxyType.none: 0,
  ProxyType.http: 1,
  ProxyType.socks5: 2,
  ProxyType.httpAuth: 3,
  ProxyType.socks5Auth: 4,
  ProxyType.socks4: 5,
};

const _$DyndnsServiceEnumMap = {
  DyndnsService.dynDNS: 0,
  DyndnsService.noIP: 1,
};

const _$UploadChokingAlgorithmEnumMap = {
  UploadChokingAlgorithm.roundRobin: 0,
  UploadChokingAlgorithm.fastestUpload: 1,
  UploadChokingAlgorithm.antiLeech: 2,
};

const _$UploadSlotsBehaviorEnumMap = {
  UploadSlotsBehavior.fixed: 0,
  UploadSlotsBehavior.uploadRate: 1,
};

const _$UtpTcpMixedModeEnumMap = {
  UtpTcpMixedMode.tcp: 0,
  UtpTcpMixedMode.peerProportional: 1,
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
