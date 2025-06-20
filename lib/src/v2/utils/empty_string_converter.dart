import 'package:json_annotation/json_annotation.dart';

/// {@template list_item_converter}
/// Convert empty string to nullable int type.
/// {@endtemplate}
class EmptyStringToInt implements JsonConverter<int?, dynamic> {
  /// {@macro list_item_converter}
  const EmptyStringToInt();

  @override
  int? fromJson(dynamic json) {
    if (json is String) {
      return json.isEmpty ? null : int.tryParse(json);
    } else if (json is int) {
      return json;
    }
    return null;
  }

  @override
  dynamic toJson(int? object) {
    return object;
  }
}
