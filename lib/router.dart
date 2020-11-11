import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san_pya/repository/order_repository.dart';
import 'package:san_pya/repository/product_repository.dart';
import 'package:san_pya/screens/language_setting_screen.dart';
import 'package:san_pya/screens/login_screen.dart';
import 'package:san_pya/screens/main_screen.dart';
import 'package:san_pya/screens/notification_setting_screen.dart';
import 'package:san_pya/screens/order_detail_screen.dart';
import 'package:san_pya/screens/order_history_screen.dart';
import 'package:san_pya/screens/password_setting_screen.dart';
import 'package:san_pya/screens/product_detail_screen.dart';
import 'package:san_pya/screens/profile_screen.dart';
import 'package:san_pya/screens/shopping_cart_screen.dart';

import 'bloc/order_bloc.dart';
import 'bloc/product_bloc.dart';
import 'constants/san_pya_routes.dart';

class AppRouter {
  final OrderBloc _orderBloc;
  final ProductBloc _productBloc;

  AppRouter(
      {@required OrderRepository orderRepository,
      @required ProductRepository productRepository})
      : _orderBloc = OrderBloc(orderRepository: orderRepository),
        _productBloc = ProductBloc(productRepository: productRepository);

  init() {
    _productBloc.add(FetchProductListEvent());
  }

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SanPyaRoutes.main:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(providers: [
            BlocProvider.value(value: _productBloc),
          ], child: MainScreen()),
        );
      case SanPyaRoutes.login:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case SanPyaRoutes.profile:
        return MaterialPageRoute(builder: (context) => ProfileScreen());
      case SanPyaRoutes.passwordSetting:
        return MaterialPageRoute(builder: (context) => PasswordSettingScreen());
      case SanPyaRoutes.languageSetting:
        return MaterialPageRoute(builder: (context) => LanguageSettingScreen());
      case SanPyaRoutes.notificationSetting:
        return MaterialPageRoute(
            builder: (context) => NotificationSettingScreen());
      case SanPyaRoutes.orderHistory:
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                  value: _orderBloc,
                  child: OrderHistoryScreen(),
                ));
      case SanPyaRoutes.orderDetail:
        final OrderDetailScreenArgs args = settings.arguments;
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                  value: _orderBloc,
                  child: OrderDetailScreen(id: args.id),
                ));
      case SanPyaRoutes.productDetail:
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                  value: _productBloc,
                  child: ProductDetailScreen(),
                ));
      case SanPyaRoutes.shoppingCart:
        return MaterialPageRoute(builder: (context) => ShoppingCartScreen());
      default:
        return null;
    }
  }

  void dispose() {
    _orderBloc.close();
    _productBloc.close();
  }
}
