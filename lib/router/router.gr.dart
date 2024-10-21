// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [ChooseLanguageScreen]
class ChooseLanguageRoute extends PageRouteInfo<void> {
  const ChooseLanguageRoute({List<PageRouteInfo>? children})
      : super(
          ChooseLanguageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChooseLanguageRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ChooseLanguageScreen();
    },
  );
}

/// generated route for
/// [ListScreen]
class ListRoute extends PageRouteInfo<void> {
  const ListRoute({List<PageRouteInfo>? children})
      : super(
          ListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ListScreen();
    },
  );
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginScreen();
    },
  );
}

/// generated route for
/// [LoginVerificationScreen]
class LoginVerificationRoute extends PageRouteInfo<void> {
  const LoginVerificationRoute({List<PageRouteInfo>? children})
      : super(
          LoginVerificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginVerificationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginVerificationScreen();
    },
  );
}

/// generated route for
/// [OrderScreen]
class OrderRoute extends PageRouteInfo<OrderRouteArgs> {
  OrderRoute({
    Key? key,
    required Task task,
    List<PageRouteInfo>? children,
  }) : super(
          OrderRoute.name,
          args: OrderRouteArgs(
            key: key,
            task: task,
          ),
          initialChildren: children,
        );

  static const String name = 'OrderRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OrderRouteArgs>();
      return OrderScreen(
        key: args.key,
        task: args.task,
      );
    },
  );
}

class OrderRouteArgs {
  const OrderRouteArgs({
    this.key,
    required this.task,
  });

  final Key? key;

  final Task task;

  @override
  String toString() {
    return 'OrderRouteArgs{key: $key, task: $task}';
  }
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashScreen();
    },
  );
}

/// generated route for
/// [TabsScreen]
class TabsRoute extends PageRouteInfo<void> {
  const TabsRoute({List<PageRouteInfo>? children})
      : super(
          TabsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TabsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TabsScreen();
    },
  );
}
