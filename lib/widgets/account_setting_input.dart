import 'package:flutter/material.dart';
import 'package:san_pya/constants/colors.dart';
import 'package:san_pya/constants/spacings.dart';

import 'label.dart';

class AccountSettingInput extends StatelessWidget {
  final String label;

  AccountSettingInput({Key key, @required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Edge.eb4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Label(label: label),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
                contentPadding: Edge.e3,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.zero),
                    borderSide: BorderSide(
                        width: 1, color: InputBorderColors.textInput)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.zero),
                    borderSide: BorderSide(
                        width: 1, color: InputBorderColors.textInput))),
          ),
        ],
      ),
    );
  }
}
