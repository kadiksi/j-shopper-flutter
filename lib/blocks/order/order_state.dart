part of 'order_bloc.dart';

abstract class OrderState extends Equatable {}

class OrderInitial extends OrderState {
  @override
  List<Object?> get props => [];
}

class OrderLoading extends OrderState {
  @override
  List<Object?> get props => [];
}

class OrderSuccess extends OrderState {
  OrderSuccess({
    required this.task,
  });

  final Task task;

  @override
  List<Object?> get props => [task];
}

class OrderProcessedSuccess extends OrderState {
  OrderProcessedSuccess({
    required this.task,
  });

  final ProcessedTask task;

  @override
  List<Object?> get props => [task];
}

class OrderAcceptSuccess extends OrderState {
  OrderAcceptSuccess();

  @override
  List<Object?> get props => [];
}

class OrderStatusSuccess extends OrderState {
  OrderStatusSuccess({
    required this.task,
  });

  final String task;

  @override
  List<Object?> get props => [task];
}

class OrderShelfSuccess extends OrderState {
  OrderShelfSuccess({required this.shelfs, required this.task});
  final Task task;
  final List<Shelf> shelfs;

  @override
  List<Object?> get props => [shelfs, task];
}

class OrderCancelReasonSuccess extends OrderState {
  OrderCancelReasonSuccess({required this.cancelationReasons});

  final List<CancelationReasons> cancelationReasons;

  @override
  List<Object?> get props => [cancelationReasons];
}

class OrderCollectProductSuccess extends OrderState {
  OrderCollectProductSuccess({required this.data});

  final String data;

  @override
  List<Object?> get props => [data];
}

class AddProductSuccess extends OrderState {
  AddProductSuccess({required this.data});

  final String data;

  @override
  List<Object?> get props => [data];
}

class CallSuccess extends OrderState {
  CallSuccess({required this.data});

  final String data;

  @override
  List<Object?> get props => [data];
}

class CallFailure extends OrderState {
  CallFailure({
    this.exception,
  });

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}

class AddProductFailure extends OrderState {
  AddProductFailure({
    this.exception,
  });

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}

class OrderFailure extends OrderState {
  OrderFailure({
    this.exception,
  });

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}

class OrderStatusFailure extends OrderState {
  OrderStatusFailure({
    this.exception,
  });

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
