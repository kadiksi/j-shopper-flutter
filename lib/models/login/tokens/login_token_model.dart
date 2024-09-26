// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_token_model.g.dart';

@HiveType(typeId: 3)
@JsonSerializable()
class LoginTokenModel extends Equatable {
  const LoginTokenModel({
    required this.token,
    required this.issued,
    required this.expired,
  });

  @HiveField(0)
  @JsonKey(name: 'token')
  final String token;
  @HiveField(1)
  @JsonKey(name: 'issued')
  final String issued;
  @HiveField(2)
  @JsonKey(name: 'expired')
  final String expired;

  LoginTokenModel copyWith({
    String? token,
    String? issued,
    String? expired,
  }) {
    return LoginTokenModel(
      token: token ?? this.token,
      issued: issued ?? this.issued,
      expired: expired ?? this.expired,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'issued': issued,
      'expired': expired,
    };
  }

  factory LoginTokenModel.fromMap(Map<String, dynamic> map) {
    return LoginTokenModel(
      token: map['token'] as String,
      issued: map['issued'] as String,
      expired: map['expired'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginTokenModel.fromJson(String source) =>
      LoginTokenModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [token, issued, expired];
}
