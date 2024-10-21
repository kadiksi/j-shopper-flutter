// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contact _$ContactFromJson(Map<String, dynamic> json) => Contact(
      id: (json['id'] as num?)?.toInt(),
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      companyName: json['companyName'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      comments: json['comments'],
      dateFrom: json['dateFrom'] == null
          ? null
          : DateTime.parse(json['dateFrom'] as String),
      dateTo: json['dateTo'] == null
          ? null
          : DateTime.parse(json['dateTo'] as String),
      workingTime: json['workingTime'],
      workSchedule: json['workSchedule'] as List<dynamic>?,
    );

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'id': instance.id,
      'createdDate': instance.createdDate?.toIso8601String(),
      'companyName': instance.companyName,
      'name': instance.name,
      'phone': instance.phone,
      'comments': instance.comments,
      'dateFrom': instance.dateFrom?.toIso8601String(),
      'dateTo': instance.dateTo?.toIso8601String(),
      'workingTime': instance.workingTime,
      'workSchedule': instance.workSchedule,
    };
