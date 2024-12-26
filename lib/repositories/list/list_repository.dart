import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:j_courier/models/tasks/product.dart';
import 'package:j_courier/models/tasks/shelf/shelf.dart';
import 'package:j_courier/models/tasks/task.dart';

import '../../models/ApiResponse';
import 'list_abstarct_repository.dart';

class ListRepository implements OrderAbstractRepository {
  ListRepository({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<ApiResponse> getNewList() async {
    try {
      Map<String, dynamic> item = {
        'page': 1,
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
  Future<ApiResponse> getOrder(int id) async {
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
  Future<ApiResponse> changeProductStatus(
      List<Product> products, String status) async {
    try {
      List<Map<String, dynamic>> body = [];
      products.forEach((product) {
        Map<String, dynamic> item = {
          'productId': product.productId,
          'price': product.price,
          'quantity': product.quantity,
          'status': status
        };
        body.add(item);
      });
      final response = await dio.put(
          'https://test5.jmart.kz/gw/jpost-shopper/api/v1/product/status/update',
          data: jsonEncode(body));

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
