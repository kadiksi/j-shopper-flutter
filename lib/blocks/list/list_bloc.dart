import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:j_courier/models/tasks/processed/processed_task.dart';
import 'package:j_courier/models/tasks/task.dart';
import 'package:talker_flutter/talker_flutter.dart';
import '../../models/ApiResponse';
import '../../repositories/list/order_abstarct_repository.dart';

part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc(this.listRepository) : super(ListInitial()) {
    on<LoadAcceptedList>(_loadAccepted);
    on<LoadNewList>(_loadNew);
    on<LoadActiveList>(_loadActive);
  }

  final OrderAbstractRepository listRepository;

  Future<void> _loadNew(
    LoadNewList event,
    Emitter<ListState> emit,
  ) async {
    if (state is! ListSuccess) {
      emit(ListLoading());
    }
    final response = await listRepository.getNewList();

    if (response is SuccessResponse<List<Task>>) {
      emit(ListSuccess(tasks: response.data));
    } else if (response is ErrorResponse) {
      emit(ListFailure(exception: response.errorMessage));
    }
  }

  Future<void> _loadAccepted(
    LoadAcceptedList event,
    Emitter<ListState> emit,
  ) async {
    if (state is! ListSuccess) {
      emit(ListLoading());
    }
    final response = await listRepository.getAcceptedList();

    if (response is SuccessResponse<List<Task>>) {
      emit(ListSuccess(tasks: response.data));
    } else if (response is ErrorResponse) {
      emit(ListFailure(exception: response.errorMessage));
    }
  }

  Future<void> _loadActive(
    LoadActiveList event,
    Emitter<ListState> emit,
  ) async {
    if (state is! ListSuccess) {
      emit(ListLoading());
    }
    final response = await listRepository.getActiveList(event.isFinished);

    if (response is SuccessResponse<List<ProcessedTask>>) {
      emit(ListActiveSuccess(tasks: response.data));
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
