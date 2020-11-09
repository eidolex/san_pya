part of 'order_bloc.dart';

class OrderState extends Equatable {
  const OrderState(
      {this.status = OrderStatus.initial, this.orders = const <Order>[]});

  final OrderStatus status;

  final List<Order> orders;

  OrderState copyWith({
    OrderStatus status,
    List<Order> orders,
  }) {
    return OrderState(
      status: status ?? this.status,
      orders: orders ?? this.orders,
    );
  }

  @override
  List<Object> get props => [];
}

enum OrderStatus { initial, success, failure }
