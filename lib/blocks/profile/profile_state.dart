part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {}

class ProfileInitial extends ProfileState {
  @override
  List<Object?> get props => [];
}

class ProfileLoading extends ProfileState {
  @override
  List<Object?> get props => [];
}

class ProfileSuccess extends ProfileState {
  ProfileSuccess({
    required this.profile,
  });

  final Profile profile;

  @override
  List<Object?> get props => [profile];
}

class RegisterTokenSuccess extends ProfileState {
  RegisterTokenSuccess({
    required this.profile,
  });

  final String profile;

  @override
  List<Object?> get props => [profile];
}

class ProfileFailure extends ProfileState {
  ProfileFailure({
    this.exception,
  });

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}

class ProfileCallSuccess extends ProfileState {
  ProfileCallSuccess({
    required this.profile,
  });

  final Profile profile;

  @override
  List<Object?> get props => [profile];
}

class ProfileCallFailure extends ProfileState {
  ProfileCallFailure({
    this.exception,
  });

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
