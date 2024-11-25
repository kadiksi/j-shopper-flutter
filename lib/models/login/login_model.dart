// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel extends Equatable {
  const LoginModel({
    required this.login,
    required this.password,
    // required this.userType,
  });

  @JsonKey(name: 'login')
  final String login;

  @JsonKey(name: 'password')
  final String password;

  // @JsonKey(name: 'user_type')
  // final String userType;

  @override
  List<Object> get props => [
        login,
        password,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'login': login,
      'password': password,
      // 'userType': userType,
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      login: map['login'] as String,
      password: map['password'] as String,
      // userType: map['userType'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) =>
      LoginModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
