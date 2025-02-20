import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:j_courier/models/tasks/product.dart';

part 'task.g.dart';

@JsonSerializable()
// ignore: must_be_immutable
class Task extends Equatable {
  int? shopperOrderId;
  String? externalOrderId;
  String? orderSource;
  String? orderType; //SUPERMARKET
  String? deliveryType; //J
  int? customerId;
  String? customerName;
  int? customerCityId;
  String? customerCityName;
  String? plannedDate;
  String? plannedDateInterval;
  double? totalPrice;
  int? totalProductAmount;
  List<Product>? productList;
  Task({
    this.shopperOrderId,
    required this.externalOrderId,
    required this.orderSource,
    required this.orderType,
    required this.deliveryType,
    required this.customerId,
    required this.customerName,
    required this.customerCityId,
    required this.customerCityName,
    required this.plannedDate,
    required this.plannedDateInterval,
    required this.totalPrice,
    required this.totalProductAmount,
    required this.productList,
  });

  @override
  List<Object?> get props {
    return [
      shopperOrderId,
      externalOrderId,
      orderSource,
      orderType,
      deliveryType,
      customerId,
      customerName,
      customerCityId,
      customerCityName,
      plannedDate,
      plannedDateInterval,
      totalPrice,
      totalProductAmount,
      productList,
    ];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'shopperOrderId': shopperOrderId,
      'externalOrderId': externalOrderId,
      'orderSource': orderSource,
      'orderType': orderType,
      'deliveryType': deliveryType,
      'customerId': customerId,
      'customerName': customerName,
      'customerCityId': customerCityId,
      'customerCityName': customerCityName,
      'plannedDate': plannedDate,
      'plannedDateInterval': plannedDateInterval,
      'totalPrice': totalPrice,
      'totalProductAmount': totalProductAmount,
      'productList': productList?.map((x) => x.toMap()).toList(),
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      shopperOrderId: map['shopperOrderId'] as int?,
      externalOrderId: map['externalOrderId'] as String?,
      orderSource: map['orderSource'] as String?,
      orderType: map['orderType'] as String?,
      deliveryType: map['deliveryType'] as String?,
      customerId: map['customerId'] as int?,
      customerName: map['customerName'] as String?,
      customerCityId: map['customerCityId'] as int?,
      customerCityName: map['customerCityName'] as String?,
      plannedDate: map['plannedDate'] as String?,
      plannedDateInterval: map['plannedDateInterval'] as String?,
      totalPrice: map['totalPrice'] as double?,
      totalProductAmount: map['totalProductAmount'] as int?,
      productList: List<Product>.from(
        (map['productList']).map<Product>(
          (x) => Product.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(Map<String, dynamic> source) => Task.fromMap(source);
}

enum OrderStatus {
  PROCESSED,
  CANCELED,
  REJECTED,
  ACCEPTED,
  WAITING_FOR_SURCHARGE
}

enum OrderType { SUPERMARKET, GOODS, N }
