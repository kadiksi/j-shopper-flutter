// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:j_courier/models/notifications/notification_title.dart';

part 'user_notification.g.dart';

@JsonSerializable()
class UserNotification extends Equatable {
  final int? id;
  final String? createdDate;
  final int? userId;
  final NotificationTitle? title;
  final NotificationTitle? message;
  final bool? isRead;
  const UserNotification({
    this.id,
    this.createdDate,
    this.userId,
    this.title,
    this.message,
    this.isRead,
  });

  @override
  List<Object?> get props {
    return [
      id,
      createdDate,
      userId,
      title,
      message,
      isRead,
    ];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'createdDate': createdDate,
      'userId': userId,
      'title': title?.toMap(),
      'message': message?.toMap(),
      'isRead': isRead,
    };
  }

  factory UserNotification.fromMap(Map<String, dynamic> map) {
    return UserNotification(
      id: map['id'] != null ? map['id'] as int : null,
      createdDate:
          map['createdDate'] != null ? map['createdDate'] as String : null,
      userId: map['userId'] != null ? map['userId'] as int : null,
      title: map['title'] != null
          ? NotificationTitle.fromMap(map['title'] as Map<String, dynamic>)
          : null,
      message: map['message'] != null
          ? NotificationTitle.fromMap(map['message'] as Map<String, dynamic>)
          : null,
      isRead: map['isRead'] != null ? map['isRead'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserNotification.fromJson(Map<String, dynamic> source) =>
      UserNotification.fromMap(source);

  UserNotification copyWith({
    int? id,
    String? createdDate,
    int? userId,
    NotificationTitle? title,
    NotificationTitle? message,
    bool? isRead,
  }) {
    return UserNotification(
      id: id ?? this.id,
      createdDate: createdDate ?? this.createdDate,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      message: message ?? this.message,
      isRead: isRead ?? this.isRead,
    );
  }

  @override
  bool get stringify => true;
}

List<int> getIds(List<UserNotification> notifications) {
  List<int> list = [];
  notifications.forEach((notification) {
    list.add(notification.id!);
  });
  return list;
}
