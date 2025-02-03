part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {}

class LoadProdactList extends ProductEvent {
  LoadProdactList({this.completer, required this.search});

  final Completer? completer;
  final String search;

  @override
  List<Object?> get props => [completer, search];
}

class ReplaceProdact extends ProductEvent {
  ReplaceProdact(
      {this.completer, required this.product, required this.replacedProductId});

  final Completer? completer;
  final Product product;
  final int replacedProductId;

  @override
  List<Object?> get props => [completer, product];
}
