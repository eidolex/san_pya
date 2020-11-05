import 'package:flutter/material.dart';
import 'package:san_pya/widgets/account_setting_input.dart';

class AccountSettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var query = MediaQuery.of(context);
    var height = query.size.height;
    var bottom = query.viewInsets.bottom;
    var paddingVertical = query.viewPadding.vertical;
    var containerHeight = height - bottom - paddingVertical - 57;
    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
        centerTitle: true,
      ),
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
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(bottom: 16),
                      child: Text(
                        "You can reset your previous password here",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w300),
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
                SizedBox(
                  width: double.infinity,
                  child: FlatButton(
                    color: Colors.yellow,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    padding: EdgeInsets.only(top: 16, bottom: 16),
                    child: Text("Confirm"),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
