import 'package:flutter/material.dart';
import 'package:san_pya/constants/spacings.dart';
import 'package:san_pya/widgets/app_bar.dart';

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
  bool _isSelected = false;

  void _changeHandler(bool val) {
    setState(() {
      _isSelected = val;
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
