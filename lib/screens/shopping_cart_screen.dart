import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san_pya/bloc/cart_bloc.dart';
import 'package:san_pya/constants/colors.dart';
import 'package:san_pya/constants/spacings.dart';
import 'package:san_pya/models/cart_item.dart';
import 'package:san_pya/widgets/app_bar.dart';
import 'package:san_pya/widgets/quantity_input.dart';

class ShoppingCartScreen extends StatelessWidget {
  void _changeProductQuantity(
      BuildContext context, int index, int, int newVal) {
    context.read<CartBloc>().add(CartChangeItemQuantity(index, newVal));
  }

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
              var primaryColor = Theme.of(context).primaryColor;
              var item = items[index];
              var price = item.quantity * item.product.price;
              return Padding(
                padding: Edge.e4,
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(
                          aspectRatio: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("graphics/image1.png"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(8)),
                          )),
                      Padding(padding: Edge.el3),
                      ConstrainedBox(
                        constraints: BoxConstraints(minWidth: 200),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.product.name,
                              overflow: TextOverflow.clip,
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w600),
                            ),
                            Text("MMK ${item.product.price} / viss",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 10)),
                            Padding(padding: Edge.e3),
                            QuantityInput(
                              width: 140,
                              initialVaule: item.quantity,
                              onChanged: (oldVal, newVal) =>
                                  _changeProductQuantity(
                                      context, index, oldVal, newVal),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                            FlatButton(
                                minWidth: double.minPositive,
                                height: double.minPositive,
                                onPressed: () {
                                  context
                                      .read<CartBloc>()
                                      .add(CartItemRemoved(index));
                                },
                                child: Text("Remove",
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500)),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: Spacing.s3),
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap),
                            Text(
                              "MMK $price",
                              maxLines: 2,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ]))
                    ],
                  ),
                ),
              );
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
