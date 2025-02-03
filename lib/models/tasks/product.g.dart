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
      price: (json['price'] as num?)?.toDouble(),
      quantity: (json['quantity'] as num?)?.toInt(),
      status: $enumDecodeNullable(_$ProductStatusEnumMap, json['status']),
      companyShelf: (json['companyShelf'] as num?)?.toInt(),
      categoryIds: (json['categoryIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      orderProductType: $enumDecodeNullable(
          _$OrderProductTypeEnumMap, json['orderProductType']),
      productId: (json['productId'] as num?)?.toInt(),
      productType:
          $enumDecodeNullable(_$ProductTypeEnumMap, json['productType']),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'jmartProductId': instance.jmartProductId,
      'productCode': instance.productCode,
      'productName': instance.productName,
      'imageUrl': instance.imageUrl,
      'price': instance.price,
      'quantity': instance.quantity,
      'status': _$ProductStatusEnumMap[instance.status],
      'companyShelf': instance.companyShelf,
      'categoryIds': instance.categoryIds,
      'orderProductType': _$OrderProductTypeEnumMap[instance.orderProductType],
      'productId': instance.productId,
      'productType': _$ProductTypeEnumMap[instance.productType],
    };

const _$ProductStatusEnumMap = {
  ProductStatus.NEW: 'NEW',
  ProductStatus.NOT_AVAILABLE: 'NOT_AVAILABLE',
  ProductStatus.PROCESSED: 'PROCESSED',
};

const _$OrderProductTypeEnumMap = {
  OrderProductType.GOODS: 'GOODS',
  OrderProductType.SUPERMARKET: 'SUPERMARKET',
  OrderProductType.SERVICE: 'SERVICE',
};

const _$ProductTypeEnumMap = {
  ProductType.ADDED: 'ADDED',
  ProductType.ORIGINAL: 'ORIGINAL',
  ProductType.REPLACED: 'REPLACED',
};
