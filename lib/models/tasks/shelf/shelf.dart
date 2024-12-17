// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Shelf extends Equatable {
  final int? id;
  final String? shelf_name;
  final int? priority;

  Shelf({required this.id, required this.shelf_name, required this.priority});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'shelf_name': shelf_name,
      'priority': priority,
    };
  }

  factory Shelf.fromMap(Map<String, dynamic> map) {
    return Shelf(
      id: map['id'] != null ? map['id'] as int : null,
      shelf_name:
          map['shelf_name'] != null ? map['shelf_name'] as String : null,
      priority: map['priority'] != null ? map['priority'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Shelf.fromJson(String source) =>
      Shelf.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [id, shelf_name, priority];
}
