// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'support_info.g.dart';

@JsonSerializable()
class Support extends Equatable {
  Support({
    required this.whatsApp,
    required this.call,
  });

  final String? whatsApp;
  final String? call;

  @override
  List<Object?> get props => [
        whatsApp,
        call,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'whatsApp': whatsApp,
      'call': call,
    };
  }

  factory Support.fromMap(Map<String, dynamic> map) {
    return Support(
      whatsApp: map['whatsApp'] != null ? map['whatsApp'] as String : null,
      call: map['call'] != null ? map['call'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Support.fromJson(String source) =>
      Support.fromMap(json.decode(source) as Map<String, dynamic>);
}
