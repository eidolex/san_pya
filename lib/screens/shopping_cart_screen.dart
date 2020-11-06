import 'package:flutter/material.dart';
import 'package:san_pya/widgets/app_bar.dart';

class ShoppingCartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Shopping Cart"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(16, 16, 16, 4),
            child: Text(
              "Your Cart",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Text(
                "You have 5 items in your cart",
                style: TextStyle(fontSize: 10),
              )),
        ],
      ),
    );
  }
}
