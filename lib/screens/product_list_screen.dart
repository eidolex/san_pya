import 'package:flutter/material.dart';
import 'package:san_pya/constants/colors.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              border: BorderDirectional(
                  bottom:
                      BorderSide(width: 1, color: BoxBorderColors.primary))),
        ),
        Expanded(
          child: ListView(
            children: [
              _ProductListItem(title: 'Category A'),
              _ProductListItem(title: 'Category B'),
              _ProductListItem(title: 'Category C')
            ],
          ),
        ),
      ],
    );
  }
}

class _ProductListItem extends StatelessWidget {
  final String title;

  const _ProductListItem({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var headline1Style = Theme.of(context).textTheme.headline1;
    return Container(
      // padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          border: BorderDirectional(
              bottom: BorderSide(width: 1, color: BoxBorderColors.primary))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(16),
            child: Text(
              this.title,
              style: headline1Style,
            ),
          ),
          Container(
            height: 220,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(bottom: 16),
              children: [_Product(), _Product()],
            ),
          )
        ],
      ),
    );
  }
}

class _Product extends StatelessWidget {
  void _addToCartHandler() {}

  @override
  Widget build(BuildContext context) {
    var accentColor = Theme.of(context).accentColor;
    var primaryColor = Theme.of(context).primaryColor;
    var radiusCircluar = Radius.circular(8);
    return Container(
      width: 240,
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Card(
            margin: EdgeInsets.all(0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AspectRatio(aspectRatio: 2.8),
                buildProductInfo(accentColor),
                Container(
                  alignment: Alignment.bottomRight,
                  child: buildFlatButton(radiusCircluar, accentColor),
                )
              ],
            ),
          ),
          buildPromoTag(primaryColor),
        ],
      ),
    );
  }

  Widget buildPromoTag(Color primaryColor) {
    return Positioned(
        top: 12,
        left: -8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: primaryColor,
              padding: EdgeInsets.all(8),
              child: Text(
                "Promotion Price",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                  border: Border(
                left: BorderSide(width: 4, color: Colors.transparent),
                top: BorderSide(width: 4, color: MainColors.primaryDarker),
                bottom: BorderSide(width: 4, color: Colors.transparent),
                right: BorderSide(width: 4, color: MainColors.primaryDarker),
              )),
            ),
          ],
        ));
  }

  Widget buildProductInfo(Color accentColor) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 4),
                child: Text(
                  "Product Name",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                "MMK 10000 / viss",
                style: TextStyle(fontSize: 10),
              ),
            ],
          )),
          Container(
            margin: EdgeInsets.only(top: 4),
            child: Text(
              "Instock",
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: accentColor),
            ),
          )
        ],
      ),
    ));
  }

  FlatButton buildFlatButton(Radius radiusCircluar, Color accentColor) {
    return FlatButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
              topStart: radiusCircluar, bottomEnd: radiusCircluar)),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      color: accentColor,
      onPressed: _addToCartHandler,
      child: Text(
        "Add To Cart",
        style: TextStyle(fontSize: 10, color: Colors.white),
      ),
    );
  }
}
