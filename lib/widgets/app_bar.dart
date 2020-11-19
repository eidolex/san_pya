import 'package:flutter/material.dart';
import 'package:san_pya/constants/san_pya_routes.dart';
import 'package:san_pya/constants/san_pya_icons.dart';
import 'package:san_pya/router.dart';

AppBar appBar(BuildContext context, String title, {bool showCart = true}) {
  return _buildAppBar(
      context,
      Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      showCart);
}

AppBar appBarCustomTitle(BuildContext context, Widget title,
    {bool showCart = true}) {
  return _buildAppBar(context, title, showCart);
}

AppBar _buildAppBar(BuildContext context, Widget title, bool showCart) {
  return AppBar(
    title: title,
    actions: [if (showCart) _buildCartButton(context)],
    leading: _buildLeadingButton(context),
    centerTitle: true,
    elevation: 0,
  );
}

Widget _buildCartButton(BuildContext context) {
  return IconButton(
      icon: Icon(SanPyaIcons.cart, size: 20),
      onPressed: () {
        Navigator.pushNamed(context, SanPyaRoutes.shoppingCart);
      });
}

Widget _buildLeadingButton(BuildContext context) {
  var canGoBack = Navigator.canPop(context);
  return canGoBack
      ? IconButton(
          icon: Icon(SanPyaIcons.left_arrow, size: 16),
          onPressed: () {
            Navigator.pop(context);
          })
      : IconButton(
          icon: Icon(SanPyaIcons.user, size: 20),
          onPressed: () {
            Navigator.pushNamed(context, SanPyaRoutes.profile);
          });
}

AppBar merchantAppBar(BuildContext context, String title,
    {bool showProfile = true}) {
  return _buildMerchantAppBar(
      context,
      Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      showProfile);
}

AppBar merchantAppBarCustomTitle(BuildContext context, Widget title,
    {bool showProfile = true}) {
  return _buildMerchantAppBar(context, title, showProfile);
}

AppBar _buildMerchantAppBar(
    BuildContext context, Widget title, bool showProfile) {
  var canGoBack = Navigator.canPop(context);
  return AppBar(
    title: title,
    actions: [
      if (showProfile)
        IconButton(
            icon: Icon(SanPyaIcons.user, size: 20),
            onPressed: () {
              Navigator.pushNamed(context, SanPyaRoutes.profile,
                  arguments: ProfileScreenArgs(true));
            })
    ],
    leading: canGoBack
        ? IconButton(
            icon: Icon(SanPyaIcons.left_arrow, size: 16),
            onPressed: () {
              Navigator.pop(context);
            })
        : null,
    // centerTitle: true,
    elevation: 0,
  );
}
