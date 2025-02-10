// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'processed_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: unused_element
ProcessedTask _$ProcessedTaskFromJson(Map<String, dynamic> json) =>
    ProcessedTask(
      shopperOrderId: (json['shopperOrderId'] as num?)?.toInt(),
      externalOrderId: json['externalOrderId'] as String?,
      orderSource: json['orderSource'] as String?,
      deliveryType: json['deliveryType'] as String?,
      customerId: (json['customerId'] as num?)?.toInt(),
      customerName: json['customerName'] as String?,
      customerCityId: (json['customerCityId'] as num?)?.toInt(),
      customerCityName: json['customerCityName'] as String?,
      plannedDate: json['plannedDate'] as String?,
      plannedDateInterval: json['plannedDateInterval'] as String?,
      totalPrice: (json['totalPrice'] as num?)?.toInt(),
      totalProductAmount: (json['totalProductAmount'] as num?)?.toInt(),
      productList: json['productList'] == null
          ? null
          : ProcessedProduct.fromJson(json['productList'] as String),
    );

// ignore: unused_element
Map<String, dynamic> _$ProcessedTaskToJson(ProcessedTask instance) =>
    <String, dynamic>{
      'shopperOrderId': instance.shopperOrderId,
      'externalOrderId': instance.externalOrderId,
      'orderSource': instance.orderSource,
      'deliveryType': instance.deliveryType,
      'customerId': instance.customerId,
      'customerName': instance.customerName,
      'customerCityId': instance.customerCityId,
      'customerCityName': instance.customerCityName,
      'plannedDate': instance.plannedDate,
      'plannedDateInterval': instance.plannedDateInterval,
      'totalPrice': instance.totalPrice,
      'totalProductAmount': instance.totalProductAmount,
      'productList': instance.productList,
    };
