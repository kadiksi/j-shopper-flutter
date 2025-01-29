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

class ProductFailure extends ProductState {
  ProductFailure({
    this.exception,
  });

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
