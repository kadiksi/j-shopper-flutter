// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskDataModel _$TaskDataModelFromJson(Map<String, dynamic> json) =>
    TaskDataModel(
      id: json['id'] as String,
      userId: (json['userId'] as num).toInt(),
      orderSource: json['orderSource'] as String,
      createdDate: DateTime.parse(json['createdDate'] as String),
    );

Map<String, dynamic> _$TaskDataModelToJson(TaskDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'orderSource': instance.orderSource,
      'createdDate': instance.createdDate.toIso8601String(),
    };
