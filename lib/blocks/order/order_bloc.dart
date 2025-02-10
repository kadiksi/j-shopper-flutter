import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:j_courier/models/tasks/cacelation_reasons/cancelation_reasons.dart';
import 'package:j_courier/models/tasks/processed/processed_task.dart';
import 'package:j_courier/models/tasks/product.dart';
import 'package:j_courier/models/tasks/shelf/shelf.dart';
import 'package:j_courier/models/tasks/task.dart';
import 'package:j_courier/repositories/product/product_abstarct_repository.dart';
import 'package:talker_flutter/talker_flutter.dart';
import '../../models/ApiResponse';
import '../../repositories/list/order_abstarct_repository.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc(this.orderRepository, this.productRepository)
      : super(OrderInitial()) {
    on<LoadAcceptedOrder>(_loadAcceptedOrder);
    on<LoadNewOrder>(_loadNewOrder);
    on<AcceptOrder>(_acceptNewOrder);
    on<LoadProcessedOrder>(_loadProcessedOrder);
    on<LoadShelf>(_loadShelf);
    on<LoadChangeProductStatus>(_changeProductStatus);
    on<LoadCancelationReasons>(_loadCancelationReason);
    on<SetOrderStatus>(_changeStatus);
    on<AddProductToOrder>(_addProduct);
  }

  final OrderAbstractRepository orderRepository;
  final ProductAbstractRepository productRepository;

  Future<void> _loadAcceptedOrder(
    LoadAcceptedOrder event,
    Emitter<OrderState> emit,
  ) async {
    if (state is! OrderSuccess) {
      emit(OrderLoading());
    }
    final response = await orderRepository.getAcceptedOrder(event.id);

    if (response is SuccessResponse<Task>) {
      add(LoadShelf(task: response.data));
    } else if (response is ErrorResponse) {
      emit(OrderFailure(exception: response.errorMessage));
    }
  }

  Future<void> _loadNewOrder(
    LoadNewOrder event,
    Emitter<OrderState> emit,
  ) async {
    if (state is! OrderSuccess) {
      emit(OrderLoading());
    }
    final response = await orderRepository.getNewOrder(event.id);

    if (response is SuccessResponse<Task>) {
      add(LoadShelf(task: response.data));
    } else if (response is ErrorResponse) {
      emit(OrderFailure(exception: response.errorMessage));
    }
  }

  Future<void> _loadProcessedOrder(
    LoadProcessedOrder event,
    Emitter<OrderState> emit,
  ) async {
    if (state is! OrderSuccess) {
      emit(OrderLoading());
    }
    final response = await orderRepository.getProcessedOrder(event.id);

    if (response is SuccessResponse<ProcessedTask>) {
      emit(OrderProcessedSuccess(task: response.data));
    } else if (response is ErrorResponse) {
      emit(OrderFailure(exception: response.errorMessage));
    }
  }

  Future<void> _acceptNewOrder(
    AcceptOrder event,
    Emitter<OrderState> emit,
  ) async {
    if (state is! OrderSuccess) {
      emit(OrderLoading());
    }
    final response = await orderRepository.acceptNewOrder(event.ids);

    if (response is SuccessResponse<Task>) {
      emit(OrderAcceptSuccess());
    } else if (response is ErrorResponse) {
      emit(OrderFailure(exception: response.errorMessage));
    }
  }

  Future<void> _changeStatus(
    SetOrderStatus event,
    Emitter<OrderState> emit,
  ) async {
    // if (state is! OrderSuccess) {
    //   emit(OrderLoading());
    // }
    final response = await orderRepository.changeOrderStatus(
        event.externalOrderId,
        event.status,
        event.cancellationReason,
        event.cancellationReasonOther);

    if (response is SuccessResponse<Task>) {
      emit(OrderStatusSuccess(task: response.data));
    } else if (response is ErrorResponse) {
      emit(OrderStatusFailure(exception: response.errorMessage));
    }
  }

  Future<void> _loadShelf(
    LoadShelf event,
    Emitter<OrderState> emit,
  ) async {
    if (state is! OrderSuccess) {
      emit(OrderLoading());
    }
    final response = await orderRepository.getOrderShelf();

    if (response is SuccessResponse<List<Shelf>>) {
      emit(OrderShelfSuccess(shelfs: response.data, task: event.task));
    } else if (response is ErrorResponse) {
      emit(OrderFailure(exception: response.errorMessage));
    }
  }

  Future<void> _loadCancelationReason(
    LoadCancelationReasons event,
    Emitter<OrderState> emit,
  ) async {
    final response = await orderRepository.getCancelationReason();

    if (response is SuccessResponse<List<CancelationReasons>>) {
      emit(OrderCancelReasonSuccess(cancelationReasons: response.data));
    } else if (response is ErrorResponse) {
      emit(OrderFailure(exception: response.errorMessage));
    }
  }

  Future<void> _changeProductStatus(
    LoadChangeProductStatus event,
    Emitter<OrderState> emit,
  ) async {
    if (state is! OrderSuccess) {
      // emit(OrderLoading());
    }
    final response = await productRepository.changeProductStatus(
        event.products, event.status.name);

    if (response is SuccessResponse<String>) {
      emit(OrderCollectProductSuccess(data: response.data));
    } else if (response is ErrorResponse) {
      emit(OrderFailure(exception: response.errorMessage));
    }
  }

  Future<void> _addProduct(
    AddProductToOrder event,
    Emitter<OrderState> emit,
  ) async {
    // if (state is! OrderSuccess) {
    //   emit(OrderLoading());
    // }
    final response = await productRepository.addProduct(
        event.product, event.externalOrderId);

    if (response is SuccessResponse<String>) {
      emit(AddProductSuccess(data: response.data));
    } else if (response is ErrorResponse) {
      emit(AddProductFailure(exception: response.errorMessage));
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
