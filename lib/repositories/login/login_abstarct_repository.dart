import '../../models/ApiResponse';

abstract class LoginAbstractRepository {
  Future<ApiResponse> login(String login, String password);
}
