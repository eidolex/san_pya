import 'package:meta/meta.dart';
import 'package:san_pya/models/product.dart';

class CartItem {
  Product product;

  int quantity;

  CartItem({@required this.product, @required this.quantity});
}
