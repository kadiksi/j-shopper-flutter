import '../../models/ApiResponse';

abstract class ListAbstractRepository {
  Future<ApiResponse> getList();
  Future<ApiResponse> getOrder(int id);
  Future<ApiResponse> getOrderShelf();
}
