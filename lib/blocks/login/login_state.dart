part of 'login_bloc.dart';

abstract class LoginState extends Equatable {}

class LoginInitial extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginLoading extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginSuccess extends LoginState {
  LoginSuccess({
    required this.tokens,
  });

  final LoginDataModel tokens;

  @override
  List<Object?> get props => [tokens];
}

class LoginFailure extends LoginState {
  LoginFailure({
    this.exception,
  });

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
