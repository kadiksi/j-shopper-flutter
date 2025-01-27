import '../../models/ApiResponse';

abstract class ProfileAbstractRepository {
  Future<ApiResponse> getProfile();
  Future<ApiResponse> getCallSupport();
  Future<ApiResponse> registerToken(String token);
}
