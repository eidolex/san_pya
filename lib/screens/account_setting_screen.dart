import 'package:flutter/material.dart';
import 'package:san_pya/widgets/account_setting_input.dart';

class AccountSettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Account"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 4),
                  child: Text(
                    "Change Password",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),

                Container(
                    margin: EdgeInsets.only(bottom: 16),
                    child: Text(
                      "You can reset your previous password here",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
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
                // Spacer(),
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
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            padding: EdgeInsets.all(16),
          ),
        ));
  }
}
