part of 'order_bloc.dart';

class OrderState extends Equatable {
  const OrderState(
      {this.listFetchStatus = OrderStatus.initial,
      this.detailFetchStatus = OrderStatus.initial,
      this.orders = const <Order>[],
      this.order});

  final OrderStatus listFetchStatus;

  final OrderStatus detailFetchStatus;

  final List<Order> orders;

  final Order order;

  OrderState copyWith({
    OrderStatus listFetchStatus,
    OrderStatus detailFetchStatus,
    Order order,
    List<Order> orders,
  }) {
    return OrderState(
      listFetchStatus: listFetchStatus ?? this.listFetchStatus,
      detailFetchStatus: detailFetchStatus ?? this.detailFetchStatus,
      orders: orders ?? this.orders,
      order: order ?? this.order,
    );
  }

  @override
  List<Object> get props => [orders, listFetchStatus, detailFetchStatus, order];
}

enum OrderStatus { initial, success, failure }
