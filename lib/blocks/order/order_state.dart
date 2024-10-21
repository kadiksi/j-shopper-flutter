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
    required this.tasks,
  });

  final Task tasks;

  @override
  List<Object?> get props => [tasks];
}

class OrderFailure extends OrderState {
  OrderFailure({
    this.exception,
  });

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
