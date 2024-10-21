import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:j_courier/models/tasks/task.dart';
import 'package:talker_flutter/talker_flutter.dart';
import '../../models/ApiResponse';
import '../../repositories/list/list_abstarct_repository.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc(this.loginRepository) : super(OrderInitial()) {
    on<LoadOrder>(_load);
  }

  final ListAbstractRepository loginRepository;

  Future<void> _load(
    LoadOrder event,
    Emitter<OrderState> emit,
  ) async {
    if (state is! OrderSuccess) {
      emit(OrderLoading());
    }
    final response = await loginRepository.getOrder(event.id);

    if (response is SuccessResponse<Task>) {
      emit(OrderSuccess(tasks: response.data));
    } else if (response is ErrorResponse) {
      emit(OrderFailure(exception: response.errorMessage));
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
