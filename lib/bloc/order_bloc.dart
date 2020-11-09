import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:san_pya/models/order.dart';
import 'package:san_pya/repository/order_repository.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepository _orderRepository;

  OrderBloc({OrderRepository orderRepository})
      : _orderRepository = orderRepository,
        super(const OrderState());

  @override
  Stream<OrderState> mapEventToState(
    OrderEvent event,
  ) async* {
    if (event is OrderFetched) {
      yield await _mapOrderFetchedToState(state);
    }
  }

  Future<OrderState> _mapOrderFetchedToState(OrderState orderState) async {
    try {
      // if (state.status == OrderStatus.initial) {
      final orders = await _orderRepository.fetchOrderList();
      return state.copyWith(status: OrderStatus.success, orders: orders);
      // } else {}
    } on Exception {
      return state.copyWith(status: OrderStatus.failure);
    }
  }
}
