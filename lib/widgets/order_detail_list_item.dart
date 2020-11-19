import 'package:flutter/material.dart';
import 'package:san_pya/constants/colors.dart';
import 'package:san_pya/constants/spacings.dart';
import 'package:san_pya/models/cart_item.dart';

class OrderDetailListItem extends StatelessWidget {
  final CartItem item;

  const OrderDetailListItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Edge.e4,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: BoxBorderColors.primary, width: 1))),
      child: IntrinsicHeight(
        child: Row(
          children: [
            _buildItemImage(),
            Padding(padding: Edge.el3),
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text.rich(
                      TextSpan(children: [
                        TextSpan(
                            text: item.product.name,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600)),
                        TextSpan(
                            text: " (small)", style: TextStyle(fontSize: 10)),
                      ]),
                      maxLines: 2,
                      overflow: TextOverflow.clip),
                  Text("MMK ${item.product.price} / viss",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 10)),
                ])),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xFFEAEAEA)),
                  child: Text(
                    "${item.quantity}",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                    padding: Edge.et4,
                    child: Text("MMK ${item.product.price * item.quantity}",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500)))
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildItemImage() {
    return AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("graphics/image1.png"), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(8)),
        ));
  }
}
