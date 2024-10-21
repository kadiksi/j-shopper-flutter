// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      id: (json['id'] as num).toInt(),
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      userId: (json['userId'] as num?)?.toInt(),
      status: json['status'] as String?,
      orderType: json['orderType'] as String?,
      interval: json['interval'],
      creationDate: json['creationDate'],
      closeDate: json['closeDate'],
      instruction: json['instruction'],
      serviceId: json['serviceId'],
      orderId: (json['orderId'] as num?)?.toInt(),
      externalOrderId: json['externalOrderId'] as String?,
      orderSource: json['orderSource'] as String?,
      jpostOrderId: (json['jpostOrderId'] as num?)?.toInt(),
      routeId: (json['routeId'] as num?)?.toInt(),
      nextSendTime: json['nextSendTime'],
      finalRoute: json['finalRoute'] as bool?,
      addressTo: json['addressTo'] == null
          ? null
          : Address.fromJson(json['addressTo'] as Map<String, dynamic>),
      addressFrom: json['addressFrom'] == null
          ? null
          : Address.fromJson(json['addressFrom'] as Map<String, dynamic>),
      contactTo: json['contactTo'] == null
          ? null
          : Contact.fromJson(json['contactTo'] as Map<String, dynamic>),
      contactFrom: json['contactFrom'] == null
          ? null
          : Contact.fromJson(json['contactFrom'] as Map<String, dynamic>),
      product: (json['product'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      histories: (json['histories'] as List<dynamic>?)
          ?.map((e) => History.fromJson(e as Map<String, dynamic>))
          .toList(),
      actions: json['actions'] as List<dynamic>?,
      cancellationTypes: json['cancellationTypes'],
      totalWeight: (json['totalWeight'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'createdDate': instance.createdDate?.toIso8601String(),
      'userId': instance.userId,
      'status': instance.status,
      'orderType': instance.orderType,
      'interval': instance.interval,
      'creationDate': instance.creationDate,
      'closeDate': instance.closeDate,
      'instruction': instance.instruction,
      'serviceId': instance.serviceId,
      'orderId': instance.orderId,
      'externalOrderId': instance.externalOrderId,
      'orderSource': instance.orderSource,
      'jpostOrderId': instance.jpostOrderId,
      'routeId': instance.routeId,
      'nextSendTime': instance.nextSendTime,
      'finalRoute': instance.finalRoute,
      'addressTo': instance.addressTo,
      'addressFrom': instance.addressFrom,
      'contactTo': instance.contactTo,
      'contactFrom': instance.contactFrom,
      'product': instance.product,
      'histories': instance.histories,
      'actions': instance.actions,
      'cancellationTypes': instance.cancellationTypes,
      'totalWeight': instance.totalWeight,
    };
