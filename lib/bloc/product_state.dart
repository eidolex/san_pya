part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductDetailLoaded extends ProductState {
  final Product product;

  const ProductDetailLoaded(this.product);

  @override
  List<Object> get props => [product];
}

class ProductListLoading extends ProductState {}

class ProductListLoaded extends ProductState {
  final List<List<Product>> products;

  const ProductListLoaded(this.products);

  @override
  List<Object> get props => [products];
}
