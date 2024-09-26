import 'package:dio/dio.dart';

import '../../models/ApiResponse';
import '../../models/tasks/task_data_model.dart';
import 'list_abstarct_repository.dart';

class ListRepository implements ListAbstractRepository {
  ListRepository({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<ApiResponse> getList() async {
    // try {
    final response = await dio
        .get('https://test5.jmart.kz/gw/jpost-courier/api/public/v1/task');

    final data = response.data as List<dynamic>;

    final cryptoCoinsList = data.map((e) {
      final details = TaskDataModel.fromJson(e);
      return details;
    }).toList();

    SuccessResponse<List<TaskDataModel>> su = SuccessResponse(cryptoCoinsList);
    return su;
    // } catch (e) {
    //   if (e is DioException) {
    //     print("type: ${e.response?.data.runtimeType} ///${e.response?.data}");
    //     if (e.response?.data['data'] == null) {
    //       return ErrorResponse(e.response?.data['message']);
    //     } else {
    //       return ErrorResponse(e.response?.data['data']['message']);
    //     }
    //   }
    //   return ErrorResponse(e.toString());
    // }
  }
}
