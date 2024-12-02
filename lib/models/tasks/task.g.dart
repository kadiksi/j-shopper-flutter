// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      externalOrderId: json['externalOrderId'] as String?,
      orderSource: json['orderSource'] as String?,
      orderType: json['orderType'] as String?,
      deliveryType: json['deliveryType'] as String?,
      customerId: (json['customerId'] as num?)?.toInt(),
      customerName: json['customerName'] as String?,
      customerCityId: (json['customerCityId'] as num?)?.toInt(),
      customerCityName: json['customerCityName'] as String?,
      plannedDate: json['plannedDate'] as String?,
      plannedDateInterval: json['plannedDateInterval'] as String?,
      totalPrice: (json['totalPrice'] as num?)?.toInt(),
      totalProductAmount: (json['totalProductAmount'] as num?)?.toInt(),
      productList: (json['productList'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as String))
          .toList(),
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'externalOrderId': instance.externalOrderId,
      'orderSource': instance.orderSource,
      'orderType': instance.orderType,
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
