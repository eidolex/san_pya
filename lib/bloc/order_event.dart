part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class OrderFetched extends OrderEvent {
  @override
  List<Object> get props => [];
}

class OrderDetailFetched extends OrderEvent {
  const OrderDetailFetched(this.id);

  final int id;

  @override
  List<Object> get props => [id];
}
