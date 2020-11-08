import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:san_pya/models/cart_item.dart';

@immutable
class Cart extends Equatable {
  const Cart({this.items = const <CartItem>[]});

  final List<CartItem> items;

  int get totalPrice => items.fold(
      0, (total, current) => total + current.product.price * current.quantity);

  @override
  List<Object> get props => [items];
}
