import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
// part 'product_change_status.g.dart';

@JsonSerializable()
class ProductCopy extends Equatable {
  // final int? jmartProductId;
  // final String? productCode;
  // final String? productName;
  final int? price;
  final int? quantity;
  final String? status; //NEW"
  // final int? companyShelf;
  // final List<int>? categoryIds;
  // final String? orderProductType; //SUPERMARKET, GOODS"
  final int? productId;
  // final String? productType;

  ProductCopy({
    // required this.jmartProductId,
    // required this.productCode,
    // required this.productName,
    required this.price,
    required this.quantity,
    required this.status,
    // required this.companyShelf,
    // required this.categoryIds,
    // required this.orderProductType,
    required this.productId,
    // required this.productType,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // 'jmartProductId': jmartProductId,
      // 'productCode': productCode,
      // 'productName': productName,
      'price': price,
      'quantity': quantity,
      'status': status,
      // 'categoryIds': categoryIds,
      // 'companyShelf': companyShelf,
      // 'orderProductType': orderProductType,
      'productId': productId,
      // 'productType': productType
    };
  }

  factory ProductCopy.fromMap(Map<String, dynamic> map) {
    return ProductCopy(
      // jmartProductId:
      //     map['jmartProductId'] != null ? map['jmartProductId'] as int : null,
      // productCode:
      //     map['productCode'] != null ? map['productCode'] as String : null,
      // productName:
      //     map['productName'] != null ? map['productName'] as String : null,
      price: map['price'] != null ? map['price'] as int : null,
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
      status: map['status'] != null ? map['status'] as String : null,
      // categoryIds: map['categoryIds'] != null
      //     ? List<int>.from((map['categoryIds']))
      //     : null,
      // companyShelf:
      //     map['companyShelf'] != null ? map['companyShelf'] as int : null,
      // orderProductType: map['orderProductType'] != null
      //     ? map['orderProductType'] as String
      //     : null,
      productId: map['productId'] != null ? map['productId'] as int : null,
      // productType:
      //     map['productType'] != null ? map['productType'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductCopy.fromJson(String source) =>
      ProductCopy.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props {
    return [
      // jmartProductId,
      // productCode,
      // productName,
      price,
      quantity,
      status,
      // categoryIds,
      // companyShelf,
      // orderProductType,
      productId,
      // productType
    ];
  }

  ProductCopy copyWith({
    // int? jmartProductId,
    // String? productCode,
    // String? productName,
    int? price,
    int? quantity,
    String? status,
    // int? companyShelf,
    // List<int>? categoryIds,
    // String? orderProductType,
    int? productId,
    // String? productType,
  }) {
    return ProductCopy(
      // jmartProductId: jmartProductId ?? this.jmartProductId,
      // productCode: productCode ?? this.productCode,
      // productName: productName ?? this.productName,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      status: status ?? this.status,
      // companyShelf: companyShelf ?? this.companyShelf,
      // categoryIds: categoryIds ?? this.categoryIds,
      // orderProductType: orderProductType ?? this.orderProductType,
      productId: productId ?? this.productId,
      // productType: productType ?? this.productType,
    );
  }
}
