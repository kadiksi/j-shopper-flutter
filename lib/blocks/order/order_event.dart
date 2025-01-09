part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {}

class LoadAcceptedOrder extends OrderEvent {
  LoadAcceptedOrder({this.completer, required this.id});

  final Completer? completer;
  final int id;

  @override
  List<Object?> get props => [completer, id];
}

class LoadNewOrder extends OrderEvent {
  LoadNewOrder({this.completer, required this.id});

  final Completer? completer;
  final int id;

  @override
  List<Object?> get props => [completer, id];
}

class SetOrderStatus extends OrderEvent {
  SetOrderStatus(
      {this.completer,
      required this.shopperOrderId,
      required this.status,
      required this.cancellationReason,
      required this.cancellationReasonOther});

  final Completer? completer;
  final int shopperOrderId;
  final OrderStatus status;
  final String cancellationReason;
  final String cancellationReasonOther;

  @override
  List<Object?> get props =>
      [completer, shopperOrderId, cancellationReason, cancellationReasonOther];
}

class LoadShelf extends OrderEvent {
  LoadShelf({this.completer, required this.task});

  final Completer? completer;
  final Task task;

  @override
  List<Object?> get props => [completer, task];
}

class LoadCancelationReasons extends OrderEvent {
  @override
  List<Object?> get props => [];
}

class LoadCollectOrder extends OrderEvent {
  LoadCollectOrder(
      {this.completer, required this.products, required this.status});

  final Completer? completer;
  final List<Product> products;
  final String status;

  @override
  List<Object?> get props => [completer, products];
}
