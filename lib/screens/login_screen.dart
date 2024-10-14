import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:j_courier/generated/l10n.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../router/router.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var textEditingController = TextEditingController(text: "");
    var maskFormatter = MaskTextInputFormatter(
        mask: '+7(###)###-##-##', filter: {"#": RegExp(r'[0-9]')});
    final theme = Theme.of(context);
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(S.of(context).enter_phone_number_and_password,
                    style: theme.textTheme.labelSmall),
                const SizedBox(height: 20.0),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: textEditingController,
                  inputFormatters: [maskFormatter],
                  // decoration: const InputDecoration(
                  //   hintText: ' ',
                  //   suffixIcon: SizedBox(
                  //       width: 2.0,
                  //       height: 2.0,
                  //       child: CircularProgressIndicator()),
                  // ),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      openLogin(context);
                    },
                    child: Text(S.of(context).add),
                  ),
                ),
              ],
            )));
  }
}

void openLogin(context) {
  AutoRouter.of(context).push(const LoginVerificationRoute());
}
