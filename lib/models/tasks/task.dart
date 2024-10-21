import 'package:equatable/equatable.dart';
import 'package:j_courier/models/tasks/address.dart';
import 'package:j_courier/models/tasks/contact.dart';
import 'package:j_courier/models/tasks/history.dart';
import 'package:j_courier/models/tasks/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable()
class Task extends Equatable {
  Task({
    required this.id,
    required this.createdDate,
    required this.userId,
    required this.status,
    required this.orderType,
    required this.interval,
    required this.creationDate,
    required this.closeDate,
    required this.instruction,
    required this.serviceId,
    required this.orderId,
    required this.externalOrderId,
    required this.orderSource,
    required this.jpostOrderId,
    required this.routeId,
    required this.nextSendTime,
    required this.finalRoute,
    required this.addressTo,
    required this.addressFrom,
    required this.contactTo,
    required this.contactFrom,
    required this.product,
    required this.histories,
    required this.actions,
    required this.cancellationTypes,
    required this.totalWeight,
  });

  final int id;
  final DateTime? createdDate;
  final int? userId;
  final String? status;
  final String? orderType;
  final dynamic interval;
  final dynamic creationDate;
  final dynamic closeDate;
  final dynamic instruction;
  final dynamic serviceId;
  final int? orderId;
  final String? externalOrderId;
  final String? orderSource;
  final int? jpostOrderId;
  final int? routeId;
  final dynamic nextSendTime;
  final bool? finalRoute;
  final Address? addressTo;
  final Address? addressFrom;
  final Contact? contactTo;
  final Contact? contactFrom;
  final List<Product>? product;
  final List<History>? histories;
  final List<dynamic>? actions;
  final dynamic cancellationTypes;
  final int? totalWeight;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);

  @override
  List<Object?> get props => [
        id,
        createdDate,
        userId,
        status,
        orderType,
        interval,
        creationDate,
        closeDate,
        instruction,
        serviceId,
        orderId,
        externalOrderId,
        orderSource,
        jpostOrderId,
        routeId,
        nextSendTime,
        finalRoute,
        addressTo,
        addressFrom,
        contactTo,
        contactFrom,
        product,
        histories,
        actions,
        cancellationTypes,
        totalWeight,
      ];
}
