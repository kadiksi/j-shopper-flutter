import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:j_courier/models/login/login_data_model.dart';
import 'package:j_courier/models/vars.dart';

class DioClient {
  late Dio _dio;
  String? accessToken;
  String? refreshToken;

  DioClient(String baseUrl) {
    _dio = Dio(BaseOptions(baseUrl: baseUrl));
    final tokenBox = GetIt.instance<Box<LoginDataModel>>();

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          accessToken = tokenBox.get(tokenModelName)?.tokens.auth.token;
          if (accessToken != null && accessToken!.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer ${accessToken}';
            options.headers['Content-Type'] = 'application/json; charset=utf-8';
          }
          // print('Request2: ${options.method} ${options.headers}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // _refreshToken();
          return handler.next(response);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            try {
              await _refreshToken();

              final retryRequest = await _retry(error.requestOptions);
              return handler.resolve(retryRequest);
            } catch (e) {
              return handler.reject(error);
            }
          }
          return handler.next(error);
        },
      ),
    );
  }

  Future<Response> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return _dio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  Future<void> _refreshToken() async {
    final tokenBox = GetIt.instance<Box<LoginDataModel>>();
    refreshToken = tokenBox.get(tokenModelName)?.tokens.refresh.token;
    try {
      final options = Options(
        headers: {
          'Authorization': '',
          'Accept': 'application/json',
          'Cache-Control': 'no-cache',
        },
      );

      final response = await _dio.post('/user/v1/auth/refresh',
          data: {'token': refreshToken}, options: options);
      final data = response.data as Map<String, dynamic>;
      final dataRaw = data['data'] as Map<String, dynamic>;

      LoginDataModel dataLogin = LoginDataModel.fromMap(dataRaw);
      tokenBox.put(tokenModelName, dataLogin);
    } catch (e) {
      throw Exception('Failed to refresh token');
    }
  }

  Dio get dio => _dio;
}
