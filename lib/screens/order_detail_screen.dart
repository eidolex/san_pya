import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san_pya/bloc/order_bloc.dart';
import 'package:san_pya/constants/colors.dart';
import 'package:san_pya/constants/spacings.dart';
import 'package:san_pya/models/cart_item.dart';
import 'package:san_pya/utils/format_date.dart';
import 'package:san_pya/widgets/alert_message.dart';
import 'package:san_pya/widgets/app_bar.dart';
import 'package:san_pya/widgets/order_detail_list_item.dart';

class OrderDetailScreen extends StatefulWidget {
  final int id;

  const OrderDetailScreen({Key key, @required this.id}) : super(key: key);

  @override
  _OrderDetailScreenState createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  OrderBloc _orderBloc;

  @override
  void initState() {
    super.initState();
    _orderBloc = context.read<OrderBloc>();
    _fetchOrder();
  }

  void _fetchOrder() {
    _orderBloc.add(OrderDetailFetched(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Order History"),
      body: BlocConsumer<OrderBloc, OrderState>(
        listener: (context, state) {
          if (state.detailFetchStatus == OrderStatus.failure) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          switch (state.detailFetchStatus) {
            case OrderStatus.success:
              return Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    buildOrderStatus(),
                    Padding(
                      padding: Edge.e4,
                      child: Text("Order ID - ${state.order.id}",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                    ),
                    Expanded(
                        child: ListView.builder(
                      itemBuilder: (context, index) {
                        if (index < state.order.items.length) {
                          return OrderDetailListItem(
                              item: state.order.items[index]);
                        } else {
                          return Padding(
                            padding: Edge.e4,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Total",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                                Text("MMK ${state.order.totalPrice}",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600))
                              ],
                            ),
                          );
                        }
                      },
                      itemCount: state.order.items.length + 1,
                    ))
                  ],
                ),
              );
            default:
              var size = MediaQuery.of(context).size.width / 3;
              return Center(
                  child: SizedBox(
                      width: size,
                      height: size,
                      child: CircularProgressIndicator(strokeWidth: 1.5)));
          }
        },
      ),
    );
  }

  AlertMessage buildOrderStatus() {
    return AlertMessage(
      child: Padding(
        padding: Edge.ex4,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(children: [
              Container(
                child: Icon(
                  Icons.check_circle,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              Padding(padding: Edge.el3),
              Text(
                "Delivered",
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ]),
            Text(formatDate(DateTime.now()),
                style: TextStyle(fontSize: 8, color: Colors.white))
          ],
        ),
      ),
      color: Colors.green,
      backgroundColor: Colors.white,
    );
  }
}
