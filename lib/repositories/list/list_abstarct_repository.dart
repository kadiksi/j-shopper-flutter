import 'package:j_courier/models/tasks/product.dart';

import '../../models/ApiResponse';

abstract class OrderAbstractRepository {
  Future<ApiResponse> getNewList();
  Future<ApiResponse> getAcceptedList();
  Future<ApiResponse> getOrder(int id);
  Future<ApiResponse> getOrderShelf();
  Future<ApiResponse> getCancelationReason();
  Future<ApiResponse> changeProductStatus(
      List<Product> products, String status);
}
