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
    } else if (event is OrderDetailFetched) {
      yield* await _mapOrderDetailFetchedToState(event, state);
    }
  }

  Future<OrderState> _mapOrderFetchedToState(OrderState orderState) async {
    try {
      // if (state.status == OrderStatus.initial) {
      final orders = await _orderRepository.fetchOrderList();
      return state.copyWith(
          listFetchStatus: OrderStatus.success, orders: orders);
      // } else {}
    } on Exception {
      return state.copyWith(listFetchStatus: OrderStatus.failure);
    }
  }

  Stream<OrderState> _mapOrderDetailFetchedToState(
      OrderDetailFetched event, OrderState orderState) async* {
    yield state.copyWith(detailFetchStatus: OrderStatus.initial);
    try {
      final order = await _orderRepository.fetchOrderDetail(event.id);
      yield state.copyWith(
        detailFetchStatus: OrderStatus.success,
        order: order,
      );
    } on Exception {
      yield state.copyWith(listFetchStatus: OrderStatus.failure);
    }
  }
}
