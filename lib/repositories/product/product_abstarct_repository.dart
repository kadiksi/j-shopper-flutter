import 'package:j_courier/models/tasks/product.dart';

import '../../models/ApiResponse';

abstract class ProductAbstractRepository {
  Future<ApiResponse> getProductByText(String search);
  Future<ApiResponse> replaceProduct(int replacedProductid, Product product);
  Future<ApiResponse> changeProductStatus(
      List<Product> products, String status);
  Future<ApiResponse> addProduct(Product products, String externalOrderId);
}
