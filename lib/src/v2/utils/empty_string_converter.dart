import 'package:json_annotation/json_annotation.dart';

/// Convert empty string to nullable int type.
class EmptyStringToInt implements JsonConverter<int?, dynamic> {
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
