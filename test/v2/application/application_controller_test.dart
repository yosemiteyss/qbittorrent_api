import 'dart:convert';

import 'package:qbittorrent_api/src/v2/application/application_controller.dart';
import 'package:qbittorrent_api/src/v2/application/dto/bittorrent_protocol.dart';
import 'package:qbittorrent_api/src/v2/application/dto/dyndns_service.dart';
import 'package:qbittorrent_api/src/v2/application/dto/encryption.dart';
import 'package:qbittorrent_api/src/v2/application/dto/max_ratio_act.dart';
import 'package:qbittorrent_api/src/v2/application/dto/preferences.dart';
import 'package:qbittorrent_api/src/v2/application/dto/proxy_type.dart';
import 'package:qbittorrent_api/src/v2/application/dto/scan_dir_type.dart';
import 'package:qbittorrent_api/src/v2/application/dto/scheduler_days.dart';
import 'package:qbittorrent_api/src/v2/application/dto/upload_choking_algorithm.dart';
import 'package:qbittorrent_api/src/v2/application/dto/upload_slots_behavior.dart';
import 'package:qbittorrent_api/src/v2/application/dto/utp_tcp_mixed_mode.dart';
import 'package:test/test.dart';

import '../../network/fake_api_client.dart';

void main() {
  late final FakeApiClient fakeApiClient;
  late final ApplicationController applicationController;

  setUpAll(() {
    fakeApiClient = FakeApiClient();
    applicationController = ApplicationController(fakeApiClient);
  });

  group('ApplicationController', () {
    test('getApplicationVersion returns application version', () async {
      fakeApiClient.setResponse('v4.5.4');
      final version = await applicationController.getApplicationVersion();
      expect(version, 'v4.5.4');
    });

    test('getWebAPIVersion returns web api version', () async {
      fakeApiClient.setResponse('2.8.19');
      final version = await applicationController.getWebAPIVersion();
      expect(version, '2.8.19');
    });

    test('getBuildInfo returns build info', () async {
      fakeApiClient.setResponse(
        '''
        {
          "bitness": 64,
          "boost": "1.82.0",
          "libtorrent": "2.0.9.0",
          "openssl": "3.1.1",
          "qt": "6.5.1",
          "zlib": "1.2.13"
        }
        ''',
        isJson: true,
      );
      final buildInfo = await applicationController.getBuildInfo();
      expect(buildInfo.bitness, 64);
      expect(buildInfo.boost, '1.82.0');
      expect(buildInfo.libtorrent, '2.0.9.0');
      expect(buildInfo.openssl, '3.1.1');
      expect(buildInfo.qt, '6.5.1');
      expect(buildInfo.zlib, '1.2.13');
    });

    test('shutdown returns nothing', () async {
      fakeApiClient.setResponse('');
      await applicationController.shutdown();
    });

    test('getApplicationPreferences returns preferences', () async {
      fakeApiClient.setResponse(r'''
      {
        "add_trackers": "",
        "add_trackers_enabled": false,
        "alt_dl_limit": 10240,
        "alt_up_limit": 10240,
        "alternative_webui_enabled": false,
        "alternative_webui_path": "/home/user/Documents/qbit-webui",
        "announce_ip": "",
        "announce_to_all_tiers": true,
        "announce_to_all_trackers": false,
        "anonymous_mode": false,
        "async_io_threads": 4,
        "auto_delete_mode": 0,
        "auto_tmm_enabled": false,
        "autorun_enabled": false,
        "autorun_program": "",
        "banned_IPs": "",
        "bittorrent_protocol": 0,
        "bypass_auth_subnet_whitelist": "",
        "bypass_auth_subnet_whitelist_enabled": false,
        "bypass_local_auth": false,
        "category_changed_tmm_enabled": false,
        "checking_memory_use": 32,
        "create_subfolder_enabled": true,
        "current_interface_address": "",
        "current_network_interface": "",
        "dht": true,
        "disk_cache": -1,
        "disk_cache_ttl": 60,
        "dl_limit": 0,
        "dont_count_slow_torrents": false,
        "dyndns_domain": "changeme.dyndns.org",
        "dyndns_enabled": false,
        "dyndns_password": "",
        "dyndns_service": 0,
        "dyndns_username": "",
        "embedded_tracker_port": 9000,
        "enable_coalesce_read_write": false,
        "enable_embedded_tracker": false,
        "enable_multi_connections_from_same_ip": false,
        "enable_os_cache": true,
        "enable_piece_extent_affinity": false,
        "enable_upload_suggestions": false,
        "encryption": 0,
        "export_dir": "/home/user/Downloads/all",
        "export_dir_fin": "/home/user/Downloads/completed",
        "file_pool_size": 40,
        "incomplete_files_ext": false,
        "ip_filter_enabled": false,
        "ip_filter_path": "",
        "ip_filter_trackers": false,
        "limit_lan_peers": true,
        "limit_tcp_overhead": false,
        "limit_utp_rate": true,
        "listen_port": 58925,
        "locale": "en",
        "lsd": true,
        "mail_notification_auth_enabled": false,
        "mail_notification_email": "",
        "mail_notification_enabled": false,
        "mail_notification_password": "",
        "mail_notification_sender": "qBittorrent_notification@example.com",
        "mail_notification_smtp": "smtp.changeme.com",
        "mail_notification_ssl_enabled": false,
        "mail_notification_username": "",
        "max_active_downloads": 3,
        "max_active_torrents": 5,
        "max_active_uploads": 3,
        "max_connec": 500,
        "max_connec_per_torrent": 100,
        "max_ratio": -1,
        "max_ratio_act": 0,
        "max_ratio_enabled": false,
        "max_seeding_time": -1,
        "max_seeding_time_enabled": false,
        "max_uploads": -1,
        "max_uploads_per_torrent": -1,
        "outgoing_ports_max": 0,
        "outgoing_ports_min": 0,
        "pex": true,
        "preallocate_all": false,
        "proxy_auth_enabled": false,
        "proxy_ip": "0.0.0.0",
        "proxy_password": "",
        "proxy_peer_connections": false,
        "proxy_port": 8080,
        "proxy_torrents_only": false,
        "proxy_type": 0,
        "proxy_username": "",
        "queueing_enabled": false,
        "random_port": false,
        "recheck_completed_torrents": false,
        "resolve_peer_countries": true,
        "rss_auto_downloading_enabled":true,
        "rss_download_repack_proper_episodes":true,
        "rss_max_articles_per_feed":50,
        "rss_processing_enabled":true,
        "rss_refresh_interval":30,
        "rss_smart_episode_filters":"s(\\d+)e(\\d+)\n(\\d+)x(\\d+)\n(\\d{4}[.\\-]\\d{1,2}[.\\-]\\d{1,2})",
        "save_path": "/home/user/Downloads/",
        "save_path_changed_tmm_enabled": false,
        "save_resume_data_interval": 60,
        "scan_dirs": 
        {
            "/home/user/Downloads/incoming/games": 0,
            "/home/user/Downloads/incoming/movies": 1,
            "/home/user/Downloads/incoming/documents": "/Downloads"
        },
        "schedule_from_hour": 8,
        "schedule_from_min": 0,
        "schedule_to_hour": 20,
        "schedule_to_min": 0,
        "scheduler_days": 0,
        "scheduler_enabled": false,
        "send_buffer_low_watermark": 10,
        "send_buffer_watermark": 500,
        "send_buffer_watermark_factor": 50,
        "slow_torrent_dl_rate_threshold": 2,
        "slow_torrent_inactive_timer": 60,
        "slow_torrent_ul_rate_threshold": 2,
        "socket_backlog_size": 30,
        "start_paused_enabled": false,
        "stop_tracker_timeout": 1,
        "temp_path": "/home/user/Downloads/temp",
        "temp_path_enabled": false,
        "torrent_changed_tmm_enabled": true,
        "up_limit": 0,
        "upload_choking_algorithm": 1,
        "upload_slots_behavior": 0,
        "upnp": true,
        "use_https": false,
        "utp_tcp_mixed_mode": 0,
        "web_ui_address": "*",
        "web_ui_ban_duration": 3600,
        "web_ui_clickjacking_protection_enabled": true,
        "web_ui_csrf_protection_enabled": true,
        "web_ui_custom_http_headers": "",
        "web_ui_domain_list": "*",
        "web_ui_host_header_validation_enabled": true,
        "web_ui_https_cert_path": "",
        "web_ui_https_key_path": "",
        "web_ui_max_auth_fail_count": 5,
        "web_ui_port": 8080,
        "web_ui_secure_cookie_enabled": true,
        "web_ui_session_timeout": 3600,
        "web_ui_upnp": false,
        "web_ui_use_custom_http_headers_enabled": false,
        "web_ui_username": "admin",
        "proxy_type": 0
      }
      ''', isJson: true);
      final preferences =
          await applicationController.getApplicationPreferences();
      expect(preferences.addTrackers, '');
      expect(preferences.addTrackersEnabled, false);
      expect(preferences.altDlLimit, 10240);
      expect(preferences.altUpLimit, 10240);
      expect(preferences.alternativeWebUiEnabled, false);
      expect(
        preferences.alternativeWebUiPath,
        '/home/user/Documents/qbit-webui',
      );
      expect(preferences.announceIp, '');
      expect(preferences.announceToAllTiers, true);
      expect(preferences.announceToAllTrackers, false);
      expect(preferences.anonymousMode, false);
      expect(preferences.asyncIoThreads, 4);
      expect(preferences.autoDeleteMode, 0);
      expect(preferences.autoTmmEnabled, false);
      expect(preferences.autorunEnabled, false);
      expect(preferences.autorunProgram, '');
      expect(preferences.bannedIPs, <String>[]);
      expect(preferences.bittorrentProtocol, BittorrentProtocol.both);
      expect(preferences.bypassAuthSubnetWhitelist, '');
      expect(preferences.bypassAuthSubnetWhitelistEnabled, false);
      expect(preferences.bypassLocalAuth, false);
      expect(preferences.categoryChangedTmmEnabled, false);
      expect(preferences.checkingMemoryUse, 32);
      expect(preferences.createSubfolderEnabled, true);
      expect(preferences.currentInterfaceAddress, '');
      expect(preferences.currentNetworkInterface, '');
      expect(preferences.dht, true);
      expect(preferences.diskCache, -1);
      expect(preferences.diskCacheTtl, 60);
      expect(preferences.dlLimit, 0);
      expect(preferences.dontCountSlowTorrents, false);
      expect(preferences.dyndnsDomain, 'changeme.dyndns.org');
      expect(preferences.dyndnsEnabled, false);
      expect(preferences.dyndnsPassword, '');
      expect(preferences.dyndnsService, DyndnsService.dynDNS);
      expect(preferences.dyndnsUsername, '');
      expect(preferences.embeddedTrackerPort, 9000);
      expect(preferences.enableCoalesceReadWrite, false);
      expect(preferences.enableEmbeddedTracker, false);
      expect(preferences.enableMultiConnectionsFromSameIp, false);
      expect(preferences.enableOsCache, true);
      expect(preferences.enablePieceExtentAffinity, false);
      expect(preferences.enableUploadSuggestions, false);
      expect(preferences.encryption, Encryption.prefer);
      expect(preferences.exportDir, '/home/user/Downloads/all');
      expect(preferences.exportDirFin, '/home/user/Downloads/completed');
      expect(preferences.filePoolSize, 40);
      expect(preferences.incompleteFilesExt, false);
      expect(preferences.ipFilterEnabled, false);
      expect(preferences.ipFilterPath, '');
      expect(preferences.ipFilterTrackers, false);
      expect(preferences.limitLanPeers, true);
      expect(preferences.limitTcpOverhead, false);
      expect(preferences.limitUtpRate, true);
      expect(preferences.listenPort, 58925);
      expect(preferences.locale, 'en');
      expect(preferences.lsd, true);
      expect(preferences.mailNotificationAuthEnabled, false);
      expect(preferences.mailNotificationEmail, '');
      expect(preferences.mailNotificationEnabled, false);
      expect(preferences.mailNotificationPassword, '');
      expect(
        preferences.mailNotificationSender,
        'qBittorrent_notification@example.com',
      );
      expect(preferences.mailNotificationSmtp, 'smtp.changeme.com');
      expect(preferences.mailNotificationSslEnabled, false);
      expect(preferences.mailNotificationUsername, '');
      expect(preferences.maxActiveDownloads, 3);
      expect(preferences.maxActiveTorrents, 5);
      expect(preferences.maxActiveUploads, 3);
      expect(preferences.maxConnec, 500);
      expect(preferences.maxConnecPerTorrent, 100);
      expect(preferences.maxRatio, -1);
      expect(preferences.maxRatioAct, MaxRatioAct.pause);
      expect(preferences.maxRatioEnabled, false);
      expect(preferences.maxSeedingTime, -1);
      expect(preferences.maxSeedingTimeEnabled, false);
      expect(preferences.maxUploads, -1);
      expect(preferences.maxUploadsPerTorrent, -1);
      expect(preferences.outgoingPortsMax, 0);
      expect(preferences.outgoingPortsMin, 0);
      expect(preferences.pex, true);
      expect(preferences.preallocateAll, false);
      expect(preferences.proxyAuthEnabled, false);
      expect(preferences.proxyIp, '0.0.0.0');
      expect(preferences.proxyPassword, '');
      expect(preferences.proxyPeerConnections, false);
      expect(preferences.proxyPort, 8080);
      expect(preferences.proxyTorrentsOnly, false);
      expect(preferences.proxyType, ProxyType.none);
      expect(preferences.proxyUsername, '');
      expect(preferences.queueingEnabled, false);
      expect(preferences.randomPort, false);
      expect(preferences.recheckCompletedTorrents, false);
      expect(preferences.resolvePeerCountries, true);
      expect(preferences.rssAutoDownloadingEnabled, true);
      expect(preferences.rssDownloadRepackProperEpisodes, true);
      expect(preferences.rssMaxArticlesPerFeed, 50);
      expect(preferences.rssProcessingEnabled, true);
      expect(preferences.rssRefreshInterval, 30);
      expect(
        preferences.rssSmartEpisodeFilters,
        's(\\d+)e(\\d+)\n(\\d+)x(\\d+)\n(\\d{4}[.\\-]\\d{1,2}[.\\-]\\d{1,2})',
      );
      expect(preferences.savePath, '/home/user/Downloads/');
      expect(preferences.savePathChangedTmmEnabled, false);
      expect(preferences.saveResumeDataInterval, 60);
      expect(
        preferences.scanDirs?['/home/user/Downloads/incoming/games'],
        const ScanDirType.monitored(),
      );
      expect(
        preferences.scanDirs?['/home/user/Downloads/incoming/movies'],
        const ScanDirType.defaultSavePath(),
      );
      expect(
        preferences.scanDirs?['/home/user/Downloads/incoming/documents']?.value,
        const ScanDirType.custom(path: '/Downloads').value,
      );
      expect(preferences.scheduleFromHour, 8);
      expect(preferences.scheduleFromMin, 0);
      expect(preferences.scheduleToHour, 20);
      expect(preferences.scheduleToMin, 0);
      expect(preferences.schedulerDays, SchedulerDays.everyDay);
      expect(preferences.schedulerEnabled, false);
      expect(preferences.sendBufferLowWatermark, 10);
      expect(preferences.sendBufferWatermark, 500);
      expect(preferences.sendBufferWatermarkFactor, 50);
      expect(preferences.slowTorrentDlRateThreshold, 2);
      expect(preferences.slowTorrentInactiveTimer, 60);
      expect(preferences.slowTorrentUlRateThreshold, 2);
      expect(preferences.socketBacklogSize, 30);
      expect(preferences.startPausedEnabled, false);
      expect(preferences.stopTrackerTimeout, 1);
      expect(preferences.tempPath, '/home/user/Downloads/temp');
      expect(preferences.tempPathEnabled, false);
      expect(preferences.torrentChangedTmmEnabled, true);
      expect(preferences.upLimit, 0);
      expect(
        preferences.uploadChokingAlgorithm,
        UploadChokingAlgorithm.fastestUpload,
      );
      expect(preferences.uploadSlotsBehavior, UploadSlotsBehavior.fixed);
      expect(preferences.upnp, true);
      expect(preferences.useHttps, false);
      expect(preferences.utpTcpMixedMode, UtpTcpMixedMode.tcp);
      expect(preferences.webUiAddress, '*');
      expect(preferences.webUiBanDuration, 3600);
      expect(preferences.webUiClickjackingProtectionEnabled, true);
      expect(preferences.webUiCsrfProtectionEnabled, true);
      expect(preferences.webUiCustomHttpHeaders, '');
      expect(preferences.webUiDomainList, '*');
      expect(preferences.webUiHostHeaderValidationEnabled, true);
      expect(preferences.webUiHttpsCertPath, '');
      expect(preferences.webUiHttpsKeyPath, '');
      expect(preferences.webUiMaxAuthFailCount, 5);
      expect(preferences.webUiPort, 8080);
      expect(preferences.webUiSecureCookieEnabled, true);
      expect(preferences.webUiSessionTimeout, 3600);
      expect(preferences.webUiUpnp, false);
      expect(preferences.webUiUseCustomHttpHeadersEnabled, false);
      expect(preferences.webUiUsername, 'admin');
      expect(preferences.proxyType, ProxyType.none);
    });

    test('setApplicationPreferences set params correctly', () async {
      const preferences = Preferences(
        addTrackers: '',
        addTrackersEnabled: false,
        altDlLimit: 10240,
        altUpLimit: 10240,
        alternativeWebUiEnabled: false,
        alternativeWebUiPath: '/home/user/Documents/qbit-webui',
        announceIp: '',
        announceToAllTiers: true,
        announceToAllTrackers: false,
        anonymousMode: false,
        asyncIoThreads: 4,
        autoDeleteMode: 0,
        autoTmmEnabled: false,
        autorunEnabled: false,
        autorunProgram: '',
        bannedIPs: <String>[],
        bittorrentProtocol: BittorrentProtocol.both,
        bypassAuthSubnetWhitelist: '',
        bypassAuthSubnetWhitelistEnabled: false,
        bypassLocalAuth: false,
        categoryChangedTmmEnabled: false,
        checkingMemoryUse: 32,
        createSubfolderEnabled: true,
        currentInterfaceAddress: '',
        currentNetworkInterface: '',
        dht: true,
        diskCache: -1,
        diskCacheTtl: 60,
        dlLimit: 0,
        dontCountSlowTorrents: false,
        dyndnsDomain: 'changeme.dyndns.org',
        dyndnsEnabled: false,
        dyndnsPassword: '',
        dyndnsService: DyndnsService.dynDNS,
        dyndnsUsername: '',
        embeddedTrackerPort: 9000,
        enableCoalesceReadWrite: false,
        enableEmbeddedTracker: false,
        enableMultiConnectionsFromSameIp: false,
        enableOsCache: true,
        enablePieceExtentAffinity: false,
        enableUploadSuggestions: false,
        encryption: Encryption.prefer,
        exportDir: '/home/user/Downloads/all',
        exportDirFin: '/home/user/Downloads/completed',
        filePoolSize: 40,
        incompleteFilesExt: false,
        ipFilterEnabled: false,
        ipFilterPath: '',
        ipFilterTrackers: false,
        limitLanPeers: true,
        limitTcpOverhead: false,
        limitUtpRate: true,
        listenPort: 58925,
        locale: 'en',
        lsd: true,
        mailNotificationAuthEnabled: false,
        mailNotificationEmail: '',
        mailNotificationEnabled: false,
        mailNotificationPassword: '',
        mailNotificationSender: 'qBittorrent_notification@example.com',
        mailNotificationSmtp: 'smtp.changeme.com',
        mailNotificationSslEnabled: false,
        mailNotificationUsername: '',
        maxActiveDownloads: 3,
        maxActiveTorrents: 5,
        maxActiveUploads: 3,
        maxConnec: 500,
        maxConnecPerTorrent: 100,
        maxRatio: -1,
        maxRatioAct: MaxRatioAct.pause,
        maxRatioEnabled: false,
        maxSeedingTime: -1,
        maxSeedingTimeEnabled: false,
        maxUploads: -1,
        maxUploadsPerTorrent: -1,
        outgoingPortsMax: 0,
        outgoingPortsMin: 0,
        pex: true,
        preallocateAll: false,
        proxyAuthEnabled: false,
        proxyIp: '0.0.0.0',
        proxyPassword: '',
        proxyPeerConnections: false,
        proxyPort: 8080,
        proxyTorrentsOnly: false,
        proxyType: ProxyType.none,
        proxyUsername: '',
        queueingEnabled: false,
        randomPort: false,
        recheckCompletedTorrents: false,
        resolvePeerCountries: true,
        rssAutoDownloadingEnabled: true,
        rssDownloadRepackProperEpisodes: true,
        rssMaxArticlesPerFeed: 50,
        rssProcessingEnabled: true,
        rssRefreshInterval: 30,
        rssSmartEpisodeFilters:
            's(\\d+)e(\\d+)\n(\\d+)x(\\d+)\n(\\d{4}[.\\-]\\d{1,2}[.\\-]\\d{1,2})',
        savePath: '/home/user/Downloads/',
        savePathChangedTmmEnabled: false,
        saveResumeDataInterval: 60,
        scanDirs: {
          '/home/user/Downloads/incoming/games': ScanDirType.monitored(),
          '/home/user/Downloads/incoming/movies': ScanDirType.defaultSavePath(),
          '/home/user/Downloads/incoming/documents':
              ScanDirType.custom(path: '/Downloads'),
        },
        scheduleFromHour: 8,
        scheduleFromMin: 0,
        scheduleToHour: 20,
        scheduleToMin: 0,
        schedulerDays: SchedulerDays.everyDay,
        schedulerEnabled: false,
        sendBufferLowWatermark: 10,
        sendBufferWatermark: 500,
        sendBufferWatermarkFactor: 50,
        slowTorrentDlRateThreshold: 2,
        slowTorrentInactiveTimer: 60,
        slowTorrentUlRateThreshold: 2,
        socketBacklogSize: 30,
        startPausedEnabled: false,
        stopTrackerTimeout: 1,
        tempPath: '/home/user/Downloads/temp',
        tempPathEnabled: false,
        torrentChangedTmmEnabled: true,
        upLimit: 0,
        uploadChokingAlgorithm: UploadChokingAlgorithm.fastestUpload,
        uploadSlotsBehavior: UploadSlotsBehavior.fixed,
        upnp: true,
        useHttps: false,
        utpTcpMixedMode: UtpTcpMixedMode.tcp,
        webUiAddress: '*',
        webUiBanDuration: 3600,
        webUiClickjackingProtectionEnabled: true,
        webUiCsrfProtectionEnabled: true,
        webUiCustomHttpHeaders: '',
        webUiDomainList: '*',
        webUiHostHeaderValidationEnabled: true,
        webUiHttpsCertPath: '',
        webUiHttpsKeyPath: '',
        webUiMaxAuthFailCount: 5,
        webUiPort: 8080,
        webUiSecureCookieEnabled: true,
        webUiSessionTimeout: 3600,
        webUiUpnp: false,
        webUiUseCustomHttpHeadersEnabled: false,
        webUiUsername: 'admin',
      );

      fakeApiClient.setResponse('');
      await applicationController.setApplicationPreferences(preferences);

      final body = fakeApiClient.getBody() as String;
      final jsonBody =
          jsonDecode(body.replaceAll('json=', '')) as Map<String, dynamic>;
      expect(jsonBody['add_trackers'], '');
      expect(jsonBody['add_trackers_enabled'], false);
      expect(jsonBody['alt_dl_limit'], 10240);
      expect(jsonBody['alt_up_limit'], 10240);
      expect(jsonBody['alternative_webui_enabled'], false);
      expect(
        jsonBody['alternative_webui_path'],
        '/home/user/Documents/qbit-webui',
      );
      expect(jsonBody['announce_ip'], '');
      expect(jsonBody['announce_to_all_tiers'], true);
      expect(jsonBody['announce_to_all_trackers'], false);
      expect(jsonBody['anonymous_mode'], false);
      expect(jsonBody['async_io_threads'], 4);
      expect(jsonBody['auto_delete_mode'], 0);
      expect(jsonBody['auto_tmm_enabled'], false);
      expect(jsonBody['autorun_enabled'], false);
      expect(jsonBody['autorun_program'], '');
      expect(jsonBody['banned_IPs'], '');
      expect(jsonBody['bittorrent_protocol'], 0);
      expect(jsonBody['bypass_auth_subnet_whitelist'], '');
      expect(jsonBody['bypass_auth_subnet_whitelist_enabled'], false);
      expect(jsonBody['bypass_local_auth'], false);
      expect(jsonBody['category_changed_tmm_enabled'], false);
      expect(jsonBody['checking_memory_use'], 32);
      expect(jsonBody['create_subfolder_enabled'], true);
      expect(jsonBody['current_interface_address'], '');
      expect(jsonBody['current_network_interface'], '');
      expect(jsonBody['dht'], true);
      expect(jsonBody['disk_cache'], -1);
      expect(jsonBody['disk_cache_ttl'], 60);
      expect(jsonBody['dl_limit'], 0);
      expect(jsonBody['dont_count_slow_torrents'], false);
      expect(jsonBody['dyndns_domain'], 'changeme.dyndns.org');
      expect(jsonBody['dyndns_enabled'], false);
      expect(jsonBody['dyndns_password'], '');
      expect(jsonBody['dyndns_service'], 0);
      expect(jsonBody['dyndns_username'], '');
      expect(jsonBody['embedded_tracker_port'], 9000);
      expect(jsonBody['enable_coalesce_read_write'], false);
      expect(jsonBody['enable_embedded_tracker'], false);
      expect(jsonBody['enable_multi_connections_from_same_ip'], false);
      expect(jsonBody['enable_os_cache'], true);
      expect(jsonBody['enable_piece_extent_affinity'], false);
      expect(jsonBody['enable_upload_suggestions'], false);
      expect(jsonBody['encryption'], 0);
      expect(jsonBody['export_dir'], '/home/user/Downloads/all');
      expect(jsonBody['export_dir_fin'], '/home/user/Downloads/completed');
      expect(jsonBody['file_pool_size'], 40);
      expect(jsonBody['incomplete_files_ext'], false);
      expect(jsonBody['ip_filter_enabled'], false);
      expect(jsonBody['ip_filter_path'], '');
      expect(jsonBody['ip_filter_trackers'], false);
      expect(jsonBody['limit_lan_peers'], true);
      expect(jsonBody['limit_tcp_overhead'], false);
      expect(jsonBody['limit_utp_rate'], true);
      expect(jsonBody['listen_port'], 58925);
      expect(jsonBody['locale'], 'en');
      expect(jsonBody['lsd'], true);
      expect(jsonBody['mail_notification_auth_enabled'], false);
      expect(jsonBody['mail_notification_email'], '');
      expect(jsonBody['mail_notification_enabled'], false);
      expect(jsonBody['mail_notification_password'], '');
      expect(
        jsonBody['mail_notification_sender'],
        'qBittorrent_notification@example.com',
      );
      expect(jsonBody['mail_notification_smtp'], 'smtp.changeme.com');
      expect(jsonBody['mail_notification_ssl_enabled'], false);
      expect(jsonBody['mail_notification_username'], '');
      expect(jsonBody['max_active_downloads'], 3);
      expect(jsonBody['max_active_torrents'], 5);
      expect(jsonBody['max_active_uploads'], 3);
      expect(jsonBody['max_connec'], 500);
      expect(jsonBody['max_connec_per_torrent'], 100);
      expect(jsonBody['max_ratio'], -1);
      expect(jsonBody['max_ratio_act'], 0);
      expect(jsonBody['max_ratio_enabled'], false);
      expect(jsonBody['max_seeding_time'], -1);
      expect(jsonBody['max_seeding_time_enabled'], false);
      expect(jsonBody['max_uploads'], -1);
      expect(jsonBody['max_uploads_per_torrent'], -1);
      expect(jsonBody['outgoing_ports_max'], 0);
      expect(jsonBody['outgoing_ports_min'], 0);
      expect(jsonBody['pex'], true);
      expect(jsonBody['preallocate_all'], false);
      expect(jsonBody['proxy_auth_enabled'], false);
      expect(jsonBody['proxy_ip'], '0.0.0.0');
      expect(jsonBody['proxy_password'], '');
      expect(jsonBody['proxy_peer_connections'], false);
      expect(jsonBody['proxy_port'], 8080);
      expect(jsonBody['proxy_torrents_only'], false);
      expect(jsonBody['proxy_type'], 0);
      expect(jsonBody['proxy_username'], '');
      expect(jsonBody['queueing_enabled'], false);
      expect(jsonBody['random_port'], false);
      expect(jsonBody['recheck_completed_torrents'], false);
      expect(jsonBody['resolve_peer_countries'], true);
      expect(jsonBody['rss_auto_downloading_enabled'], true);
      expect(jsonBody['rss_download_repack_proper_episodes'], true);
      expect(jsonBody['rss_max_articles_per_feed'], 50);
      expect(jsonBody['rss_processing_enabled'], true);
      expect(jsonBody['rss_refresh_interval'], 30);
      expect(
        jsonBody['rss_smart_episode_filters'],
        's(\\d+)e(\\d+)\n(\\d+)x(\\d+)\n(\\d{4}[.\\-]\\d{1,2}[.\\-]\\d{1,2})',
      );
      expect(jsonBody['save_path'], '/home/user/Downloads/');
      expect(jsonBody['save_path_changed_tmm_enabled'], false);
      expect(jsonBody['save_resume_data_interval'], 60);
      expect(
        (jsonBody['scan_dirs']
            as Map<String, dynamic>)['/home/user/Downloads/incoming/games'],
        0,
      );
      expect(
        (jsonBody['scan_dirs']
            as Map<String, dynamic>)['/home/user/Downloads/incoming/movies'],
        1,
      );
      expect(
        (jsonBody['scan_dirs']
            as Map<String, dynamic>)['/home/user/Downloads/incoming/documents'],
        '/Downloads',
      );
      expect(jsonBody['schedule_from_hour'], 8);
      expect(jsonBody['schedule_from_min'], 0);
      expect(jsonBody['schedule_to_hour'], 20);
      expect(jsonBody['schedule_to_min'], 0);
      expect(jsonBody['scheduler_days'], 0);
      expect(jsonBody['scheduler_enabled'], false);
      expect(jsonBody['send_buffer_low_watermark'], 10);
      expect(jsonBody['send_buffer_watermark'], 500);
      expect(jsonBody['send_buffer_watermark_factor'], 50);
      expect(jsonBody['slow_torrent_dl_rate_threshold'], 2);
      expect(jsonBody['slow_torrent_inactive_timer'], 60);
      expect(jsonBody['slow_torrent_ul_rate_threshold'], 2);
      expect(jsonBody['socket_backlog_size'], 30);
      expect(jsonBody['start_paused_enabled'], false);
      expect(jsonBody['stop_tracker_timeout'], 1);
      expect(jsonBody['temp_path'], '/home/user/Downloads/temp');
      expect(jsonBody['temp_path_enabled'], false);
      expect(jsonBody['torrent_changed_tmm_enabled'], true);
      expect(jsonBody['up_limit'], 0);
      expect(jsonBody['upload_choking_algorithm'], 1);
      expect(jsonBody['upload_slots_behavior'], 0);
      expect(jsonBody['upnp'], true);
      expect(jsonBody['use_https'], false);
      expect(jsonBody['utp_tcp_mixed_mode'], 0);
      expect(jsonBody['web_ui_address'], '*');
      expect(jsonBody['web_ui_ban_duration'], 3600);
      expect(jsonBody['web_ui_clickjacking_protection_enabled'], true);
      expect(jsonBody['web_ui_csrf_protection_enabled'], true);
      expect(jsonBody['web_ui_custom_http_headers'], '');
      expect(jsonBody['web_ui_domain_list'], '*');
      expect(jsonBody['web_ui_host_header_validation_enabled'], true);
      expect(jsonBody['web_ui_https_cert_path'], '');
      expect(jsonBody['web_ui_https_key_path'], '');
      expect(jsonBody['web_ui_max_auth_fail_count'], 5);
      expect(jsonBody['web_ui_port'], 8080);
      expect(jsonBody['web_ui_secure_cookie_enabled'], true);
      expect(jsonBody['web_ui_session_timeout'], 3600);
      expect(jsonBody['web_ui_upnp'], false);
      expect(jsonBody['web_ui_use_custom_http_headers_enabled'], false);
      expect(jsonBody['web_ui_username'], 'admin');
    });

    test('getDefaultSavePath returns save path', () async {
      fakeApiClient.setResponse('C:/Users/Dayman/Downloads');
      final path = await applicationController.getDefaultSavePath();
      expect(path, 'C:/Users/Dayman/Downloads');
    });

    group('convert proxy type', () {
      test('convert int type input', () async {
        fakeApiClient.setResponse('''
          {
            "proxy_type": 0
          }
        ''', isJson: true);
        final preferences =
            await applicationController.getApplicationPreferences();
        expect(preferences.proxyType, ProxyType.none);
      });

      test('convert string type input', () async {
        fakeApiClient.setResponse('''
          {
            "proxy_type": "None"
          }
        ''', isJson: true);
        final preferences =
            await applicationController.getApplicationPreferences();
        expect(preferences.proxyType, ProxyType.none);
      });
    });
  });
}
