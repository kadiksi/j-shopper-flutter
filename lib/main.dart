import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:j_courier/repositories/login/auth_interceptor.dart';
import 'package:provider/provider.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'locale/locale_provider.dart';
import 'models/login/login_data_model.dart';
import 'models/login/tokens/login_token_model.dart';
import 'models/login/tokens/login_tokens_model.dart';
import 'models/vars.dart';
import 'repositories/list/list_abstarct_repository.dart';
import 'repositories/list/list_rpository.dart';
import 'repositories/login/login_abstarct_repository.dart';
import 'repositories/login/login_rpository.dart';
import 'courier_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);
  GetIt.I<Talker>().debug('Talker started...');

  await Hive.initFlutter();

  Hive.registerAdapter(LoginTokenModelAdapter());
  Hive.registerAdapter(LoginTokensModelAdapter());
  Hive.registerAdapter(LoginDataModelAdapter());

  await Hive.openBox<LoginDataModel>(tokenBoxName);

  GetIt.instance.registerLazySingleton<Box<LoginDataModel>>(
      () => Hive.box<LoginDataModel>(tokenBoxName));

  final dio = Dio();
  dio.interceptors.add(
    TalkerDioLogger(
      talker: talker,
      settings: const TalkerDioLoggerSettings(
          printResponseData: true, printRequestHeaders: true),
    ),
  );
  dio.interceptors.add(AuthInterceptor());

  Bloc.observer = TalkerBlocObserver(
    talker: talker,
    settings: const TalkerBlocLoggerSettings(
        // printStateFullData: false,
        // printEventFullData: false,
        ),
  );

  GetIt.I.registerLazySingleton<LoginAbstractRepository>(
    () => LoginRepository(dio: dio),
  );

  GetIt.I.registerLazySingleton<ListAbstractRepository>(
    () => ListRepository(dio: dio),
  );

  FlutterError.onError =
      (details) => GetIt.I<Talker>().handle(details.exception, details.stack);

  runZonedGuarded(
      () => runApp(ChangeNotifierProvider(
            create: (_) => LocaleProvider(),
            child: const CourierApp(),
          )), (e, st) {
    GetIt.I<Talker>().handle(e, st);
  });
}
