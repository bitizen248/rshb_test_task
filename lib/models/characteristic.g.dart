// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characteristic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Characteristic _$CharacteristicFromJson(Map<String, dynamic> json) {
  return Characteristic(
    json['title'] as String,
    json['value'] as String,
  );
}

Map<String, dynamic> _$CharacteristicToJson(Characteristic instance) =>
    <String, dynamic>{
      'title': instance.title,
      'value': instance.value,
    };
