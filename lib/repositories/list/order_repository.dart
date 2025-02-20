import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:j_courier/models/tasks/cacelation_reasons/cancelation_reasons.dart';
import 'package:j_courier/models/tasks/processed/processed_task.dart';
import 'package:j_courier/models/tasks/shelf/shelf.dart';
import 'package:j_courier/models/tasks/task.dart';

import '../../models/ApiResponse';
import 'order_abstarct_repository.dart';

class ListRepository implements OrderAbstractRepository {
  ListRepository({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<ApiResponse> getNewList() async {
    try {
      Map<String, dynamic> item = {
        'page': 0,
        'size': 100,
        'sort': ['string'],
      };

      final response = await dio.get(
          'https://test5.jmart.kz/gw/jpost-shopper/api/v1/order/new/list',
          queryParameters: item);

      final data = response.data['data'] as List<dynamic>;

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
  Future<ApiResponse> getNewOrder(int id) async {
    try {
      final response = await dio.get(
          'https://test5.jmart.kz/gw/jpost-shopper/api/v1/order/new/${id}');

      final data = response.data['data'] as dynamic;
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

  @override
  Future<ApiResponse> acceptNewOrder(List<int> externalOrderId) async {
    try {
      final response = await dio.post(
          'https://test5.jmart.kz/gw/jpost-shopper/api/v1/order/accept',
          data: jsonEncode(externalOrderId));

      final data = response.data['data'] as dynamic;
      // final details = Task.fromJson(data);

      SuccessResponse<List<dynamic>> su = SuccessResponse(data);
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
  Future<ApiResponse> getAcceptedList() async {
    try {
      final response = await dio.get(
          'https://test5.jmart.kz/gw/jpost-shopper/api/v1/order/accepted/list');

      final data = response.data['data'] as List<dynamic>;

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
  Future<ApiResponse> getAcceptedOrder(int id) async {
    try {
      final response = await dio.get(
          'https://test5.jmart.kz/gw/jpost-shopper/api/v1/order/accepted/${id}');

      final data = response.data['data'] as dynamic;
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

  @override
  Future<ApiResponse> getProcessedOrder(int id) async {
    try {
      final response = await dio.get(
          'https://test5.jmart.kz/gw/jpost-shopper/api/v1/order/processed/${id}');

      final data = response.data['data'] as dynamic;
      final details = ProcessedTask.fromJson(data);

      SuccessResponse<ProcessedTask> su = SuccessResponse(details);
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
  Future<ApiResponse> getActiveList(bool isFinished) async {
    try {
      Map<String, dynamic> body = {
        'isFinished': isFinished,
      };

      final response = await dio.post(
          'https://test5.jmart.kz/gw/jpost-shopper/api/v1/order/processed/list',
          data: jsonEncode(body));

      final data = response.data['data'] as List<dynamic>;

      final taskList = data.map((e) {
        final details = ProcessedTask.fromJson(e);
        return details;
      }).toList();

      SuccessResponse<List<ProcessedTask>> su = SuccessResponse(taskList);
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
  Future<ApiResponse> getOrderShelf() async {
    try {
      final response = await dio
          .get('https://test5.jmart.kz/gw/jpost-shopper/api/v1/shelf/list');

      final data = response.data as List<dynamic>;

      final shelfList = data.map((e) {
        final details = Shelf.fromMap(e);
        return details;
      }).toList();

      SuccessResponse<List<Shelf>> su = SuccessResponse(shelfList);
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
  Future<ApiResponse> getCancelationReason() async {
    try {
      final response = await dio.get(
          'https://test5.jmart.kz/gw/jpost-shopper/api/v1/order/cancel-reason/list');

      final data = response.data['data'] as List<dynamic>;

      final shelfList = data.map((e) {
        final details = CancelationReasons.fromMap(e);
        return details;
      }).toList();

      SuccessResponse<List<CancelationReasons>> su = SuccessResponse(shelfList);
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
  Future<ApiResponse> changeOrderStatus(
      String externalOrderId,
      OrderStatus status,
      String? cancellationReason,
      String? cancellationReasonOther) async {
    try {
      // List<Map<String, dynamic>> body = [];

      Map<String, dynamic> item = {
        'status': status.name,
        // 'cancellationReason': cancellationReason,
        // 'cancellationReasonOther': cancellationReasonOther,
      };
      if (cancellationReason != null && cancellationReason.isNotEmpty) {
        item['cancellationReason'] = cancellationReason;
        item['cancellationReasonOther'] = cancellationReasonOther;
      }
      // body.add(item);
      final response = await dio.put(
          'https://test5.jmart.kz/gw/jpost-shopper/api/v1/order/${externalOrderId}/status',
          data: jsonEncode(item));

      final data = response.data as dynamic;

      SuccessResponse<String> su = SuccessResponse(data);
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
