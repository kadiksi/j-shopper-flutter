// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

import 'login_token_model.dart';

part 'login_tokens_model.g.dart';

@HiveType(typeId: 4)
@JsonSerializable()
class LoginTokensModel extends Equatable {
  const LoginTokensModel({
    required this.auth,
    required this.refresh,
  });

  @HiveField(0)
  @JsonKey(name: 'auth')
  final LoginTokenModel auth;

  @HiveField(1)
  @JsonKey(name: 'refresh')
  final LoginTokenModel refresh;

  LoginTokensModel copyWith({
    LoginTokenModel? auth,
    LoginTokenModel? refresh,
  }) {
    return LoginTokensModel(
      auth: auth ?? this.auth,
      refresh: refresh ?? this.refresh,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'auth': auth.toMap(),
      'refresh': refresh.toMap(),
    };
  }

  factory LoginTokensModel.fromMap(Map<String, dynamic> map) {
    return LoginTokensModel(
      auth: LoginTokenModel.fromMap(map['auth'] as Map<String, dynamic>),
      refresh: LoginTokenModel.fromMap(map['refresh'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginTokensModel.fromJson(String source) =>
      LoginTokensModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [auth, refresh];
}
