import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  const Label({
    Key key,
    @required this.label,
    this.bottom = 6,
  }) : super(key: key);

  final String label;

  final double bottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        this.label,
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      margin: EdgeInsets.only(bottom: bottom),
    );
  }
}
