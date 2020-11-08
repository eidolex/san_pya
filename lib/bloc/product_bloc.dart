import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:san_pya/models/product.dart';
import 'package:san_pya/repository/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProducRepository _productRepository;

  ProductBloc(this._productRepository) : super(ProductInitial());

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    if (event is FetchProductListEvent) {
      yield* _mapFetchProductListToState();
    } else if (event is FetchProductDetailEvent) {
      yield* _mapFetchProductDetailEvent(event, state);
    }
  }

  Stream<ProductState> _mapFetchProductListToState() async* {
    yield ProductListLoading();
    try {
      final products = await _productRepository.fetchProducts();
      yield ProductListLoaded(products);
    } catch (_) {}
  }

  Stream<ProductState> _mapFetchProductDetailEvent(
      FetchProductDetailEvent event, ProductState state) async* {
    try {
      final product = await _productRepository.fetchProductDetailById(event.id);
      yield ProductDetailLoaded(product);
    } catch (_) {}
  }
}
