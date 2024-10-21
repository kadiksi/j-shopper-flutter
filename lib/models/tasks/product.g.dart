// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: (json['id'] as num?)?.toInt(),
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      productId: (json['productId'] as num?)?.toInt(),
      name: json['name'] as String?,
      isDelivered: json['isDelivered'] as bool?,
      quantity: (json['quantity'] as num?)?.toInt(),
      length: (json['length'] as num?)?.toInt(),
      width: (json['width'] as num?)?.toInt(),
      weight: (json['weight'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toInt(),
      barcode: json['barcode'],
      comment: json['comment'],
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'createdDate': instance.createdDate?.toIso8601String(),
      'productId': instance.productId,
      'name': instance.name,
      'isDelivered': instance.isDelivered,
      'quantity': instance.quantity,
      'length': instance.length,
      'width': instance.width,
      'weight': instance.weight,
      'height': instance.height,
      'price': instance.price,
      'barcode': instance.barcode,
      'comment': instance.comment,
    };
