import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:j_courier/generated/l10n.dart';
import 'package:j_courier/repositories/login/login_abstarct_repository.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../blocks/login/login_bloc.dart';
import '../../router/router.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  final _loginBloc = LoginBloc(
    GetIt.I<LoginAbstractRepository>(),
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final _usernameController = TextEditingController();
    final _passwordController = TextEditingController();
    var maskFormatter = MaskTextInputFormatter(
        mask: '+7(###)###-##-##', filter: {"#": RegExp(r'[0-9]')});

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: BlocBuilder<LoginBloc, LoginState>(
        bloc: _loginBloc,
        builder: (context, state) {
          if (state is LoginSuccess) {
            openLogin(context);
          } else if (state is LoginFailure) {
            return Error(theme: theme, msg: state.exception as String);
          }
          return Form(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: _usernameController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [maskFormatter],
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                ),
                const SizedBox(height: 24),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        final username = _usernameController.text;
                        final password = _passwordController.text;
                        _loginBloc.add(
                            LoadLogin(login: username, password: password));
                      },
                      child: Text(S.of(context).add),
                    )),
              ],
            ),
          ));
        },
      ),
    );
  }
}

class Error extends StatelessWidget {
  const Error({
    super.key,
    required this.theme,
    required this.msg,
  });

  final ThemeData theme;
  final String msg;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Something went wrong + ${msg}',
            style: theme.textTheme.headlineMedium,
          ),
          Text(
            'Please try againg later',
            style: theme.textTheme.labelSmall?.copyWith(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

void openLogin(context) {
  AutoRouter.of(context).push(const LoginVerificationRoute());
}
