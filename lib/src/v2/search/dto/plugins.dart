import 'package:qbittorrent_api/src/v2/utils/list_item_converter.dart';

/// {@template plugins}
/// Plugins.
/// {@endtemplate}
class Plugins {
  /// {@macro plugins}
  /// Select multiple plugins.
  const Plugins({required List<String> plugins})
      : _plugins = plugins,
        _selectAll = false,
        _selectEnabled = false;

  /// {@macro plugins}
  /// Select all plugins.
  const Plugins.all()
      : _selectAll = true,
        _selectEnabled = false,
        _plugins = const [];

  /// Select enabled plugins.
  const Plugins.enabled()
      : _selectAll = false,
        _selectEnabled = true,
        _plugins = const [];

  final List<String> _plugins;

  final bool _selectAll;

  final bool _selectEnabled;

  /// Convert to request string.
  String toRequestString() {
    if (_selectEnabled) {
      return 'enabled';
    } else if (_selectAll) {
      return 'all';
    } else {
      return const ListItemConverter.bar().toJson(_plugins);
    }
  }
}
