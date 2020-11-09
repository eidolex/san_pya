import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san_pya/bloc/order_bloc.dart';
import 'package:san_pya/constants/colors.dart';
import 'package:san_pya/constants/spacings.dart';
import 'package:san_pya/models/order.dart';
import 'package:san_pya/widgets/app_bar.dart';
import 'package:san_pya/widgets/bottom_loader.dart';

class OrderHistoryScreen extends StatefulWidget {
  @override
  _OrderHistoryScreenState createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  final _scrollController = ScrollController();

  // ignore: close_sinks
  OrderBloc _orderBloc;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _orderBloc = context.read<OrderBloc>();
    _orderBloc.add(OrderFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Order History"),
      body: BlocConsumer<OrderBloc, OrderState>(
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.status) {
            case OrderStatus.success:
            case OrderStatus.failure:
              return ListView.builder(
                  itemBuilder: (context, index) {
                    // return index >= state.orders.length
                    //     ? BottomLoader()
                    return _OrderListItem(order: state.orders[index]);
                  },
                  itemCount: state.orders.length);
            default:
              return const Center();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) print('bottom');
    // if (_isBottom) _postBloc.add(PostFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}

class _OrderListItem extends StatelessWidget {
  final Order order;

  static const List<String> _months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sept',
    'Oct',
    'Nov',
    'Dec'
  ];

  const _OrderListItem({Key key, @required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accentColor = Theme.of(context).accentColor;
    return Container(
      padding: Edge.e4,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 1, color: BoxBorderColors.primary))),
      child: IntrinsicHeight(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildOrderImage(),
          Padding(padding: Edge.el3),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text("Order Id - ${order.id}",
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                Text(
                  _productListName,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                ),
                Padding(padding: Edge.e4),
                Text("MMK ${order.totalPrice}",
                    style:
                        TextStyle(fontSize: 10, fontWeight: FontWeight.w500)),
              ])),
          Padding(padding: Edge.el3),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(_orderDate,
                  style: TextStyle(fontSize: 8, color: Color(0xFFC4C4C4))),
              FlatButton(
                  minWidth: double.minPositive,
                  height: double.minPositive,
                  onPressed: () => {_detailHandler(context)},
                  child: Text("Detail",
                      style: TextStyle(
                          color: accentColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w500)),
                  padding: EdgeInsets.zero,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
            ],
          )
        ],
      )),
    );
  }

  String get _productListName {
    return "Product 1, Product 2";
  }

  String get _orderDate {
    var date = order.createdAt;
    var month = _months[date.month - 1];
    return "${date.day} $month ${date.year}";
  }

  Widget _buildOrderImage() {
    return AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("graphics/image1.png"), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(8)),
        ));
  }

  void _detailHandler(BuildContext context) {
    print('here');
  }
}
