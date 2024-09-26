import 'package:auto_route/auto_route.dart';

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
        AutoRoute(page: LoginRoute.page, path: "/"),
        AutoRoute(page: ListRoute.page, path: "/tasks"),
        // AutoRoute(
        //   page: CryptoListRoute.page,
        // ),
        // AutoRoute(page: CryptoCoinRoute.page),
      ];

  @override
  List<AutoRouteGuard> get guards => [
        // optionally add root guards here
      ];
}
