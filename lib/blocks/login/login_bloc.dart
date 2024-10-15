import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../models/ApiResponse';
import '../../models/login/login_data_model.dart';
import '../../models/vars.dart';
import '../../repositories/login/login_abstarct_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this.loginRepository) : super(LoginInitial()) {
    on<LoadLogin>(_load);
    on<ErrorLogin>(_error);
  }

  final LoginAbstractRepository loginRepository;
  final tokenBox = GetIt.instance<Box<LoginDataModel>>();

  Future<void> _load(
    LoadLogin event,
    Emitter<LoginState> emit,
  ) async {
    if (state is! LoginSuccess) {
      emit(LoginLoading());
    }
    final response = await loginRepository.login(event.login, event.password);

    if (response is SuccessResponse<LoginDataModel>) {
      tokenBox.put(tokenModelName, response.data);
      emit(LoginSuccess(tokens: response.data));
    } else if (response is ErrorResponse) {
      emit(LoginFailure(exception: response.errorMessage));
    }
  }

  Future<void> _error(
    ErrorLogin event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginFailure(exception: event.message));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    add(ErrorLogin(message: "error.toString()"));
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
