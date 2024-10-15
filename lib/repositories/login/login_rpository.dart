import 'package:dio/dio.dart';

import '../../models/ApiResponse';
import '../../models/login/login_data_model.dart';
import '../../models/login/login_model.dart';
import 'login_abstarct_repository.dart';

class LoginRepository implements LoginAbstractRepository {
  LoginRepository({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<ApiResponse> login(String login, String password) async {
    try {
      final response = await dio.post(
          'https://test5.jmart.kz/gw/user/v1/auth/sign-in',
          data: const LoginModel(
                  login: '+7(707)217-69-64',
                  password: 'Adilet29187',
                  userType: "K")
              .toJson());

      final data = response.data as Map<String, dynamic>;
      final dataRaw = data['data'] as Map<String, dynamic>;

      LoginDataModel dataLogin = LoginDataModel.fromMap(dataRaw);
      SuccessResponse<LoginDataModel> su = SuccessResponse(dataLogin);
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
