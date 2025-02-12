import '../../models/ApiResponse';

abstract class NotificationAbstractRepository {
  Future<ApiResponse> getNotificationList();
}
