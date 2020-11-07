import 'package:flutter/material.dart';
import 'package:san_pya/constants/spacings.dart';
import 'package:san_pya/widgets/app_bar.dart';

class ShoppingCartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const s4 = Spacing.s4;
    return Scaffold(
      appBar: appBar(context, "Shopping Cart"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(s4, s4, s4, Spacing.s2),
            child: Text(
              "Your Cart",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(s4, 0, s4, s4),
              child: Text(
                "You have 5 items in your cart",
                style: TextStyle(fontSize: 10),
              )),
        ],
      ),
    );
  }
}
