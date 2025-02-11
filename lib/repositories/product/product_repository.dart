import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:j_courier/models/tasks/product.dart';

import '../../models/ApiResponse';
import 'product_abstarct_repository.dart';

class ProductRepository implements ProductAbstractRepository {
  ProductRepository({
    required this.dio,
  });

  final Dio dio;
  Timer? timer;

  @override
  Future<ApiResponse> getProductByText(String search) async {
    timer?.cancel();
    timer = Timer(const Duration(seconds: 5), () async {});
    try {
      Map<String, dynamic> item = {'page': 1, 'size': 100, 'search': search};

      final response = await dio.get(
          'https://test5.jmart.kz/gw/jpost-shopper/api/v1/product/search',
          queryParameters: item);

      final data = response.data['data'] as List<dynamic>;

      final productList = data.map((e) {
        final details = Product.fromJson(e);
        return details;
      }).toList();

      SuccessResponse<List<Product>> su = SuccessResponse(productList);
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
  Future<ApiResponse> replaceProduct(
      int replacedProductid, Product product) async {
    timer?.cancel();
    timer = Timer(const Duration(seconds: 5), () async {});
    try {
      Map<String, dynamic> item = {
        'jmartProductId': product.jmartProductId,
        'productCode': product.productCode,
        'productName': product.productName,
        'imageUrl': product.imageUrl,
        'price': product.price,
        // 'quantity': product.quantity,
        'categoryIds': product.categoryIds,
        'orderProductType': product.orderProductType?.name.toString(),
      };
      final response = await dio.put(
          'https://test5.jmart.kz/gw/jpost-shopper/api/v1/product/${replacedProductid}/replace',
          data: jsonEncode(item));

      SuccessResponse<String> su = SuccessResponse(response.toString());
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
          // 'price': product.price,
          // 'quantity': product.quantity,
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

  @override
  Future<ApiResponse> addProduct(
      Product product, String externalOrderId) async {
    double price = 0;
    if (product.price! <= 0) {
      price = 1;
    } else {
      price = product.price!;
    }
    try {
      Map<String, dynamic> item = {
        'jmartProductId': product.jmartProductId,
        'productCode': product.productCode,
        'productName': product.productName,
        'imageUrl': product.imageUrl,
        'price': price,
        // 'quantity': product.quantity,
        'categoryIds': product.categoryIds,
        'orderProductType': product.orderProductType?.name
      };

      Map<String, dynamic> query = {
        'externalOrderId': externalOrderId,
      };
      final response = await dio.post(
          'https://test5.jmart.kz/gw/jpost-shopper/api/v1/product/add',
          data: jsonEncode(item),
          queryParameters: query);

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

  @override
  Future<ApiResponse> returnInitialProduct(Product product) async {
    try {
      final response = await dio.put(
          'https://test5.jmart.kz/gw/jpost-shopper/api/v1/product/${product.productId}/reset');

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

  @override
  Future<ApiResponse> callClient(String addressee, int shopperOrderId) async {
    try {
      Map<String, dynamic> query = {
        'addressee': addressee,
        'shopperOrderId': shopperOrderId
      };

      final response = await dio.post(
          'https://test5.jmart.kz/gw/jpost-shopper/api/v1/call',
          queryParameters: query);

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
