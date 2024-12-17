// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

@JsonSerializable()
class Product extends Equatable {
  final int? jmartProductId;
  final String? productCode;
  final String? productName;
  final int? price;
  final int? quantity;
  final String? status; //NEW"
  final int? companyShelf;
  final List<int>? categoryIds;
  Product({
    required this.jmartProductId,
    required this.productCode,
    required this.productName,
    required this.price,
    required this.quantity,
    required this.status,
    required this.companyShelf,
    required this.categoryIds,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'jmartProductId': jmartProductId,
      'productCode': productCode,
      'productName': productName,
      'price': price,
      'quantity': quantity,
      'status': status,
      'categoryIds': categoryIds,
      'companyShelf': companyShelf
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      jmartProductId:
          map['jmartProductId'] != null ? map['jmartProductId'] as int : null,
      productCode:
          map['productCode'] != null ? map['productCode'] as String : null,
      productName:
          map['productName'] != null ? map['productName'] as String : null,
      price: map['price'] != null ? map['price'] as int : null,
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
      status: map['status'] != null ? map['status'] as String : null,
      categoryIds: map['categoryIds'] != null
          ? List<int>.from((map['categoryIds']))
          : null,
      companyShelf:
          map['companyShelf'] != null ? map['companyShelf'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props {
    return [
      jmartProductId,
      productCode,
      productName,
      price,
      quantity,
      status,
      categoryIds,
      companyShelf
    ];
  }
}
