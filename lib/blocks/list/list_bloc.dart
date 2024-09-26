import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import '../../models/ApiResponse';
import '../../models/tasks/task_data_model.dart';
import '../../repositories/list/list_abstarct_repository.dart';

part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc(this.loginRepository) : super(ListInitial()) {
    on<LoadList>(_load);
  }

  final ListAbstractRepository loginRepository;

  Future<void> _load(
    LoadList event,
    Emitter<ListState> emit,
  ) async {
    if (state is! ListSuccess) {
      emit(ListLoading());
    }
    final response = await loginRepository.getList();

    if (response is SuccessResponse<List<TaskDataModel>>) {
      emit(ListSuccess(tasks: response.data));
    } else if (response is ErrorResponse) {
      emit(ListFailure(exception: response.errorMessage));
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
