import 'package:flutter/material.dart';
import 'package:san_pya/constants/san_pya_fonts.dart';
import 'package:san_pya/constants/san_pya_routes.dart';
import 'package:san_pya/screens/language_setting_screen.dart';
import 'package:san_pya/screens/login_screen.dart';
import 'package:san_pya/screens/main_screen.dart';
import 'package:san_pya/screens/notification_setting_screen.dart';
import 'package:san_pya/screens/password_setting_screen.dart';
import 'package:san_pya/screens/product_detail.dart';
import 'package:san_pya/constants/colors.dart';
import 'package:san_pya/screens/profile_screen.dart';
import 'package:san_pya/screens/shopping_cart_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: MainColors.primary,
        accentColor: MainColors.accent,
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        // primarySwatch: Colors.red,
        fontFamily: SanPyaFonts.poppins,

        textTheme: TextTheme(
            headline1: TextStyle(
                color: TextColors.bodyText,
                fontSize: 18,
                fontWeight: FontWeight.w600),
            subtitle1: TextStyle(fontSize: 10),
            bodyText1: TextStyle(color: TextColors.bodyText),
            bodyText2: TextStyle(color: TextColors.bodyText)),

        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: SanPyaRoutes.main,
      routes: {
        SanPyaRoutes.main: (context) => MainScreen(),
        SanPyaRoutes.login: (context) => LoginScreen(),
        SanPyaRoutes.profile: (context) => ProfileScreen(),
        SanPyaRoutes.passwordSetting: (context) => PasswordSettingScreen(),
        SanPyaRoutes.languageSetting: (context) => LanguageSettingScreen(),
        SanPyaRoutes.notificationSetting: (context) =>
            NotificationSettingScreen(),
        SanPyaRoutes.productDetail: (context) => ProductDetail(),
        SanPyaRoutes.shoppingCart: (context) => ShoppingCartScreen()
      },
    );
  }
}
