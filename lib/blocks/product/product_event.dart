part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {}

class LoadProdactList extends ProductEvent {
  LoadProdactList({this.completer, required this.search});

  final Completer? completer;
  final String search;

  @override
  List<Object?> get props => [completer, search];
}
