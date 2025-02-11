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

class ChangeProdactStatus extends ProductEvent {
  ChangeProdactStatus(
      {this.completer, required this.products, required this.status});

  final Completer? completer;
  final List<Product> products;
  final ProductStatus status;

  @override
  List<Object?> get props => [completer, products, status];
}

class ReturnInitialProdact extends ProductEvent {
  ReturnInitialProdact({required this.product});

  final Product product;

  @override
  List<Object?> get props => [product];
}
