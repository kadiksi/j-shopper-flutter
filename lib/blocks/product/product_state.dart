part of 'product_bloc.dart';

abstract class ProductState extends Equatable {}

class ProductInitial extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductLoading extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductSuccess extends ProductState {
  ProductSuccess({
    required this.productList,
  });

  final List<Product> productList;

  @override
  List<Object?> get props => [productList];
}

class ProductReplaceSuccess extends ProductState {
  ProductReplaceSuccess({
    required this.product,
  });

  final String product;

  @override
  List<Object?> get props => [product];
}

class ProductStatusSuccess extends ProductState {
  ProductStatusSuccess({
    required this.product,
  });

  final String product;

  @override
  List<Object?> get props => [product];
}

class ProductReturnSuccess extends ProductState {
  ProductReturnSuccess({
    required this.product,
  });

  final String product;

  @override
  List<Object?> get props => [product];
}

class ProductFailure extends ProductState {
  ProductFailure({
    this.exception,
  });

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
