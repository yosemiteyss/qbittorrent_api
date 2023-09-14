import 'package:qbittorrent_api/src/v2/utils/list_item_converter.dart';

class Categories {
  /// Select multiple categories.
  const Categories({required List<String> categories})
      : _categories = categories,
        _selectAll = false;

  /// Select all categories.
  const Categories.all()
      : _selectAll = true,
        _categories = const [];

  final List<String> _categories;

  final bool _selectAll;

  String toRequestString() {
    if (_selectAll) {
      return 'all';
    } else {
      return const ListItemConverter.bar().toJson(_categories);
    }
  }
}
