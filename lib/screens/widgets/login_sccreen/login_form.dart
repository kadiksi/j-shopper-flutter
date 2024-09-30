import 'package:flutter/material.dart';
import 'package:j_courier/generated/l10n.dart';

import '../../../blocks/login/login_bloc.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required TextEditingController usernameController,
    required this.theme,
    required TextEditingController passwordController,
    required LoginBloc cryptoListBloc,
    required this.showLoading,
  })  : _usernameController = usernameController,
        _passwordController = passwordController,
        _cryptoListBloc = cryptoListBloc;

  final TextEditingController _usernameController;
  final ThemeData theme;
  final TextEditingController _passwordController;
  final LoginBloc _cryptoListBloc;
  final bool showLoading;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            controller: _usernameController,
            style: theme.textTheme.labelSmall,
            decoration: InputDecoration(
              labelText: S.of(context).username,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 24),
          getLoading(showLoading),
          ElevatedButton(
            onPressed: () {
              final username = _usernameController.text;
              final password = _passwordController.text;
              _cryptoListBloc
                  .add(LoadLogin(login: username, password: password));
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}

getLoading(bool showLoading) {
  if (showLoading) {
    return const CircularProgressIndicator();
  } else {
    return const SizedBox(height: 24);
  }
}
