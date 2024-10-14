import 'package:auto_route/auto_route.dart';
import 'package:j_courier/screens/orders_screen/tabs_screen.dart';
import 'package:j_courier/screens/splash_screen.dart';

import '../screens/choose_language_screen.dart';
import '../screens/login_verification_screen.dart';
import '../screens/list_screen.dart';
import '../screens/login_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
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
        AutoRoute(page: ListRoute.page, path: "/tasks"),
        AutoRoute(page: TabsRoute.page, path: "/orders"),
      ];

  @override
  List<AutoRouteGuard> get guards => [
        // optionally add root guards here
      ];
}
