import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../models/login/login_data_model.dart';
import '../../models/vars.dart';

class AuthInterceptor extends Interceptor {
  final tokenBox = GetIt.instance<Box<LoginDataModel>>();
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String? token = tokenBox.get(tokenModelName)?.tokens.auth.token;
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] =
          'Bearer ${tokenBox.get(tokenModelName)?.tokens.auth.token}';
      options.headers['Content-Type'] = 'application/json; charset=utf-8';
    }
    print('Request2: ${options.method} ${options.headers}');
    super.onRequest(options, handler);
  }
}
