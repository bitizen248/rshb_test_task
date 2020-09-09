import 'package:json_annotation/json_annotation.dart';

part 'characteristic.g.dart';

/// Объект характеристики/свойства товара
@JsonSerializable()
class Characteristic {

  /// Имя свойства
  String title;

  /// Значение свойства
  String value;

  Characteristic(this.title, this.value);

  factory Characteristic.fromJson(Map<String, dynamic> json) => _$CharacteristicFromJson(json);

  /// Первращает свойство в Map для последующей json сериализации
  Map<String, dynamic> toJson() => _$CharacteristicToJson(this);
}
