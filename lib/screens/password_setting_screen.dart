import 'package:flutter/material.dart';
import 'package:san_pya/utils/fullscreen_height.dart';
import 'package:san_pya/widgets/account_setting_input.dart';
import 'package:san_pya/widgets/app_bar.dart';
import 'package:san_pya/widgets/block_button.dart';

class PasswordSettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var containerHeight = fullscreenHeight(context);
    return Scaffold(
      appBar: appBar(context, "Account"),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
              minWidth: double.infinity, minHeight: containerHeight),
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 4),
                    child: Text(
                      "Change Password",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(bottom: 16),
                      child: Text(
                        "You can reset your previous password here",
                        style: TextStyle(fontSize: 10),
                      )),
                  AccountSettingInput(
                    label: "Old Password",
                  ),
                  AccountSettingInput(
                    label: "New Password",
                  ),
                  AccountSettingInput(
                    label: "Confirm Password",
                  ),
                ]),
                BlockButton(text: "Confirm", onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
