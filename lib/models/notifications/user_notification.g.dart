// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserNotification _$UserNotificationFromJson(Map<String, dynamic> json) =>
    UserNotification(
      id: (json['id'] as num?)?.toInt(),
      createdDate: json['createdDate'] as String?,
      userId: (json['userId'] as num?)?.toInt(),
      title: json['title'] == null
          ? null
          : NotificationTitle.fromJson(json['title'] as String),
      message: json['message'] == null
          ? null
          : NotificationTitle.fromJson(json['message'] as String),
      isRead: json['isRead'] as bool?,
    );

Map<String, dynamic> _$UserNotificationToJson(UserNotification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdDate': instance.createdDate,
      'userId': instance.userId,
      'title': instance.title,
      'message': instance.message,
      'isRead': instance.isRead,
    };
