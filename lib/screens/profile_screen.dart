import 'package:flutter/material.dart';
import 'package:san_pya/constants/san_pya_icons.dart';
import 'package:san_pya/constants/san_pya_routes.dart';
import 'package:san_pya/constants/spacings.dart';
import 'package:san_pya/widgets/app_bar.dart';

class ProfileScreen extends StatelessWidget {
  static const _leadingTextStyle =
      TextStyle(fontWeight: FontWeight.w500, fontSize: 14);

  static const _trailingTextStyle = TextStyle(
      color: Color(0xFF9E9E9E), fontSize: 12, fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: appBar(context, "Profile"),
      body: ListView(
        children: [
          _buildListTile("Phone Number", text: "09254052523", showIcon: false),
          _buildListTile(
            "Change Password",
            onPressed: () {
              Navigator.pushNamed(context, SanPyaRoutes.passwordSetting);
            },
          ),
          _buildSubListTile("Setting"),
          _buildListTile("Order History", onPressed: () {}),
          _buildListTile("Language", text: "English", onPressed: () {}),
          _buildListTile("Notification", onPressed: () {}),
          _buildSubListTile("Support"),
          _buildListTile("Help Center", onPressed: () {}),
          _buildListTile("Privacy & Policy", onPressed: () {}),
          Container(
            margin: Edge.et5,
            decoration: BoxDecoration(
                border: Border.symmetric(
                    horizontal:
                        BorderSide(width: 1, color: Color(0xFFEDEDED)))),
            child: ListTile(
              title: Text(
                "Log Out",
                style: _leadingTextStyle.apply(color: primaryColor),
              ),
              onTap: () => {
                Navigator.pushNamedAndRemoveUntil(
                    context, SanPyaRoutes.login, (route) => false)
              },
            ),
          ),
          Container(
            margin: Edge.ey4,
            child: Center(
              child: Text(
                "version 1.0",
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFB2B2B2)),
              ),
            ),
          )
        ],
      ),
    );
  }

  ListTile _buildSubListTile(String title) {
    return ListTile(title: Text(title, style: _trailingTextStyle));
  }

  Widget _buildListTile(String title,
      {bool showIcon = true, String text, VoidCallback onPressed}) {
    Widget trailing;
    if (showIcon && text != null) {
      trailing = Row(mainAxisSize: MainAxisSize.min, children: [
        Container(
            margin: Edge.er2,
            child: Text(
              text,
              style: _trailingTextStyle,
            )),
        Icon(
          SanPyaIcons.next,
          size: 18,
        )
      ]);
    } else if (showIcon) {
      trailing = Icon(SanPyaIcons.next, size: 16);
    } else if (text != null) {
      trailing = Text(text, style: _trailingTextStyle);
    }

    return Container(
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: Color(0xFFEDEDED)))),
      child: ListTile(
          onTap: onPressed,
          title: Text(
            title,
            style: _leadingTextStyle,
          ),
          trailing: trailing),
    );
  }
}
