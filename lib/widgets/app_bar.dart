import 'package:flutter/material.dart';
import 'package:san_pya/constants/san_pya_routes.dart';
import 'package:san_pya/constants/san_pya_icons.dart';

Widget appBar(BuildContext context, String title) {
  var canGoBack = Navigator.canPop(context);
  var currentRoute = ModalRoute.of(context).settings.name;
  var showCart = currentRoute != SanPyaRoutes.shoppingCart;
  return AppBar(
    title: Text(
      title,
      style: TextStyle(fontWeight: FontWeight.w600),
    ),
    actions: [
      if (showCart)
        IconButton(
            icon: Icon(SanPyaIcons.cart, size: 20),
            onPressed: () {
              Navigator.pushNamed(context, SanPyaRoutes.shoppingCart);
            })
    ],
    leading: canGoBack
        ? IconButton(
            icon: Icon(SanPyaIcons.left_arrow, size: 16),
            onPressed: () {
              Navigator.pop(context);
            })
        : IconButton(
            icon: Icon(SanPyaIcons.user, size: 20),
            onPressed: () {
              Navigator.pushNamed(context, SanPyaRoutes.profile);
            }),
    centerTitle: true,
    elevation: 0,
  );
}
