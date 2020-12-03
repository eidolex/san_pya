import 'package:flutter/material.dart';
import 'package:san_pya/constants/colors.dart';
import 'package:san_pya/constants/san_pya_fonts.dart';
import 'package:san_pya/constants/san_pya_icons.dart';
import 'package:san_pya/screens/merchant_order_list_screen.dart';
import 'package:san_pya/screens/merchant_product_list_screen.dart';
import 'package:san_pya/screens/news_screen.dart';
import 'package:san_pya/widgets/app_bar.dart';

class MerchantMainScreen extends StatefulWidget {
  @override
  _MerchantMainScreenState createState() => _MerchantMainScreenState();
}

class _MerchantMainScreenState extends State<MerchantMainScreen> {
  int _selectedIndex;

  int _defaultIndex = 0;

  static const _titleTextStyle = TextStyle(fontWeight: FontWeight.w600);

  static List<Widget> _title = <Widget>[
    // 'Express',
    RichText(
        text: TextSpan(children: [
      TextSpan(
        text: 'pHjy',
        style: TextStyle(
            fontFamily: SanPyaFonts.w02art,
            fontSize: 30,
            fontWeight: FontWeight.w700),
      ),
      TextSpan(
          text: ' Express',
          style: TextStyle(
              fontFamily: SanPyaFonts.poppins,
              fontSize: 17,
              fontWeight: FontWeight.w300))
    ])),
    Text(
      "Order List",
      style: _titleTextStyle,
    ),
    Text(
      "News & Promotions",
      style: _titleTextStyle,
    ),
  ];

  static List<Widget> _widgetOptions = <Widget>[
    MerchantProductListScreen(),
    MerchantOrderListScreen(),
    NewsScreen(),
  ];

  void _onTabTapHandler(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  initState() {
    super.initState();
    _selectedIndex = _defaultIndex;
  }

  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;
    var labelStyle = TextStyle(
      fontSize: 8,
      fontWeight: FontWeight.w500,
    );
    return Scaffold(
      appBar: merchantAppBarCustomTitle(context, _title[_selectedIndex]),
      bottomNavigationBar: buildBottomNavigationBar(primaryColor, labelStyle),
      body: _widgetOptions[_selectedIndex],
    );
  }

  BottomNavigationBar buildBottomNavigationBar(
      Color primaryColor, TextStyle labelStyle) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: _onTabTapHandler,
      selectedItemColor: primaryColor,
      showUnselectedLabels: true,
      unselectedItemColor: TabColors.inactive,
      unselectedLabelStyle: labelStyle,
      selectedLabelStyle: labelStyle,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            SanPyaIcons.list,
          ),
          label: "Product List",
        ),
        BottomNavigationBarItem(
            icon: Icon(
              SanPyaIcons.notes,
            ),
            label: "Order List"),
        BottomNavigationBarItem(
            icon: Icon(
              SanPyaIcons.newspaper,
            ),
            label: "News & Promotions"),
      ],
    );
  }
}
