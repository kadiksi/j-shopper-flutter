// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:j_courier/models/tasks/processed/processed_product.dart';
import 'package:j_courier/models/tasks/task.dart';

part 'processed_task.g.dart';

@JsonSerializable()
// ignore: must_be_immutable
class ProcessedTask extends Equatable {
  int? shopperOrderId;
  String? externalOrderId;
  String? orderSource;
  // OrderType? orderType; //SUPERMARKET
  String? deliveryType; //J
  int? customerId;
  String? customerName;
  int? customerCityId;
  String? customerCityName;
  String? plannedDate;
  String? plannedDateInterval;
  int? totalPrice;
  int? totalProductAmount;
  ProcessedProduct? productList;
  ProcessedTask({
    this.shopperOrderId,
    this.externalOrderId,
    this.orderSource,
    // this.orderType,
    this.deliveryType,
    this.customerId,
    this.customerName,
    this.customerCityId,
    this.customerCityName,
    this.plannedDate,
    this.plannedDateInterval,
    this.totalPrice,
    this.totalProductAmount,
    this.productList,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'shopperOrderId': shopperOrderId,
      'externalOrderId': externalOrderId,
      'orderSource': orderSource,
      // 'orderType': orderType,
      'deliveryType': deliveryType,
      'customerId': customerId,
      'customerName': customerName,
      'customerCityId': customerCityId,
      'customerCityName': customerCityName,
      'plannedDate': plannedDate,
      'plannedDateInterval': plannedDateInterval,
      'totalPrice': totalPrice,
      'totalProductAmount': totalProductAmount,
      'productList': productList,
    };
  }

  factory ProcessedTask.fromMap(Map<String, dynamic> map) {
    return ProcessedTask(
      shopperOrderId:
          map['shopperOrderId'] != null ? map['shopperOrderId'] as int : null,
      externalOrderId: map['externalOrderId'] != null
          ? map['externalOrderId'] as String
          : null,
      orderSource:
          map['orderSource'] != null ? map['orderSource'] as String : null,
      // orderType:
      //     map['orderType'] != null ? map['orderType'] as OrderType : null,
      deliveryType:
          map['deliveryType'] != null ? map['deliveryType'] as String : null,
      customerId: map['customerId'] != null ? map['customerId'] as int : null,
      customerName:
          map['customerName'] != null ? map['customerName'] as String : null,
      customerCityId:
          map['customerCityId'] != null ? map['customerCityId'] as int : null,
      customerCityName: map['customerCityName'] != null
          ? map['customerCityName'] as String
          : null,
      plannedDate:
          map['plannedDate'] != null ? map['plannedDate'] as String : null,
      plannedDateInterval: map['plannedDateInterval'] != null
          ? map['plannedDateInterval'] as String
          : null,
      totalPrice: map['totalPrice'] != null ? map['totalPrice'] as int : null,
      totalProductAmount: map['totalProductAmount'] != null
          ? map['totalProductAmount'] as int
          : null,
      productList: map['productList'] != null
          ? ProcessedProduct.fromMap(map['productList'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProcessedTask.fromJson(Map<String, dynamic> source) =>
      ProcessedTask.fromMap(source);

  ProcessedTask copyWith({
    int? shopperOrderId,
    String? externalOrderId,
    String? orderSource,
    OrderType? orderType,
    String? deliveryType,
    int? customerId,
    String? customerName,
    int? customerCityId,
    String? customerCityName,
    String? plannedDate,
    String? plannedDateInterval,
    int? totalPrice,
    int? totalProductAmount,
    ProcessedProduct? productList,
  }) {
    return ProcessedTask(
      shopperOrderId: shopperOrderId ?? this.shopperOrderId,
      externalOrderId: externalOrderId ?? this.externalOrderId,
      orderSource: orderSource ?? this.orderSource,
      // orderType: orderType ?? this.orderType,
      deliveryType: deliveryType ?? this.deliveryType,
      customerId: customerId ?? this.customerId,
      customerName: customerName ?? this.customerName,
      customerCityId: customerCityId ?? this.customerCityId,
      customerCityName: customerCityName ?? this.customerCityName,
      plannedDate: plannedDate ?? this.plannedDate,
      plannedDateInterval: plannedDateInterval ?? this.plannedDateInterval,
      totalPrice: totalPrice ?? this.totalPrice,
      totalProductAmount: totalProductAmount ?? this.totalProductAmount,
      productList: productList ?? this.productList,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      shopperOrderId,
      externalOrderId,
      orderSource,
      // orderType,
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
}
