import 'package:flutter/material.dart';
import 'package:san_pya/constants/spacings.dart';
import 'package:san_pya/widgets/app_bar.dart';

class ShoppingCartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var headline1 = textTheme.headline1;
    var subTitle1 = textTheme.subtitle1;
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
              style: headline1,
            ),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(s4, 0, s4, s4),
              child: Text(
                "You have 5 items in your cart",
                style: subTitle1,
              )),
        ],
      ),
    );
  }
}
