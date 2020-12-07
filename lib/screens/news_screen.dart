import 'package:flutter/material.dart';
import 'package:san_pya/constants/colors.dart';
import 'package:san_pya/constants/san_pya_fonts.dart';
import 'package:san_pya/constants/spacings.dart';
import 'package:san_pya/utils/grid_utils.dart';

List<Widget> _tabList = [
  Tab(text: "All"),
  Tab(text: "News"),
  Tab(text: "Promotion")
];

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => new _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> with TickerProviderStateMixin {
  TabController tabController;

  @override
  Widget build(BuildContext context) {
    tabController = new TabController(length: 3, vsync: this);

    var tabBarItem = new TabBar(
      labelStyle: TextStyle(fontSize: 16, fontFamily: SanPyaFonts.poppins),
      labelColor: MainColors.primary,
      unselectedLabelColor: TextColors.bodyText,
      indicatorColor: MainColors.primary,
      tabs: _tabList,
    );

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
            padding: Edge.ex5,
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Expanded(child: new Container()),
                  tabBarItem
                ],
              ),
            ),
          ),
        ),
        body: new TabBarView(children: [
          buildAllItems(),
          buildAllItems(),
          buildAllItems(),
        ]),
      ),
    );
  }

  GridView buildAllItems() {
    return GridView.builder(
      padding: Edge.e4,
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
        crossAxisCount: 2,
        height: 300,
        crossAxisSpacing: Spacing.s3,
        mainAxisSpacing: Spacing.s3,
      ),
      itemBuilder: (BuildContext context, int index) {
        return new GestureDetector(
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            elevation: 1.0,
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildPhoto(),
                Padding(
                  padding: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("23 March 2019",
                          style: TextStyle(
                              color: TextColors.bodyText,
                              fontSize: 11,
                              fontWeight: FontWeight.w300)),
                      Text(
                        "PROMOTION OF ADIPISCING ELIT, SED DO EIUSMOD",
                        style: TextStyle(
                            color: TextColors.bodyText,
                            fontSize: 13,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                          "Duis aute irure dolor in reprehenderit in volupate velite esse cillum dolore eu fugiat nulla",
                          style: TextStyle(
                              color: TextColors.bodyText,
                              fontSize: 11,
                              fontWeight: FontWeight.w400)),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "123 likes",
                            style: TextStyle(
                                color: TextColors.bodyText,
                                fontSize: 11,
                                fontWeight: FontWeight.w400),
                          ),
                          Text("45 comments",
                              style: TextStyle(
                                  color: TextColors.bodyText,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  AspectRatio buildPhoto() {
    return AspectRatio(
        aspectRatio: 18.0 / 11.0,
        child: Image.asset('graphics/image1.png', fit: BoxFit.cover));
  }
}
