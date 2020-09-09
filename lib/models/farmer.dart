import 'package:json_annotation/json_annotation.dart';

part 'farmer.g.dart';

/// Объект производителя
@JsonSerializable()
class Farmer {

  /// Уникальный идентификатор
  int id;

  /// Имя производителя
  String title;

  Farmer(this.id, this.title);

  factory Farmer.fromJson(Map<String, dynamic> json) => _$FarmerFromJson(json);

  /// Первращает производителя в Map для последующей json сериализации
  Map<String, dynamic> toJson() => _$FarmerToJson(this);
}
