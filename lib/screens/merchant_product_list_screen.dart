import 'package:flutter/material.dart';
import 'package:san_pya/constants/spacings.dart';

class MerchantProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        var headline1 = Theme.of(context).textTheme.headline1;
        if (index == 0) {
          return Padding(
            padding: Edge.e4,
            child: Text("Selling Products", style: headline1),
          );
        }
        return _ProductListItem();
      },
      itemCount: 10,
    );
  }
}

class _ProductListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      margin: EdgeInsets.only(
          bottom: Spacing.s4, left: Spacing.s4, right: Spacing.s4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(6)),
            child: Image.asset(
              "graphics/image1.png",
              fit: BoxFit.cover,
              width: 100,
              height: 100,
            ),
          ),
          Expanded(
              child: Padding(
            padding: Edge.e3,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Product Name",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              Text("MMK 10000 / viss", style: TextStyle(fontSize: 10))
            ]),
          )),
          FlatButton(
              minWidth: double.minPositive,
              height: double.minPositive,
              onPressed: () => () {},
              child: Text("Edit",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w500)),
              padding:
                  EdgeInsets.symmetric(horizontal: 0, vertical: Spacing.s3),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
          Padding(padding: Edge.el3)
        ],
      ),
    );
  }
}
