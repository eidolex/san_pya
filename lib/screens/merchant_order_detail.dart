import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san_pya/bloc/order_bloc.dart';
import 'package:san_pya/constants/colors.dart';
import 'package:san_pya/constants/spacings.dart';
import 'package:san_pya/widgets/app_bar.dart';
import 'package:san_pya/widgets/block_button.dart';
import 'package:san_pya/widgets/order_detail_list_item.dart';

class MerchantOrderDetail extends StatefulWidget {
  final int id;

  const MerchantOrderDetail({Key key, @required this.id}) : super(key: key);

  @override
  _MerchantOrderDetailState createState() => _MerchantOrderDetailState();
}

class _MerchantOrderDetailState extends State<MerchantOrderDetail> {
  OrderBloc _orderBloc;

  @override
  void initState() {
    super.initState();
    _orderBloc = BlocProvider.of<OrderBloc>(context);

    _orderBloc.add(OrderDetailFetched(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: appBar(context, "Order List"),
      body: BlocConsumer<OrderBloc, OrderState>(listener: (context, state) {
        if (state.detailFetchStatus == OrderStatus.failure) {
          Navigator.pop(context);
        }
      }, builder: (context, state) {
        switch (state.detailFetchStatus) {
          case OrderStatus.success:
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildOrderHeader(state),
                Padding(
                  padding: EdgeInsets.only(
                      left: Spacing.s4, right: Spacing.s4, bottom: Spacing.s4),
                  child: Text("Order Items",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                ),
                Expanded(
                    child: ListView.builder(
                  itemBuilder: (context, index) {
                    return OrderDetailListItem(item: state.order.items[index]);
                  },
                  itemCount: state.order.items.length,
                )),
                Padding(
                  padding: Edge.e4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                      Text(
                        "MMK ${state.order.totalPrice}",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: Edge.e4,
                  child: Row(
                    children: [
                      _buildOrderButton(
                        text: "Reject",
                        color: primaryColor,
                        onPressed: () => _rejectHandler(context),
                      ),
                      Padding(padding: Edge.e2),
                      _buildOrderButton(
                        text: "Accept",
                        color: MainColors.green,
                        onPressed: () => _acceptHandler(context),
                      ),
                    ],
                  ),
                )
              ],
            );
          default:
            var size = MediaQuery.of(context).size.width / 3;
            return Center(
                child: SizedBox(
                    width: size,
                    height: size,
                    child: CircularProgressIndicator(strokeWidth: 1.5)));
        }
      }),
    );
  }

  Widget _buildOrderButton({String text, Color color, VoidCallback onPressed}) {
    return Flexible(
        flex: 1,
        child: SizedBox(
          width: double.infinity,
          height: 44,
          child: OutlineButton(
            borderSide: BorderSide(color: color),
            textColor: color,
            child: Text(text,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
            onPressed: onPressed,
          ),
        ));
  }

  Widget _buildOrderHeader(OrderState state) {
    return Padding(
      padding: Edge.e4,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: Spacing.s2),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Color(0xFFE5E5E5)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage("graphics/profile.png"),
          ),
          title: Text("Order ID - ${state.order.id}",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
          trailing: Text("1 hr ago",
              style: TextStyle(fontSize: 8, color: Color(0xFFC4C4C4))),
        ),
      ),
    );
  }

  void _rejectHandler(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return _OrderRejectDialog();
        });
  }

  void _acceptHandler(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return _OrderAcceptDialog();
        });
  }
}

class _OrderRejectDialog extends StatefulWidget {
  const _OrderRejectDialog({Key key}) : super(key: key);

  @override
  __OrderRejectDialogState createState() => __OrderRejectDialogState();
}

class __OrderRejectDialogState extends State<_OrderRejectDialog> {
  OrderRejectReason _reason = OrderRejectReason.price;

  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;
    var accentColor = Theme.of(context).accentColor;
    var size = 62.0;
    var halfSize = size / 2;
    return Dialog(
      child: IntrinsicHeight(
        child: Stack(
          overflow: Overflow.visible,
          alignment: Alignment.topCenter,
          children: [
            Positioned(
                top: 0 - halfSize + 6,
                child: Container(
                  width: size,
                  height: size,
                  child: Icon(
                    Icons.error,
                    color: primaryColor,
                    size: size,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(
                  top: halfSize + 16 + 6,
                  left: Spacing.s4,
                  right: Spacing.s4,
                  bottom: Spacing.s4),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text.rich(TextSpan(
                        text: "Please give a reason why you want to ",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                        children: [
                          TextSpan(
                              text: "Reject",
                              style: TextStyle(color: primaryColor)),
                          TextSpan(text: " this order?")
                        ])),
                    Padding(padding: Edge.et4),
                    Wrap(
                      direction: Axis.horizontal,
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: [
                        buildRadio(
                          primaryColor: primaryColor,
                          value: OrderRejectReason.price,
                          text: "Price Changed",
                        ),
                        buildRadio(
                          primaryColor: primaryColor,
                          value: OrderRejectReason.out,
                          text: "Out of stock",
                        ),
                        buildRadio(
                          primaryColor: primaryColor,
                          value: OrderRejectReason.other,
                          text: "Other",
                        ),
                      ],
                    ),
                    if (_reason == OrderRejectReason.other)
                      Padding(padding: Edge.et4),
                    if (_reason == OrderRejectReason.other)
                      TextField(
                        style: TextStyle(fontSize: 14),
                        decoration: InputDecoration(
                            labelText: "Type here",
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            contentPadding: Edge.e3,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.zero),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: InputBorderColors.textInput)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.zero),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: InputBorderColors.textInput))),
                      ),
                    Padding(padding: Edge.et4),
                    _AlertButton(
                      text: "Send",
                      color: accentColor,
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Padding(padding: Edge.et3),
                    _AlertButton(
                      text: "Cancle",
                      textColor: Color(0xFFD0D0D0),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildRadio({
    @required primaryColor,
    @required OrderRejectReason value,
    @required String text,
  }) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      SizedBox(
        width: 24,
        height: 24,
        child: Radio(
          activeColor: primaryColor,
          value: value,
          groupValue: _reason,
          onChanged: (value) {
            setState(() {
              _reason = value;
            });
          },
        ),
      ),
      Padding(padding: Edge.el2),
      Text(
        text,
        style: TextStyle(fontSize: 10),
      )
    ]);
  }
}

class _OrderAcceptDialog extends StatelessWidget {
  const _OrderAcceptDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accentColor = Theme.of(context).accentColor;
    return Dialog(
      child: Padding(
        padding: Edge.e4,
        child: IntrinsicHeight(
          child: Column(
            children: [
              Padding(
                padding: Edge.e4,
                child: Center(
                  child: SizedBox(
                    width: 48,
                    height: 48,
                    child: CircleAvatar(
                      backgroundColor: MainColors.green,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
              Text("Congratulations !!!",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              Text("Order is successfully accepted",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              Padding(padding: Edge.ey4),
              _AlertButton(
                text: "OK",
                color: accentColor,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AlertButton extends StatelessWidget {
  const _AlertButton({
    Key key,
    this.color,
    @required this.text,
    @required this.textColor,
    @required this.onPressed,
  }) : super(key: key);

  final String text;

  final Color color;

  final Color textColor;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 44,
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        color: color ?? null,
        child: Text(text, style: TextStyle(color: textColor)),
        onPressed: onPressed,
      ),
    );
  }
}

enum OrderRejectReason { price, out, other }
