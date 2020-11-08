part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class FetchProductDetailEvent extends ProductEvent {
  const FetchProductDetailEvent(this.id);

  final int id;

  @override
  List<Object> get props => [id];
}

class FetchProductListEvent extends ProductEvent {
  const FetchProductListEvent();

  @override
  List<Object> get props => [];
}
