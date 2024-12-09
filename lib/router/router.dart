import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:j_courier/models/login/login_data_model.dart';
import 'package:j_courier/models/tasks/product.dart';
import 'package:j_courier/models/tasks/task.dart';
import 'package:j_courier/screens/order_screen/accepted/accepted_order_screen.dart';
import 'package:j_courier/screens/order_screen/active_order_screen.dart';
import 'package:j_courier/screens/order_screen/new/new_order_screen.dart';
import 'package:j_courier/screens/tabs_screen.dart';
import 'package:j_courier/screens/product_screen/product_screen.dart';
import 'package:j_courier/screens/login_screens/splash_screen.dart';

import '../screens/login_screens/choose_language_screen.dart';
import '../screens/login_screens/login_verification_screen.dart';
import '../screens/login_screens/login_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  final tokenBox = GetIt.instance<Box<LoginDataModel>>();

  @override
  RouteType get defaultRouteType =>
      const RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, path: "/"),
        AutoRoute(page: ChooseLanguageRoute.page, path: "/choose_language"),
        AutoRoute(page: LoginRoute.page, path: "/login"),
        AutoRoute(
            page: LoginVerificationRoute.page, path: "/login_verification"),
        // AutoRoute(page: ListRoute.page, path: "/tasks"),
        AutoRoute(page: TabsRoute.page, path: "/orders"),
        AutoRoute(page: NewOrderRoute.page, path: "/new_order"),
        AutoRoute(page: AcceptedOrderTabedRoute.page, path: "/accepted_order"),
        AutoRoute(page: ActiveOrderRoute.page, path: "/active_order"),
        AutoRoute(page: ProductRoute.page, path: "/product"),
      ];

  @override
  List<AutoRouteGuard> get guards => [];
}
