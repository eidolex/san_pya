import 'package:flutter/material.dart';
import 'package:san_pya/constants/spacings.dart';

class BlockButton extends StatelessWidget {
  const BlockButton({
    Key key,
    @required this.text,
    @required this.onPressed,
    this.icon,
    this.color,
  }) : super(key: key);

  final String text;

  final Color color;

  final IconData icon;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    var color = this.color ?? Theme.of(context).accentColor;
    var flatButton = FlatButton(
      color: color,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      padding: EdgeInsets.symmetric(vertical: Spacing.s4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (this.icon != null)
            Container(
              child: Icon(
                icon,
                size: 20,
              ),
              margin: EdgeInsets.only(right: 14),
            ),
          Text(this.text)
        ],
      ),
      onPressed: this.onPressed,
    );
    return SizedBox(
      width: double.infinity,
      child: flatButton,
    );
  }
}
