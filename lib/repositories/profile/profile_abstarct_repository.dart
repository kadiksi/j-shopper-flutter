import '../../models/ApiResponse';

abstract class ProfileAbstractRepository {
  Future<ApiResponse> getProfile();
  Future<ApiResponse> getOrder(int id);
}
