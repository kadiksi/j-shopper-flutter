import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../blocks/login/login_bloc.dart';
import '../repositories/login/login_abstarct_repository.dart';
import '../router/router.dart';
import 'screen.dart';
import 'widgets/login_sccreen/login_form.dart';

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
  final _cryptoListBloc = LoginBloc(
    GetIt.I<LoginAbstractRepository>(),
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    bool showLoading = false;
    // String title = S.of(context).goodbay;
    String title = "title";
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: BlocBuilder<LoginBloc, LoginState>(
        bloc: _cryptoListBloc,
        builder: (context, state) {
          if (state is LoginLoading) {
            showLoading = true;
          } else if (state is LoginSuccess) {
            showLoading = false;
            AutoRouter.of(context).push(const ListRoute());
            return Text(
              'Auth token is ${state.tokens.tokens.auth.token}',
              style: theme.textTheme.labelSmall?.copyWith(fontSize: 16),
            );
          }

          if (state is LoginFailure) {
            showLoading = false;

            Future.delayed(Duration.zero,
                () => showAlert(context, title, state.exception.toString()));
          }

          return LoginForm(
              usernameController: usernameController,
              theme: theme,
              passwordController: passwordController,
              cryptoListBloc: _cryptoListBloc,
              showLoading: showLoading);
        },
      ),
    );
  }
}
