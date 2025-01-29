import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:j_courier/repositories/dio_client.dart';
import 'package:j_courier/repositories/product/product_abstarct_repository.dart';
import 'package:j_courier/repositories/product/product_repository.dart';
import 'package:j_courier/repositories/profile/profile_abstarct_repository.dart';
import 'package:j_courier/repositories/profile/profile_rpository.dart';
import 'package:j_courier/repositories/urls.dart';
import 'package:j_courier/utils/token_utils.dart';
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
import 'repositories/list/list_repository.dart';
import 'repositories/login/login_abstarct_repository.dart';
import 'repositories/login/login_rpository.dart';
import 'courier_app.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  requestPermission();
  getToken();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Notification Title: ${message.notification?.title}');
      print('Notification Body: ${message.notification?.body}');
    }
  });

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

  final dio = DioClient('$test_url');
  dio.dio.interceptors.add(
    TalkerDioLogger(
      talker: talker,
      settings: const TalkerDioLoggerSettings(
          printResponseData: true, printRequestHeaders: true),
    ),
  );
  // dio.dio.interceptors.add(AuthInterceptor());

  Bloc.observer = TalkerBlocObserver(
    talker: talker,
    settings: const TalkerBlocLoggerSettings(
        // printStateFullData: false,
        // printEventFullData: false,
        ),
  );

  GetIt.I.registerLazySingleton<ProfileAbstractRepository>(
    () => ProfileRepository(dio: dio.dio),
  );

  GetIt.I.registerLazySingleton<LoginAbstractRepository>(
    () => LoginRepository(dio: dio.dio),
  );

  GetIt.I.registerLazySingleton<OrderAbstractRepository>(
    () => ListRepository(dio: dio.dio),
  );

  GetIt.I.registerLazySingleton<ProductAbstractRepository>(
    () => ProductRepository(dio: dio.dio),
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
