// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    json['id'] as int,
    json['unit'] as String,
    (json['totalRating'] as num)?.toDouble(),
    json['ratingCount'] as int,
    json['image'] as String,
    json['shortDescription'] as String,
    json['description'] as String,
    (json['price'] as num)?.toDouble(),
    json['favorite'] as bool,
    (json['characteristics'] as List)
        ?.map((e) => e == null
            ? null
            : Characteristic.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'unit': instance.unit,
      'totalRating': instance.totalRating,
      'ratingCount': instance.ratingCount,
      'image': instance.image,
      'shortDescription': instance.shortDescription,
      'description': instance.description,
      'price': instance.price,
      'favorite': instance.favorite,
      'characteristics': instance.characteristics,
    };
