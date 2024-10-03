import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../courier_app.dart';
import '../generated/l10n.dart';
import '../locale/locale_provider.dart';
import '../theme/colors.dart';
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
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Spacer at the top
            Spacer(),

            SvgPicture.asset(
              'assets/svg/logo-orange.svg',
              width: 162,
              height: 162,
            ),
            const Spacer(),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  GreyButton(
                    label: S.of(context).kazakh,
                    onPressed: () {
                      setLocale(context, Locale('kk'));
                    },
                  ),
                  const SizedBox(height: 10),
                  GreyButton(
                    label: S.of(context).kazakh,
                    onPressed: () {
                      setLocale(context, Locale('ru'));
                    },
                  ),
                  const SizedBox(height: 10),
                  GreyButton(
                    label: S.of(context).kazakh,
                    onPressed: () {
                      setLocale(context, Locale('en'));
                    },
                  )
                ],
              ),
            ),

            // Spacer at the bottom
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

void setLocale(BuildContext context, Locale locale) {
  Provider.of<LocaleProvider>(context, listen: false).setLocale(locale);
  // onLocal
  // CourierApp.of(context).setLocale(locale);
}

void selectRussianLanguage(BuildContext context) {
  // Perform the action for Russian language selection here
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Русский language selected')),
  );
}
