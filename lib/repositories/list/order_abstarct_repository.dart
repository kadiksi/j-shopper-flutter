import 'package:j_courier/models/tasks/product.dart';
import 'package:j_courier/models/tasks/task.dart';

import '../../models/ApiResponse';

abstract class OrderAbstractRepository {
  Future<ApiResponse> getNewList();
  Future<ApiResponse> getNewOrder(int id);
  Future<ApiResponse> acceptNewOrder(List<int> externalOrderId);
  Future<ApiResponse> getAcceptedList();
  Future<ApiResponse> getAcceptedOrder(int id);
  Future<ApiResponse> getProcessedOrder(int id);
  Future<ApiResponse> getActiveList(bool isFinished);
  Future<ApiResponse> getOrderShelf();
  Future<ApiResponse> getCancelationReason();
  Future<ApiResponse> changeOrderStatus(
      String externalOrderId,
      OrderStatus status,
      String? cancellationReason,
      String? cancellationReasonOther);
  Future<ApiResponse> changeProductStatus(
      List<Product> products, String status);
  Future<ApiResponse> addProduct(Product products, String externalOrderId);
}
