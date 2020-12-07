import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san_pya/bloc/cart_bloc.dart';
import 'package:san_pya/constants/san_pya_fonts.dart';
import 'package:san_pya/constants/san_pya_routes.dart';
import 'package:san_pya/repository/order_repository.dart';
import 'package:san_pya/repository/product_repository.dart';
import 'package:san_pya/router.dart';
import 'package:san_pya/constants/colors.dart';

void main() {
  runApp(MyApp(
    productResponsitory: FakeProductRepository(),
    orderRepository: FakeOrderRepository(),
  ));
}

class MyApp extends StatefulWidget {
  final ProductRepository productResponsitory;

  final OrderRepository orderRepository;

  MyApp(
      {Key key,
      @required this.productResponsitory,
      @required this.orderRepository})
      : super(key: key);

  @override
  _MyAppState createState() => _MyAppState(
      orderRepository: orderRepository, productRepository: productResponsitory);
}

class _MyAppState extends State<MyApp> {
  final _router;

  _MyAppState({
    @required OrderRepository orderRepository,
    @required ProductRepository productRepository,
  }) : _router = AppRouter(
            orderRepository: orderRepository,
            productRepository: productRepository);

  @override
  void initState() {
    super.initState();
    _router.init();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    return MultiBlocProvider(
        providers: [
          BlocProvider<CartBloc>(
              create: (_) => CartBloc(orderRepository: widget.orderRepository)
                ..add(CartStarted()))
        ],
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primaryColor: MainColors.primary,
              accentColor: MainColors.accent,
              fontFamily: SanPyaFonts.poppins,
              textTheme: TextTheme(
                  headline1: TextStyle(
                      color: TextColors.bodyText,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                  subtitle1: TextStyle(fontSize: 10),
                  bodyText1: TextStyle(color: TextColors.bodyText),
                  bodyText2: TextStyle(color: TextColors.bodyText)),
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            initialRoute: SanPyaRoutes.newsDetail,
            onGenerateRoute: _router.onGenerateRoute));
  }

  @override
  void dispose() {
    _router.dispose();
    super.dispose();
  }
}
