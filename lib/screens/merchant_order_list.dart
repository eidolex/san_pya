import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san_pya/bloc/order_bloc.dart';
import 'package:san_pya/constants/colors.dart';
import 'package:san_pya/constants/san_pya_routes.dart';
import 'package:san_pya/constants/spacings.dart';
import 'package:san_pya/models/order.dart';
import 'package:san_pya/widgets/app_bar.dart';

import '../router.dart';

class MerchantOrderList extends StatefulWidget {
  @override
  _MerchantOrderListState createState() => _MerchantOrderListState();
}

class _MerchantOrderListState extends State<MerchantOrderList> {
  OrderBloc _orderBloc;

  @override
  void initState() {
    super.initState();
    _orderBloc = BlocProvider.of<OrderBloc>(context);

    _orderBloc.add(OrderFetched());
  }

  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;
    var accentColor = Theme.of(context).accentColor;
    return Scaffold(
        appBar: appBar(context, "Order List"),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: Edge.e4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Custom Orders",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  FlatButton(
                    child: Text("Refresh",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: primaryColor)),
                    padding: EdgeInsets.zero,
                    minWidth: double.minPositive,
                    height: double.minPositive,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    onPressed: _refreshHanlder,
                  )
                ],
              ),
            ),
            Padding(
              padding: Edge.e4,
              child: Row(children: [
                _buildOrderStatus(
                    icon: Icons.watch_later,
                    text: "Pending",
                    color: accentColor),
                Padding(padding: Edge.ex3),
                _buildOrderStatus(
                    icon: Icons.check,
                    text: "Accepted",
                    color: MainColors.green),
                Padding(padding: Edge.ex3),
                _buildOrderStatus(
                    icon: Icons.close, text: "Rejected", color: primaryColor),
              ]),
            ),
            Expanded(
              child: BlocBuilder<OrderBloc, OrderState>(
                builder: (context, state) {
                  switch (state.listFetchStatus) {
                    case OrderStatus.success:
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return _MerchantOrderListItem(state.orders[index]);
                        },
                        itemCount: state.orders.length,
                      );
                    default:
                      var size = MediaQuery.of(context).size.width / 3;
                      return Center(
                          child: SizedBox(
                              width: size,
                              height: size,
                              child:
                                  CircularProgressIndicator(strokeWidth: 1.5)));
                  }
                },
              ),
            )
          ],
        ));
  }

  Widget _buildOrderStatus({IconData icon, String text, Color color}) {
    return Flexible(
        flex: 1,
        child: Card(
          elevation: 2,
          // shape: Border.all(width: 1, color: Color(0xFFF0F0F0)),
          margin: EdgeInsets.zero,
          child: Padding(
            padding: Edge.e3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: color, size: 18),
                Padding(padding: Edge.el3),
                Text(text, style: TextStyle(fontSize: 10, color: color))
              ],
            ),
          ),
        ));
  }

  void _refreshHanlder() {
    _orderBloc.add(OrderFetched());
  }
}

class _MerchantOrderListItem extends StatelessWidget {
  final Order order;

  const _MerchantOrderListItem(this.order, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 1, color: BoxBorderColors.primary))),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage("graphics/profile.png"),
        ),
        title: Text("Order ID - ${order.id}",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
        subtitle: Text("1hr",
            style: TextStyle(fontSize: 8, color: Color(0xFFC4C4C4))),
        trailing: _buildIcon(context),
        onTap: () {
          Navigator.pushNamed(context, SanPyaRoutes.marchentOrderDetail,
              arguments: OrderDetailScreenArgs(order.id));
        },
      ),
    );
  }

  Widget _buildIcon(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;
    var accentColor = Theme.of(context).accentColor;
    switch (order.status) {
      case 0:
        return Icon(Icons.watch_later, color: accentColor, size: 22);
      case 1:
        return Icon(Icons.check, color: MainColors.green, size: 22);
      case 2:
        return Icon(Icons.close, color: primaryColor, size: 22);
      default:
        return null;
    }
  }
}
