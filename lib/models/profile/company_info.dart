// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company_info.g.dart';

@JsonSerializable()
class Company extends Equatable {
  Company({
    required this.companyName,
    required this.companyAddress,
  });

  final String? companyName;
  final String? companyAddress;

  @override
  List<Object?> get props => [
        companyName,
        companyAddress,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'companyName': companyName,
      'companyAddress': companyAddress,
    };
  }

  factory Company.fromMap(Map<String, dynamic> map) {
    return Company(
      companyName:
          map['companyName'] != null ? map['companyName'] as String : null,
      companyAddress: map['companyAddress'] != null
          ? map['companyAddress'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Company.fromJson(String source) =>
      Company.fromMap(json.decode(source) as Map<String, dynamic>);
}
