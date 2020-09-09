import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

/// Объект категории
@JsonSerializable()
class Category {
  /// Уникальный идентификатор категории
  int id;

  /// Название
  String title;

  /// URI ассета иконки
  String iconUri;

  Category(this.id, this.title, this.iconUri);

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  /// Первращает категорию Map для последующей json сериализации
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
