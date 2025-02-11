// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: unused_element
Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      companyInfoDto: json['companyInfoDto'] == null
          ? null
          : Company.fromJson(json['companyInfoDto'] as String),
      supportInfo: json['supportInfo'] == null
          ? null
          : Support.fromJson(json['supportInfo'] as String),
    );

// ignore: unused_element
Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'companyInfoDto': instance.companyInfoDto,
      'supportInfo': instance.supportInfo,
    };
