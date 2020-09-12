import 'package:divan_test_task_rshb/models/category.dart';
import 'package:divan_test_task_rshb/models/characteristic.dart';
import 'package:divan_test_task_rshb/models/farmer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

/// Объект продукта
@JsonSerializable()
class Product {
  /// Уникальный идентификатор товара
  int id;

  /// Объект Категории
  @JsonKey(ignore: true)
  Category category;

  /// Объект Производителя
  @JsonKey(ignore: true)
  Farmer farmer;

  /// Имя товара
  String title;

  /// Объем/масса
  String unit;

  /// Рейтинг
  double totalRating;

  /// Колличество оценок товара
  int ratingCount;

  /// URI ассета товара
  String image;

  /// Краткое описание товара
  String shortDescription;

  /// Описание товара
  String description;

  /// Цена това
  double price;

  /// Добавлен ли товар в избранное?
  bool favorite;

  /// Характеристики товара
  List<Characteristic> characteristics;

  Product(this.id, this.title, this.unit, this.totalRating, this.ratingCount, this.image, this.shortDescription,
      this.description, this.price, this.favorite, this.characteristics);

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  /// Первращает товар Map для последующей json сериализации
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
