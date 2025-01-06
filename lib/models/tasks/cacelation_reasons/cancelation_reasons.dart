// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class CancelationReasons extends Equatable {
  final String? code;
  final String? name;
  final bool? is_commented;

  CancelationReasons(
      {required this.code, required this.name, required this.is_commented});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'name': name,
      'is_commented': is_commented,
    };
  }

  factory CancelationReasons.fromMap(Map<String, dynamic> map) {
    return CancelationReasons(
      code: map['code'] != null ? map['code'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      is_commented:
          map['is_commented'] != null ? map['is_commented'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CancelationReasons.fromJson(String source) =>
      CancelationReasons.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [code, name, is_commented];
}
