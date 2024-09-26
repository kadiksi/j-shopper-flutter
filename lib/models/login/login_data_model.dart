// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'tokens/login_tokens_model.dart';

part 'login_data_model.g.dart';

@HiveType(typeId: 5)
@JsonSerializable()
class LoginDataModel extends Equatable {
  const LoginDataModel({
    required this.tokens,
  });

  @HiveField(0)
  @JsonKey(name: 'tokens')
  final LoginTokensModel tokens;

  LoginDataModel copyWith({
    LoginTokensModel? tokens,
  }) {
    return LoginDataModel(
      tokens: tokens ?? this.tokens,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tokens': tokens.toMap(),
    };
  }

  factory LoginDataModel.fromMap(Map<String, dynamic> map) {
    return LoginDataModel(
      tokens: LoginTokensModel.fromMap(map['tokens'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginDataModel.fromJson(String source) =>
      LoginDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [tokens];
}
