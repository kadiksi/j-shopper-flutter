part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {}

class LoadOrder extends OrderEvent {
  LoadOrder({this.completer, required this.id});

  final Completer? completer;
  final int id;

  @override
  List<Object?> get props => [completer, id];
}
