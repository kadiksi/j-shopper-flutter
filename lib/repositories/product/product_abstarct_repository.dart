import 'package:j_courier/models/tasks/product.dart';

import '../../models/ApiResponse';

abstract class ProductAbstractRepository {
  Future<ApiResponse> getProductByText(String search);
  Future<ApiResponse> replaceProduct(int replacedProductid, Product product);
}
