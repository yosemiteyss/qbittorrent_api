import 'package:json_annotation/json_annotation.dart';

/// {@template list_item_converter}
/// Converts a list of strings to a string by joining them with a separating
/// character.
/// {@endtemplate}
class ListItemConverter implements JsonConverter<List<String>, String> {
  /// Use comma as separator.
  /// ['a', 'b', 'c'] -> 'a,b,c'
  const ListItemConverter.comma() : _separator = ',';

  /// Use bar character as separator.
  /// ['a', 'b', 'c'] -> 'a|b|c'
  const ListItemConverter.bar() : _separator = '|';

  /// Use newline character as separator.
  /// ['a', 'b', 'c'] -> 'a\nb\nc'
  const ListItemConverter.newline() : _separator = '\n';

  final String _separator;

  @override
  List<String> fromJson(String json) {
    if (json.isEmpty) {
      return [];
    }
    return json.split(_separator).map((e) => e.trim()).toList();
  }

  @override
  String toJson(List<String> object) {
    return object.join(_separator);
  }
}
