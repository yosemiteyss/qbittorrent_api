## 1.2.1
- Fixed `ProxyType` convert string error

## 1.2.0
- Added `SearchController` to api client (thanks to @bhaan)
- Added `trackersRemoved` to `MainData` dto (thanks to @bhaan)
- Added `peersRemoved` to `PeersData` dto (thanks to @bhaan)
- Fixed `PeersInfo.relevance` to double type (thanks to @bhaan)

## 1.1.0
- Fix use int for file priority

## 1.0.7
- Fix convert tracker tier empty string to nul

## 1.0.6
- Add `SyncController.subscribeTorrentPeersData`
- Add `TorrentsController.subscribeWebSeeds`
- Add `TorrentsController.subscribeContents`
- Fix `PeersInfo.progress` data type
- Fix get peers data endpoint
- Fix add trackers request

## 1.0.5
- Add `TorrentsController.subscribeTrackers`
- Add `TorrentsController.exportTorrent`
- Fix stream methods not emitting values on start
- Update `TrackerStatus`

## 1.0.4
- Fix torrent availability data type

## 1.0.3
- Add forcedMetaDL torrent state
- Add checking and moving torrent filter
- Add subscribeTorrentsList stream
- Fix forcedDL enum value

## 1.0.2
- Fix upload torrent files failed.

## 1.0.1
- Update package description.

## 1.0.0
- Initial version.
