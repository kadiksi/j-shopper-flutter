// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:j_courier/models/profile/company_info.dart';
import 'package:j_courier/models/profile/support_info.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile extends Equatable {
  Profile({
    required this.companyInfoDto,
    required this.supportInfo,
  });

  final Company? companyInfoDto;
  final Support? supportInfo;

  @override
  List<Object?> get props => [
        companyInfoDto,
        supportInfo,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'companyInfoDto': companyInfoDto?.toMap(),
      'supportInfo': supportInfo?.toMap(),
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      companyInfoDto: map['companyInfoDto'] != null
          ? Company.fromMap(map['companyInfoDto'] as Map<String, dynamic>)
          : null,
      supportInfo: map['supportInfo'] != null
          ? Support.fromMap(map['supportInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) =>
      Profile.fromMap(json.decode(source) as Map<String, dynamic>);
}
