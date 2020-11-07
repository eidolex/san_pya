import 'dart:ui';

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
          _buildProfileCover(),
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

  Widget _buildProfileCover() {
    // TODO: add photo picker icon
    // TODO: add name change icon
    return AspectRatio(
      aspectRatio: 4 / 3,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("graphics/profile.png"), fit: BoxFit.cover)),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: new Container(
              decoration: new BoxDecoration(color: Colors.transparent),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: FractionallySizedBox(
                        heightFactor: 0.5,
                        child: AspectRatio(
                            aspectRatio: 1,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("graphics/profile.png"),
                            )),
                      ),
                    ),
                    Container(
                      margin: Edge.et4,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 200),
                        child: Text(
                          "James Batron",
                          overflow: TextOverflow.clip,
                          maxLines: 2,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
                  ]),
            ),
          ),
        ),
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
