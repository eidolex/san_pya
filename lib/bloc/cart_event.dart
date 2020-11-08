part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartStarted extends CartEvent {}

class CartAddItemQuantity extends CartEvent {
  const CartAddItemQuantity(this.index, this.quantity);

  final int index;

  final int quantity;

  @override
  List<Object> get props => [index, quantity];
}

class CartReduceItemQuantity extends CartEvent {
  const CartReduceItemQuantity(this.index, this.quantity);

  final int index;

  final int quantity;

  @override
  List<Object> get props => [index, quantity];
}

class CartItemAdded extends CartEvent {
  const CartItemAdded(this.item);

  final CartItem item;

  @override
  List<Object> get props => [item];
}

class CartItemRemoved extends CartEvent {
  const CartItemRemoved(this.index);

  final int index;

  @override
  List<Object> get props => [index];
}
