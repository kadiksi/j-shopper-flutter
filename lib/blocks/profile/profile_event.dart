part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {}

class LoadProfile extends ProfileEvent {
  LoadProfile({this.completer});

  final Completer? completer;

  @override
  List<Object?> get props => [completer];
}

class RegisterToken extends ProfileEvent {
  RegisterToken({this.completer, this.token});

  final Completer? completer;
  final String? token;

  @override
  List<Object?> get props => [completer, token];
}

class LoadCallSupport extends ProfileEvent {
  LoadCallSupport({this.completer});

  final Completer? completer;

  @override
  List<Object?> get props => [completer];
}
