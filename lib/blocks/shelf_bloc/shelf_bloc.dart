import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:j_courier/models/tasks/shelf/shelf.dart';
import 'package:talker_flutter/talker_flutter.dart';
import '../../models/ApiResponse';
import '../../repositories/list/order_abstarct_repository.dart';

part 'shelf_event.dart';
part 'shelf_state.dart';

class ShelfBloc extends Bloc<ShelfEvent, ShelfState> {
  ShelfBloc(this.listRepository) : super(ShelfInitial()) {
    on<LoadShelf>(_load);
  }

  final OrderAbstractRepository listRepository;

  Future<void> _load(
    LoadShelf event,
    Emitter<ShelfState> emit,
  ) async {
    if (state is! ShelfSuccess) {
      emit(ShelfLoading());
    }
    final response = await listRepository.getOrderShelf();

    if (response is SuccessResponse<List<Shelf>>) {
      emit(ShelfSuccess(tasks: response.data));
    } else if (response is ErrorResponse) {
      emit(ShelfFailure(exception: response.errorMessage));
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
