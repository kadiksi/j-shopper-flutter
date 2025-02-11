// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [AcceptedOrderTabedScreen]
class AcceptedOrderTabedRoute
    extends PageRouteInfo<AcceptedOrderTabedRouteArgs> {
  AcceptedOrderTabedRoute({
    Key? key,
    required Task task,
    List<PageRouteInfo>? children,
  }) : super(
          AcceptedOrderTabedRoute.name,
          args: AcceptedOrderTabedRouteArgs(
            key: key,
            task: task,
          ),
          initialChildren: children,
        );

  static const String name = 'AcceptedOrderTabedRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AcceptedOrderTabedRouteArgs>();
      return AcceptedOrderTabedScreen(
        key: args.key,
        task: args.task,
      );
    },
  );
}

class AcceptedOrderTabedRouteArgs {
  const AcceptedOrderTabedRouteArgs({
    this.key,
    required this.task,
  });

  final Key? key;

  final Task task;

  @override
  String toString() {
    return 'AcceptedOrderTabedRouteArgs{key: $key, task: $task}';
  }
}

/// generated route for
/// [AcceptedOrders]
// class AcceptedOrders extends PageRouteInfo<void> {
//   const AcceptedOrders({List<PageRouteInfo>? children})
//       : super(
//           AcceptedOrders.name,
//           initialChildren: children,
//         );

//   static const String name = 'AcceptedOrders';

//   static PageInfo page = PageInfo(
//     name,
//     builder: (data) {
//       return const AcceptedOrders();
//     },
//   );
// }

/// generated route for
/// [ActiveOrderScreen]
class ActiveOrderRoute extends PageRouteInfo<ActiveOrderRouteArgs> {
  ActiveOrderRoute({
    Key? key,
    required ProcessedTask task,
    List<PageRouteInfo>? children,
  }) : super(
          ActiveOrderRoute.name,
          args: ActiveOrderRouteArgs(
            key: key,
            task: task,
          ),
          initialChildren: children,
        );

  static const String name = 'ActiveOrderRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ActiveOrderRouteArgs>();
      return ActiveOrderScreen(
        key: args.key,
        task: args.task,
      );
    },
  );
}

class ActiveOrderRouteArgs {
  const ActiveOrderRouteArgs({
    this.key,
    required this.task,
  });

  final Key? key;

  final ProcessedTask task;

  @override
  String toString() {
    return 'ActiveOrderRouteArgs{key: $key, task: $task}';
  }
}

/// generated route for
// /// [ActiveOrders]
// class ActiveOrders extends PageRouteInfo<ActiveOrdersArgs> {
//   ActiveOrders({
//     Key? key,
//     required bool isFinished,
//     List<PageRouteInfo>? children,
//   }) : super(
//           ActiveOrders.name,
//           args: ActiveOrdersArgs(
//             key: key,
//             isFinished: isFinished,
//           ),
//           initialChildren: children,
//         );

//   static const String name = 'ActiveOrders';

//   static PageInfo page = PageInfo(
//     name,
//     builder: (data) {
//       final args = data.argsAs<ActiveOrdersArgs>();
//       return ActiveOrders(
//         key: args.key,
//         isFinished: args.isFinished,
//       );
//     },
//   );
// }

class ActiveOrdersArgs {
  const ActiveOrdersArgs({
    this.key,
    required this.isFinished,
  });

  final Key? key;

  final bool isFinished;

  @override
  String toString() {
    return 'ActiveOrdersArgs{key: $key, isFinished: $isFinished}';
  }
}

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
/// [NewOrderScreen]
class NewOrderRoute extends PageRouteInfo<NewOrderRouteArgs> {
  NewOrderRoute({
    Key? key,
    required Task task,
    List<PageRouteInfo>? children,
  }) : super(
          NewOrderRoute.name,
          args: NewOrderRouteArgs(
            key: key,
            task: task,
          ),
          initialChildren: children,
        );

  static const String name = 'NewOrderRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NewOrderRouteArgs>();
      return NewOrderScreen(
        key: args.key,
        task: args.task,
      );
    },
  );
}

class NewOrderRouteArgs {
  const NewOrderRouteArgs({
    this.key,
    required this.task,
  });

  final Key? key;

  final Task task;

  @override
  String toString() {
    return 'NewOrderRouteArgs{key: $key, task: $task}';
  }
}

/// generated route for
/// [NewOrders]
// class NewOrders extends PageRouteInfo<void> {
//   const NewOrders({List<PageRouteInfo>? children})
//       : super(
//           NewOrders.name,
//           initialChildren: children,
//         );

//   static const String name = 'NewOrders';

//   static PageInfo page = PageInfo(
//     name,
//     builder: (data) {
//       return const NewOrders();
//     },
//   );
// }

/// generated route for
/// [ProductScreen]
class ProductRoute extends PageRouteInfo<ProductRouteArgs> {
  ProductRoute({
    Key? key,
    required Product product,
    List<PageRouteInfo>? children,
  }) : super(
          ProductRoute.name,
          args: ProductRouteArgs(
            key: key,
            product: product,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductRouteArgs>();
      return ProductScreen(
        key: args.key,
        product: args.product,
      );
    },
  );
}

class ProductRouteArgs {
  const ProductRouteArgs({
    this.key,
    required this.product,
  });

  final Key? key;

  final Product product;

  @override
  String toString() {
    return 'ProductRouteArgs{key: $key, product: $product}';
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
