import 'package:dio/dio.dart';
import 'package:j_courier/models/notifications/user_notification.dart';

import '../../models/ApiResponse';
import 'notification_abstarct_repository.dart';

class NotificationRepository implements NotificationAbstractRepository {
  NotificationRepository({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<ApiResponse> getNotificationList() async {
    try {
      Map<String, dynamic> item = {
        'page': 0,
        'size': 15,
        'sort': ['createdDate,DESC'],
      };

      final response = await dio.get(
          'https://test5.jmart.kz/gw/jpost-push/api/v1/push/list/by-userId',
          queryParameters: item);

      final data = response.data['content'] as List<dynamic>;

      final taskList = data.map((e) {
        final details = UserNotification.fromJson(e);
        return details;
      }).toList();

      SuccessResponse<List<UserNotification>> su = SuccessResponse(taskList);
      return su;
    } catch (e) {
      if (e is DioException) {
        print("type: ${e.response?.data.runtimeType} ///${e.response?.data}");
        if (e.response?.data['data'] == null) {
          return ErrorResponse(e.response?.data['message']);
        } else {
          return ErrorResponse(e.response?.data['data']['message']);
        }
      }
      return ErrorResponse(e.toString());
    }
  }
}
