import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'generated/l10n.dart';
import 'router/router.dart';
import 'theme/theme.dart';

class ShopperApp extends StatefulWidget {
  const ShopperApp({super.key});

  @override
  State<ShopperApp> createState() => _ShopperAppState();
}

class _ShopperAppState extends State<ShopperApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'CryptoCurrenciesList',
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      // supportedLocales: [Locale('fr'), Locale('kz')],
      theme: darkTheme,
      routerConfig: _appRouter.config(
        navigatorObservers: () => [
          TalkerRouteObserver(GetIt.I<Talker>()),
        ],
      ),
    );
  }
}
