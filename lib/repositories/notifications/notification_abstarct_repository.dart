import '../../models/ApiResponse';

abstract class NotificationAbstractRepository {
  Future<ApiResponse> getNotificationList();
  Future<ApiResponse> markAsRead(List<int> notificationIds);
}
