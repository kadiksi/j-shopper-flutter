// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'notification_title.g.dart';

@JsonSerializable()
class NotificationTitle extends Equatable {
  final String? EN;
  final String? KK;
  final String? RU;
  const NotificationTitle({
    required this.EN,
    required this.KK,
    required this.RU,
  });

  @override
  List<Object?> get props => [EN, KK, RU];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'EN': EN,
      'KK': KK,
      'RU': RU,
    };
  }

  factory NotificationTitle.fromMap(Map<String, dynamic> map) {
    return NotificationTitle(
      EN: map['EN'] as String,
      KK: map['KK'] as String,
      RU: map['RU'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationTitle.fromJson(String source) =>
      NotificationTitle.fromMap(json.decode(source) as Map<String, dynamic>);

  NotificationTitle copyWith({
    String? EN,
    String? KK,
    String? RU,
  }) {
    return NotificationTitle(
      EN: EN ?? this.EN,
      KK: KK ?? this.KK,
      RU: RU ?? this.RU,
    );
  }

  @override
  bool get stringify => true;
}
