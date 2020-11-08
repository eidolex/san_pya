import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:san_pya/models/cart.dart';
import 'package:san_pya/models/cart_item.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial());

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    if (event is CartStarted) {
      yield* _mapCartInitialToState();
    } else if (event is CartItemAdded) {
      yield* _mapCartItemAddedToState(event, state);
    } else if (event is CartItemRemoved) {
      yield* _mapCartItemRemovedToState(event, state);
    } else if (event is CartAddItemQuantity) {
      yield* _mapCartAddItemQuantityToState(event, state);
    } else if (event is CartReduceItemQuantity) {
      yield* _mapCartReduceItemQuantityToState(event, state);
    }
  }

  Stream<CartState> _mapCartInitialToState() async* {
    // yield CartLoading();
    try {
      // await Future<void>.delayed(const Duration(seconds: 1));
      yield const CartLoaded();
    } catch (_) {
      // yield CartError();
    }
  }

  Stream<CartState> _mapCartItemAddedToState(
    CartItemAdded event,
    CartState state,
  ) async* {
    if (state is CartLoaded) {
      try {
        var items = List.from(state.cart.items);
        var index = items.indexOf(event.item);
        if (index > -1) {
          var item = state.cart.items[index];
          item.quantity += event.item.quantity;
        } else {
          items.add(event.item);
        }
        yield CartLoaded(
          cart: Cart(items: items),
        );
      } catch (_) {
        // yield CartError();
      }
    }
  }

  Stream<CartState> _mapCartItemRemovedToState(
    CartItemRemoved event,
    CartState state,
  ) async* {
    if (state is CartLoaded) {
      try {
        List<CartItem> items = List.from(state.cart.items)
          ..removeAt(event.index);
        yield CartLoaded(
          cart: Cart(items: items),
        );
      } catch (_) {
        // yield CartError();
      }
    }
  }

  Stream<CartState> _mapCartAddItemQuantityToState(
    CartAddItemQuantity event,
    CartState state,
  ) async* {
    if (state is CartLoaded) {
      try {
        List<CartItem> items = List.from(state.cart.items);
        items[event.index].quantity += event.quantity;
        yield CartLoaded(
          cart: Cart(items: items),
        );
      } catch (_) {
        // yield CartError();
      }
    }
  }

  Stream<CartState> _mapCartReduceItemQuantityToState(
    CartReduceItemQuantity event,
    CartState state,
  ) async* {
    if (state is CartLoaded) {
      try {
        List<CartItem> items = List.from(state.cart.items);
        items[event.index].quantity -= event.quantity;
        yield CartLoaded(
          cart: Cart(items: items),
        );
      } catch (_) {
        // yield CartError();
      }
    }
  }
}
