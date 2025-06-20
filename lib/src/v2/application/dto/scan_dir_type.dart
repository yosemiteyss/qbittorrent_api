/// {@template scan_dir_type}
/// Scan directory type.
/// {@endtemplate}
class ScanDirType {
  /// {@macro scan_dir_type}
  /// Download to the monitored folder
  const ScanDirType.monitored() : value = _monitoredValue;

  /// {@macro scan_dir_type}
  /// Download to the default save path
  const ScanDirType.defaultSavePath() : value = _defaultSavePathValue;

  /// {@macro scan_dir_type}
  /// Download to this path
  const ScanDirType.custom({required String path}) : value = path;

  /// The value of the scan directory type.
  final dynamic value;

  static const int _monitoredValue = 0;
  static const int _defaultSavePathValue = 1;

  /// Create a [ScanDirType] from its value.
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
