import 'package:qbittorrent_api/src/v2/utils/list_item_converter.dart';

/// {@template torrents}
/// Torrents selector.
/// {@endtemplate}
class Torrents {
  /// {@macro torrents}
  /// Select multiple torrents.
  const Torrents({required List<String> hashes})
      : _hashes = hashes,
        _selectAll = false;

  /// {@macro torrents}
  /// Select all torrents.
  const Torrents.all()
      : _selectAll = true,
        _hashes = const [];

  final List<String> _hashes;

  final bool _selectAll;

  /// Convert to request string.
  String toRequestString() {
    if (_selectAll) {
      return 'all';
    } else {
      return const ListItemConverter.bar().toJson(_hashes);
    }
  }
}
