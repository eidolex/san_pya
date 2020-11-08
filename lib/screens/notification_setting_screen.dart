import 'package:flutter/material.dart';
import 'package:san_pya/constants/spacings.dart';
import 'package:san_pya/widgets/app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationSettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Account"),
      body: Container(
        margin: Edge.e4,
        child: _NotificationSetting(),
      ),
    );
  }
}

class _NotificationSetting extends StatefulWidget {
  @override
  _NotificationSettingState createState() => _NotificationSettingState();
}

class _NotificationSettingState extends State<_NotificationSetting> {
  static const key = 'notification';

  bool _isSelected = false;

  @override
  void initState() {
    super.initState();
    _loadNotificationSetting();
  }

  _loadNotificationSetting() async {
    var prefs = await SharedPreferences.getInstance();
    var notification = prefs.getBool(key);
    if (notification != null) {
      setState(() {
        _isSelected = notification;
      });
    }
  }

  void _changeHandler(bool val) async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      _isSelected = val;
      prefs.setBool(key, val);
    });
  }

  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;
    var textTheme = Theme.of(context).textTheme;
    var headline1 = textTheme.headline1;
    var subTitle1 = textTheme.subtitle1;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: Edge.eb2,
              child: Text(
                "Notification",
                style: headline1,
              ),
            ),
            Container(
                margin: Edge.eb4,
                child: Text(
                  "You can turn on/off the notification here",
                  style: subTitle1,
                )),
          ],
        )),
        Switch(
            value: _isSelected,
            onChanged: _changeHandler,
            activeColor: primaryColor)
      ],
    );
  }
}
