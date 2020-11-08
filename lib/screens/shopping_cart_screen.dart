import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san_pya/bloc/cart_bloc.dart';
import 'package:san_pya/constants/colors.dart';
import 'package:san_pya/constants/spacings.dart';
import 'package:san_pya/models/cart_item.dart';
import 'package:san_pya/widgets/app_bar.dart';

class ShoppingCartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var headline1 = textTheme.headline1;
    var subTitle1 = textTheme.subtitle1;
    return Scaffold(
      appBar: appBar(context, "Shopping Cart"),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoaded) {
            print(state.cart.items);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitle(headline1: headline1),
                _buildSubTitle(state.cart.items.length, subTitle1: subTitle1),
                _buildCartItemList(state.cart.items),
              ],
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(headline1: headline1),
              _buildSubTitle(0, subTitle1: subTitle1),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCartItemList(List<CartItem> items) {
    return Expanded(
        child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                Divider(height: 1, color: BoxBorderColors.primary),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Text(items[index].product.name);
            }));
  }

  Widget _buildTitle({TextStyle headline1}) {
    const s4 = Spacing.s4;
    return Container(
      margin: EdgeInsets.fromLTRB(s4, s4, s4, Spacing.s2),
      child: Text(
        "Your Cart",
        style: headline1,
      ),
    );
  }

  Widget _buildSubTitle(int qty, {TextStyle subTitle1}) {
    const s4 = Spacing.s4;
    return Container(
        margin: EdgeInsets.fromLTRB(s4, 0, s4, s4),
        child: Text(
          "You have $qty items in your cart",
          style: subTitle1,
        ));
  }
}
