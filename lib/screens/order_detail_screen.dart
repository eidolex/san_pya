import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san_pya/bloc/order_bloc.dart';
import 'package:san_pya/constants/colors.dart';
import 'package:san_pya/constants/spacings.dart';
import 'package:san_pya/models/cart_item.dart';
import 'package:san_pya/utils/format_date.dart';
import 'package:san_pya/widgets/alert_message.dart';
import 'package:san_pya/widgets/app_bar.dart';

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
                          return _OrderDetailListItem(
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

class _OrderDetailListItem extends StatelessWidget {
  final CartItem item;

  const _OrderDetailListItem({Key key, this.item}) : super(key: key);

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

class OrderDetailScreenArgs {
  final int id;

  OrderDetailScreenArgs(this.id);
}
