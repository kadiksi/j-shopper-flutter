import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:j_courier/router/router.dart';
import 'package:provider/provider.dart';

import '../generated/l10n.dart';
import '../locale/locale_provider.dart';
import 'widgets/buttons/grey_button.dart';

@RoutePage()
class ChooseLanguageScreen extends StatefulWidget {
  const ChooseLanguageScreen({
    super.key,
  });

  @override
  State<ChooseLanguageScreen> createState() => _ChooseLanguageScreenState();
}

class _ChooseLanguageScreenState extends State<ChooseLanguageScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            SvgPicture.asset(
              'assets/svg/logo-orange.svg',
              width: 162,
              height: 162,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  GreyButton(
                    label: S.of(context).kazakh,
                    onPressed: () {
                      setLocale(context, const Locale('kk'));
                    },
                  ),
                  const SizedBox(height: 10),
                  GreyButton(
                    label: S.of(context).russian,
                    onPressed: () {
                      setLocale(context, const Locale('ru'));
                    },
                  ),
                  const SizedBox(height: 10),
                  GreyButton(
                    label: S.of(context).english,
                    onPressed: () {
                      setLocale(context, const Locale('en'));
                    },
                  )
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

void setLocale(BuildContext context, Locale locale) {
  Provider.of<LocaleProvider>(context, listen: false).setLocale(locale);
  openLogin(context);
}

void openLogin(context) {
  AutoRouter.of(context).push(const LoginRoute());
}
