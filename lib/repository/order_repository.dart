import 'dart:math';

import 'package:san_pya/models/cart.dart';
import 'package:san_pya/models/order.dart';

abstract class OrderRepository {
  Future<void> placeOrder(Cart cart);
  Future<Order> fetchOrderDetail(int id);
  Future<List<Order>> fetchOrderList();
}

class FakeOrderRepository extends OrderRepository {
  List<Order> orders;

  FakeOrderRepository({this.orders = const []}) : super();

  @override
  Future<Order> fetchOrderDetail(int id) {
    return Future.delayed(Duration(seconds: 1), () {
      return orders.firstWhere((order) => order.id == id);
    });
  }

  @override
  Future<List<Order>> fetchOrderList() {
    return Future.delayed(Duration(seconds: 1), () {
      return orders;
    });
  }

  @override
  Future<void> placeOrder(Cart cart) {
    return Future.delayed(Duration(seconds: 1), () {
      final rand = Random();
      var date = DateTime.now();
      int status = rand.nextInt(3 + 1) - 1;
      int orderId = date.millisecondsSinceEpoch;
      return orders.add(new Order(
          id: orderId, items: cart.items, status: status, createdAt: date));
    });
  }
}
