import 'package:flutter/material.dart';

class AccountSettingInput extends StatelessWidget {
  final String label;

  AccountSettingInput({Key key, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(this.label),
            margin: EdgeInsets.only(bottom: 6),
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.zero),
                    borderSide:
                        BorderSide(width: 0.5, color: Colors.grey[400])),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.zero),
                    borderSide:
                        BorderSide(width: 0.5, color: Colors.grey[400]))),
          ),
        ],
      ),
    );
  }
}
