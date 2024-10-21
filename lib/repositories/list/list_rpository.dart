import 'package:dio/dio.dart';
import 'package:j_courier/models/tasks/task.dart';

import '../../models/ApiResponse';
import 'list_abstarct_repository.dart';

class ListRepository implements ListAbstractRepository {
  ListRepository({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<ApiResponse> getList() async {
    try {
      final response = await dio
          .get('https://test5.jmart.kz/gw/jpost-courier/api/public/v1/task');

      final data = response.data as List<dynamic>;

      final taskList = data.map((e) {
        final details = Task.fromJson(e);
        return details;
      }).toList();

      SuccessResponse<List<Task>> su = SuccessResponse(taskList);
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

  @override
  Future<ApiResponse> getOrder(int id) async {
    try {
      final response = await dio.get(
          'https://test5.jmart.kz/gw/jpost-courier/api/public/v1/task/${id}');

      final data = response.data as dynamic;
      final details = Task.fromJson(data);

      SuccessResponse<Task> su = SuccessResponse(details);
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
