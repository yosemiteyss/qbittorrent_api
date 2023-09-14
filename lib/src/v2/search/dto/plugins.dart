import 'package:qbittorrent_api/src/v2/utils/list_item_converter.dart';

class Plugins {
  /// Select multiple plugins.
  const Plugins({required List<String> plugins})
      : _plugins = plugins,
        _selectAll = false,
        _selectEnabled = false;

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
