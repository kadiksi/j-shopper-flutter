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

class OrderShelfSuccess extends OrderState {
  OrderShelfSuccess({required this.shelfs, required this.task});
  final Task task;
  final List<Shelf> shelfs;

  @override
  List<Object?> get props => [shelfs, task];
}

class OrderCollectProductSuccess extends OrderState {
  OrderCollectProductSuccess({required this.data});

  final String data;

  @override
  List<Object?> get props => [data];
}

class OrderFailure extends OrderState {
  OrderFailure({
    this.exception,
  });

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
