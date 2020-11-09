import 'dart:math';

import 'package:san_pya/models/product.dart';

abstract class ProductRepository {
  Future<Product> fetchProductDetailById(int id);

  Future<List<List<Product>>> fetchProducts();
}

class FakeProductRepository extends ProductRepository {
  @override
  Future<Product> fetchProductDetailById(int id) {
    return Future.delayed(Duration(seconds: 1), () {
      return Product(id: id, name: "Product Name $id", price: 10000);
    });
  }

  @override
  Future<List<List<Product>>> fetchProducts() {
    return Future.delayed(Duration(seconds: 1), () {
      final random = Random();

      int row = random.nextInt(5 - 2) + 2;
      int id = 1;
      return List.generate(row, (_) {
        int col = random.nextInt(10 - 1) + 1;
        return List.generate((col), (index) {
          int price = random.nextInt(5 - 1) + 1;
          var product =
              Product(id: id, name: "Product Name $id", price: price * 10000);
          id++;
          return product;
        });
      });
    });
  }
}
