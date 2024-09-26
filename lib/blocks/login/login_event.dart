part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {}

class LoadLogin extends LoginEvent {
  LoadLogin({this.completer, required this.login, required this.password});

  final Completer? completer;
  final String login;
  final String password;

  @override
  List<Object?> get props => [completer, login, password];
}
