import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:san_pya/models/product.dart';

@immutable
class CartItem extends Equatable {
  final Product product;

  final int quantity;

  CartItem({@required this.product, @required this.quantity});

  CartItem copyWith({Product product, int quantity}) {
    return CartItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object> get props => [product];
}
