import '../../models/ApiResponse';

abstract class ListAbstractRepository {
  Future<ApiResponse> getList();
}
