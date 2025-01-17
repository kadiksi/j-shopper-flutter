// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'processed_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProcessedProduct _$ProcessedProductFromJson(Map<String, dynamic> json) =>
    ProcessedProduct(
      added: (json['added'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as String))
          .toList(),
      replaced: (json['replaced'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as String))
          .toList(),
      withoutChange: (json['withoutChange'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as String))
          .toList(),
      notAvailable: (json['notAvailable'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as String))
          .toList(),
    );

Map<String, dynamic> _$ProcessedProductToJson(ProcessedProduct instance) =>
    <String, dynamic>{
      'added': instance.added,
      'replaced': instance.replaced,
      'withoutChange': instance.withoutChange,
      'notAvailable': instance.notAvailable,
    };
