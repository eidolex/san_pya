import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san_pya/bloc/cart_bloc.dart';
import 'package:san_pya/bloc/product_bloc.dart';
import 'package:san_pya/constants/san_pya_fonts.dart';
import 'package:san_pya/constants/san_pya_routes.dart';
import 'package:san_pya/repository/product_repository.dart';
import 'package:san_pya/screens/language_setting_screen.dart';
import 'package:san_pya/screens/login_screen.dart';
import 'package:san_pya/screens/main_screen.dart';
import 'package:san_pya/screens/notification_setting_screen.dart';
import 'package:san_pya/screens/password_setting_screen.dart';
import 'package:san_pya/screens/product_detail_screen.dart';
import 'package:san_pya/constants/colors.dart';
import 'package:san_pya/screens/profile_screen.dart';
import 'package:san_pya/screens/shopping_cart_screen.dart';

void main() {
  runApp(MyApp(
    productResponsitory: FakeProductRepository(),
  ));
}

class MyApp extends StatelessWidget {
  final ProductRepository productResponsitory;

  const MyApp({Key key, @required this.productResponsitory}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    var productBloc = ProductBloc(productRepository: productResponsitory)
      ..add(FetchProductListEvent());
    return MultiBlocProvider(
        providers: [
          BlocProvider<CartBloc>(create: (_) => CartBloc()..add(CartStarted()))
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
          initialRoute: SanPyaRoutes.main,
          routes: {
            SanPyaRoutes.main: (context) => MultiBlocProvider(providers: [
                  BlocProvider<ProductBloc>(create: (_) => productBloc),
                ], child: MainScreen()),
            SanPyaRoutes.login: (context) => LoginScreen(),
            SanPyaRoutes.profile: (context) => ProfileScreen(),
            SanPyaRoutes.passwordSetting: (context) => PasswordSettingScreen(),
            SanPyaRoutes.languageSetting: (context) => LanguageSettingScreen(),
            SanPyaRoutes.notificationSetting: (context) =>
                NotificationSettingScreen(),
            SanPyaRoutes.productDetail: (context) => BlocProvider(
                create: (_) => productBloc, child: ProductDetailScreen()),
            SanPyaRoutes.shoppingCart: (context) => ShoppingCartScreen()
          },
        ));
  }
}
