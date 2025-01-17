// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      jmartProductId: (json['jmartProductId'] as num?)?.toInt(),
      productCode: json['productCode'] as String?,
      productName: json['productName'] as String?,
      imageUrl: json['imageUrl'] as String?,
      price: (json['price'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
      status: json['status'] as String?,
      companyShelf: (json['companyShelf'] as num?)?.toInt(),
      categoryIds: (json['categoryIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      orderProductType: json['orderProductType'] as String?,
      productId: (json['productId'] as num?)?.toInt(),
      productType: json['productType'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'jmartProductId': instance.jmartProductId,
      'productCode': instance.productCode,
      'productName': instance.productName,
      'imageUrl': instance.imageUrl,
      'price': instance.price,
      'quantity': instance.quantity,
      'status': instance.status,
      'companyShelf': instance.companyShelf,
      'categoryIds': instance.categoryIds,
      'orderProductType': instance.orderProductType,
      'productId': instance.productId,
      'productType': instance.productType,
    };
