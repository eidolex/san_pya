import 'dart:math';

import 'package:san_pya/models/cart.dart';
import 'package:san_pya/models/cart_item.dart';
import 'package:san_pya/models/order.dart';
import 'package:san_pya/models/product.dart';

abstract class OrderRepository {
  Future<void> placeOrder(Cart cart);
  Future<Order> fetchOrderDetail(int id);
  Future<List<Order>> fetchOrderList();
}

class FakeOrderRepository extends OrderRepository {
  List<Order> orders = [];

  final _rand = Random();

  FakeOrderRepository() : super();

  @override
  Future<Order> fetchOrderDetail(int id) {
    return Future.delayed(Duration(seconds: 1), () {
      return orders.firstWhere((order) => order.id == id);
    });
  }

  @override
  Future<List<Order>> fetchOrderList() {
    return Future.delayed(Duration(seconds: 1), () {
      if (orders.length == 0) {
        _generateOrders();
      }
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
          id: orderId,
          items: List.from(cart.items),
          status: status,
          createdAt: date));
    });
  }

  void _generateOrders() {
    int count = _rand.nextInt(20 + 2) - 2;

    var products = _generateProducts();

    for (var i = 0; i < count; i++) {
      int orderId = i + 1;

      int status = _rand.nextInt(3 + 1) - 1;

      List<CartItem> items = _generateCartItems(products);

      orders.add(new Order(
          id: orderId,
          items: items,
          status: status,
          createdAt: DateTime.now()));
    }
  }

  List<CartItem> _generateCartItems(List<Product> products) {
    int col = _rand.nextInt(8 - 1) + 1;
    return List.generate((col), (index) {
      int quantity = _rand.nextInt(5 - 1) + 1;
      int index = _rand.nextInt(products.length);

      return CartItem(product: products[index], quantity: quantity);
    });
  }

  List<Product> _generateProducts() {
    int col = _rand.nextInt(20 - 1) + 1;
    int id = 1;
    return List.generate((col), (index) {
      int price = _rand.nextInt(5 - 1) + 1;
      var product =
          Product(id: id, name: "Product Name $id", price: price * 10000);
      id++;
      return product;
    });
  }
}
