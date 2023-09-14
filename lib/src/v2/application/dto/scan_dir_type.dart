class ScanDirType {
  /// Download to the monitored folder
  const ScanDirType.monitored() : value = _monitoredValue;

  /// Download to the default save path
  const ScanDirType.defaultSavePath() : value = _defaultSavePathValue;

  /// Download to this path
  const ScanDirType.custom({required String path}) : value = path;

  final dynamic value;

  static const int _monitoredValue = 0;
  static const int _defaultSavePathValue = 1;

  // ignore: prefer_constructors_over_static_methods
  static ScanDirType fromValue(dynamic value) {
    switch (value) {
      case _monitoredValue:
        return const ScanDirType.monitored();
      case _defaultSavePathValue:
        return const ScanDirType.defaultSavePath();
      default:
        return ScanDirType.custom(path: value as String);
    }
  }
}
