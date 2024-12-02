// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      jmartProductId: (json['jmartProductId'] as num?)?.toInt(),
      productCode: json['productCode'] as String?,
      productName: json['productName'] as String?,
      price: (json['price'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'jmartProductId': instance.jmartProductId,
      'productCode': instance.productCode,
      'productName': instance.productName,
      'price': instance.price,
      'quantity': instance.quantity,
      'status': instance.status,
    };
