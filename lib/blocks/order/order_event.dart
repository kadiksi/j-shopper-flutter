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

class LoadProcessedOrder extends OrderEvent {
  LoadProcessedOrder({this.completer, required this.id});

  final Completer? completer;
  final int id;

  @override
  List<Object?> get props => [completer, id];
}

class AcceptOrder extends OrderEvent {
  AcceptOrder({this.completer, required this.ids});

  final Completer? completer;
  final List<int> ids;

  @override
  List<Object?> get props => [completer, ids];
}

class SetOrderStatus extends OrderEvent {
  SetOrderStatus(
      {this.completer,
      required this.externalOrderId,
      required this.status,
      this.cancellationReason,
      this.cancellationReasonOther});

  final Completer? completer;
  final String externalOrderId;
  final OrderStatus status;
  final String? cancellationReason;
  final String? cancellationReasonOther;

  @override
  List<Object?> get props =>
      [completer, externalOrderId, cancellationReason, cancellationReasonOther];
}

class LoadShelf extends OrderEvent {
  LoadShelf({this.completer, required this.task});

  final Completer? completer;
  final Task task;

  @override
  List<Object?> get props => [completer, task];
}

class AddProductToOrder extends OrderEvent {
  AddProductToOrder(
      {this.completer, required this.product, required this.externalOrderId});

  final Completer? completer;
  final Product product;
  final String externalOrderId;

  @override
  List<Object?> get props => [completer, product];
}

class LoadCancelationReasons extends OrderEvent {
  @override
  List<Object?> get props => [];
}

class LoadChangeProductStatus extends OrderEvent {
  LoadChangeProductStatus(
      {this.completer, required this.products, required this.status});

  final Completer? completer;
  final List<Product> products;
  final ProductStatus status;

  @override
  List<Object?> get props => [completer, products];
}
