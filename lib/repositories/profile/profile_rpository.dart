import 'package:dio/dio.dart';
import 'package:j_courier/models/profile/profile.dart';
import 'package:j_courier/repositories/urls.dart';

import '../../models/ApiResponse';
import 'profile_abstarct_repository.dart';

class ProfileRepository implements ProfileAbstractRepository {
  ProfileRepository({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<ApiResponse> getProfile() async {
    try {
      final response =
          await dio.get('$test_url/jpost-shopper/api/v1/profile/info');

      final data = response.data as Map<String, dynamic>;

      Profile dataLogin = Profile.fromMap(data);
      SuccessResponse<Profile> su = SuccessResponse(dataLogin);
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

  @override
  Future<ApiResponse> registerToken(String token) async {
    try {
      Map<String, String> tokenMap = <String, String>{};
      tokenMap['token'] = token;
      final response = await dio.post(
          '$test_url/jpost-push/api/v1/token/register',
          queryParameters: tokenMap);

      final data = response.data.toString();
      SuccessResponse<String> su = SuccessResponse(data);
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

  @override
  Future<ApiResponse> getCallSupport() async {
    try {
      final response = await dio
          .post('$test_url/jpost-shopper/api/v1/call?addressee=SUPPORT');

      final data = response.data as String;
      SuccessResponse<String> su = SuccessResponse(data);

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
