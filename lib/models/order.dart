import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'cart_item.dart';

@immutable
class Order extends Equatable {
  final int id;

  final List<CartItem> items;

  final int status;

  final DateTime createdAt;

  Order(
      {@required this.id,
      @required this.items,
      @required this.status,
      @required this.createdAt});

  int get totalPrice => items.fold(
      0, (total, current) => total + current.product.price * current.quantity);

  @override
  List<Object> get props => [id];
}
