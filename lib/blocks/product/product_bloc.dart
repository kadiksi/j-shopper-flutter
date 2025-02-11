import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:j_courier/models/tasks/product.dart';
import 'package:j_courier/repositories/product/product_abstarct_repository.dart';
import 'package:talker_flutter/talker_flutter.dart';
import '../../models/ApiResponse';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc(this.productRepository) : super(ProductInitial()) {
    on<LoadProdactList>(_loadProduct);
    on<ReplaceProdact>(_replaceProduct);
    on<ChangeProdactStatus>(_changeProductStatus);
    on<ReturnInitialProdact>(_returnInitialProdact);
  }

  final ProductAbstractRepository productRepository;

  Future<void> _loadProduct(
    LoadProdactList event,
    Emitter<ProductState> emit,
  ) async {
    if (event.search.length < 3) {
      return;
    }
    if (state is! ProductSuccess) {
      emit(ProductLoading());
    }
    final response = await productRepository.getProductByText(event.search);

    if (response is SuccessResponse<List<Product>>) {
      emit(ProductSuccess(productList: response.data));
    } else if (response is ErrorResponse) {
      emit(ProductFailure(exception: response.errorMessage));
    }
  }

  Future<void> _replaceProduct(
    ReplaceProdact event,
    Emitter<ProductState> emit,
  ) async {
    if (state is! ProductReplaceSuccess) {
      emit(ProductLoading());
    }
    final response = await productRepository.replaceProduct(
        event.replacedProductId, event.product);

    if (response is SuccessResponse<String>) {
      emit(ProductReplaceSuccess(product: response.data));
    } else if (response is ErrorResponse) {
      emit(ProductFailure(exception: response.errorMessage));
    }
  }

  Future<void> _changeProductStatus(
    ChangeProdactStatus event,
    Emitter<ProductState> emit,
  ) async {
    if (state is! ProductSuccess) {
      // emit(ProductLoading());
    }
    final response = await productRepository.changeProductStatus(
        event.products, event.status.name);

    if (response is SuccessResponse<String>) {
      emit(ProductStatusSuccess(product: response.data));
    } else if (response is ErrorResponse) {
      emit(ProductFailure(exception: response.errorMessage));
    }
  }

  Future<void> _returnInitialProdact(
    ReturnInitialProdact event,
    Emitter<ProductState> emit,
  ) async {
    if (state is! ProductSuccess) {
      // emit(ProductLoading());
    }
    final response =
        await productRepository.returnInitialProduct(event.product);

    if (response is SuccessResponse<String>) {
      emit(ProductReturnSuccess(product: response.data));
    } else if (response is ErrorResponse) {
      emit(ProductFailure(exception: response.errorMessage));
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
