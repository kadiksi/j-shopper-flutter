import 'dart:async';

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
    try {
      timer?.cancel();
      timer = Timer(Duration(seconds: 5), () async {});
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
}
