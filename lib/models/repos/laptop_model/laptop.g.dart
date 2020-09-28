// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'laptop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Laptop _$LaptopFromJson(Map<String, dynamic> json) {
  return Laptop(
    json['laptopId'] as int,
    json['laptopName'] as String,
    json['quantity'],
    json['price'],
    json['seriesCPU'] as String,
    json['displayScreen'] as String,
    json['graphicCard'] as String,
    json['storage'] as String,
    json['ram'] as String,
    json['weight'],
    json['brandId'],
  );
}

Map<String, dynamic> _$LaptopToJson(Laptop instance) => <String, dynamic>{
      'laptopId': instance.laptopId,
      'laptopName': instance.laptopName,
      'quantity': instance.quantity,
      'price': instance.price,
      'seriesCPU': instance.seriesCPU,
      'displayScreen': instance.displayScreen,
      'graphicCard': instance.graphicCard,
      'storage': instance.storage,
      'ram': instance.ram,
      'weight': instance.weight,
      'brandId': instance.brandId,
    };
