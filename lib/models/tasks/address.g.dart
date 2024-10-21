// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      id: (json['id'] as num?)?.toInt(),
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      cityId: (json['cityId'] as num?)?.toInt(),
      address: json['address'] as String?,
      street: json['street'],
      streetAbr: json['streetAbr'],
      building: json['building'] as String?,
      flat: json['flat'] as String?,
      entrance: json['entrance'] as String?,
      floor: json['floor'] as String?,
      intercom: json['intercom'] as String?,
      description: json['description'],
      point: json['point'] == null
          ? null
          : Point.fromJson(json['point'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'id': instance.id,
      'createdDate': instance.createdDate?.toIso8601String(),
      'cityId': instance.cityId,
      'address': instance.address,
      'street': instance.street,
      'streetAbr': instance.streetAbr,
      'building': instance.building,
      'flat': instance.flat,
      'entrance': instance.entrance,
      'floor': instance.floor,
      'intercom': instance.intercom,
      'description': instance.description,
      'point': instance.point,
    };
