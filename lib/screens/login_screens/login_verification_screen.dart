import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:j_courier/generated/l10n.dart';
import 'package:j_courier/router/router.dart';
import 'package:j_courier/screens/widgets/box_decorations/dividers.dart';
import 'package:local_auth/local_auth.dart';

// https://pub.dev/packages/local_auth
@RoutePage()
class LoginVerificationScreen extends StatefulWidget {
  const LoginVerificationScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginVerificationScreenState createState() =>
      _LoginVerificationScreenState();
}

class _LoginVerificationScreenState extends State<LoginVerificationScreen> {
  final LocalAuthentication auth = LocalAuthentication();
  // bool _isAuthenticated = false;

  @override
  void initState() {
    super.initState();
    _authenticate(); // Auto authenticate on screen load
  }

  Future<void> _authenticate() async {
    // bool authenticated = false;
    try {
      // authenticated =
      await auth.authenticate(
        localizedReason: 'Authenticate to access your account',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );
    } catch (e) {
      print(e);
    }

    setState(() {
      print("auth 00");
      // _isAuthenticated = authenticated;
    });
  }

  void openLogin(context) {
    AutoRouter.of(context).replace(const TabsRoute());
  }

  Widget buildIconButton(String path, VoidCallback onPressed) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: IconButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(19),
            ),
            elevation: 0,
            backgroundColor: theme.colorScheme.inversePrimary),
        onPressed: onPressed,
        icon: SvgPicture.asset(
          path,
          width: 32,
          height: 32,
        ),
      ),
    );
  }

  Widget buildKeypadButton(String number, VoidCallback onPressed) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(19),
            ),
            elevation: 0,
            backgroundColor: theme.colorScheme.inversePrimary),
        onPressed: onPressed,
        child: Text(
          number,
          style: theme.textTheme.headlineLarge,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/svg/face_id_orange.svg',
                width: 64,
                height: 64,
              ),
              divider20,
              Text(S.of(context).welcome_name('Nurlano'), // Greeting message
                  style: theme.textTheme.headlineLarge),
              divider10,
              Text(
                S.of(context).enter_code_password, // Prompt to enter passcode
                style: theme.textTheme.headlineMedium?.copyWith(
                    color: theme.colorScheme.surfaceTint,
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
              ),
              divider40,
              // Keypad for entering passcode
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: List.generate(12, (index) {
                  if (index == 9) {
                    return buildIconButton('assets/svg/face_id.svg', () {
                      _authenticate();
                    });
                  } else if (index == 10) {
                    return buildKeypadButton("0", () {
                      openLogin(context);
                    });
                  } else if (index == 11) {
                    return buildIconButton('assets/svg/arrow_left.svg', () {
                      print("arrow pressed");
                    });
                  } else {
                    return buildKeypadButton((index + 1).toString(), () {
                      openLogin(context);
                    });
                  }
                }),
              ),
              // SizedBox(height: 20),
              // TextButton(
              //   onPressed: () {
              //     print('Forgot code?');
              //   },
              //   child: Text(
              //     'Забыли код?', // "Forgot code?" message
              //     style: TextStyle(color: Colors.grey),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
