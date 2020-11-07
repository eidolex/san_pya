import 'package:flutter/material.dart';
import 'package:san_pya/constants/colors.dart';
import 'package:san_pya/constants/san_pya_routes.dart';
import 'package:san_pya/constants/spacings.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: Edge.e4,
          decoration: BoxDecoration(
              border: BorderDirectional(
                  bottom:
                      BorderSide(width: 1, color: BoxBorderColors.primary))),
          // TODO: design product list filter
        ),
        Expanded(
          child: ListView.separated(
            padding: Edge.eb4,
            itemCount: 3,
            separatorBuilder: (BuildContext context, int index) =>
                Divider(height: 1, color: BoxBorderColors.primary),
            itemBuilder: (BuildContext context, int index) {
              return _ProductListItem(title: 'Category A');
            },
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: Edge.e4,
          child: Text(
            this.title,
            style: headline1Style,
          ),
        ),
        Container(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: Edge.eb4,
            itemCount: 10,
            itemBuilder: (BuildContext context, int position) {
              return _Product();
            },
          ),
        )
      ],
    );
  }
}

class _Product extends StatelessWidget {
  void _addToCartHandler() {}

  void _itemTapHandler(BuildContext context) {
    Navigator.pushNamed(context, SanPyaRoutes.productDetail);
  }

  @override
  Widget build(BuildContext context) {
    var accentColor = Theme.of(context).accentColor;
    var primaryColor = Theme.of(context).primaryColor;
    var radiusCircluar = Radius.circular(8);
    return Container(
      width: 230,
      margin: Edge.ex4,
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Card(
            margin: EdgeInsets.zero,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: InkWell(
              onTap: () => _itemTapHandler(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildCoverPhoto(),
                  buildProductInfo(accentColor),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: buildFlatButton(radiusCircluar, accentColor),
                  )
                ],
              ),
            ),
          ),
          buildPromoTag(primaryColor),
        ],
      ),
    );
  }

  Widget buildCoverPhoto() {
    return AspectRatio(
      aspectRatio: 21 / 9,
      child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8), topRight: Radius.circular(8)),
          child: Image(
            width: double.infinity,
            image: AssetImage('graphics/image1.png'),
            fit: BoxFit.cover,
          )),
    );
  }

  Widget buildPromoTag(Color primaryColor) {
    const offset = 8.0;
    const borderWidth = offset / 2;
    var ribbonBorderTransparentSide =
        BorderSide(width: borderWidth, color: Colors.transparent);
    var ribbonBorderSide =
        BorderSide(width: borderWidth, color: MainColors.primaryDarker);
    return Positioned(
        top: 12,
        left: 0.0 - offset,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: primaryColor,
              padding: Edge.e3,
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
              width: offset,
              height: offset,
              decoration: BoxDecoration(
                  border: Border(
                left: ribbonBorderTransparentSide,
                bottom: ribbonBorderTransparentSide,
                top: ribbonBorderSide,
                right: ribbonBorderSide,
              )),
            ),
          ],
        ));
  }

  Widget buildProductInfo(Color accentColor) {
    return Expanded(
        child: Padding(
      padding: Edge.e3,
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
                margin: Edge.eb2,
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
            margin: Edge.et2,
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
