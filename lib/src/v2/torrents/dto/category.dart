import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  const Category({this.name, this.savePath});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  /// The name of the category
  @JsonKey(name: 'name')
  final String? name;

  /// The save path of the category
  @JsonKey(name: 'savePath')
  final String? savePath;

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
