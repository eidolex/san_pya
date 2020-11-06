import 'package:flutter/material.dart';
import 'package:san_pya/constants/colors.dart';
import 'package:san_pya/constants/san_pya_icons.dart';
import 'package:san_pya/screens/home_screen.dart';
import 'package:san_pya/screens/news_screen.dart';
import 'package:san_pya/screens/product_list_screen.dart';
import 'package:san_pya/screens/search_screen.dart';
import 'package:san_pya/widgets/app_bar.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex;

  int _defaultIndex = 0;

  static const List<String> _title = <String>[
    'Express',
    'Product List',
    'News & Promotions',
    'Search'
  ];

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ProductListScreen(),
    NewsScreen(),
    SearchScreen(),
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
      appBar: appBar(context, _title[_selectedIndex]),
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
            SanPyaIcons.home,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
            icon: Icon(
              SanPyaIcons.list,
            ),
            label: "Product List"),
        BottomNavigationBarItem(
            icon: Icon(
              SanPyaIcons.newspaper,
            ),
            label: "News & Promotions"),
        BottomNavigationBarItem(
            icon: Icon(
              SanPyaIcons.search,
            ),
            label: "Search"),
      ],
    );
  }
}
