import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

/// {@template category}
/// Category.
/// {@endtemplate}
@JsonSerializable()
class Category {
  /// {@macro category}
  const Category({this.name, this.savePath});

  /// Create an instance from a JSON map.
  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  /// The name of the category
  @JsonKey(name: 'name')
  final String? name;

  /// The save path of the category
  @JsonKey(name: 'savePath')
  final String? savePath;

  /// Convert the instance to a JSON map.
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
