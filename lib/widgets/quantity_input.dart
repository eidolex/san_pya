import 'package:flutter/material.dart';
import 'package:san_pya/constants/colors.dart';

class QuantityInput extends StatefulWidget {
  final double width;

  final double height;

  final Color iconColor;

  const QuantityInput(
      {Key key, @required this.width, this.height = 35, this.iconColor})
      : super(key: key);

  @override
  _QuantityInputState createState() => _QuantityInputState();
}

class _QuantityInputState extends State<QuantityInput> {
  final double buttonWidth = 35;

  int _number = 1;

  @override
  Widget build(BuildContext context) {
    var height = widget.height;
    return Container(
      width: widget.width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: BoxBorderColors.primary),
      ),
      child: Row(
        children: [
          createButton(Icons.remove, () {
            if (_number > 1) {
              this.setState(() {
                _number--;
              });
            }
          }),
          createInput(),
          createButton(Icons.add, () {
            this.setState(() {
              _number++;
            });
          })
        ],
      ),
    );
  }

  Widget createButton(IconData icon, VoidCallback onPressed) {
    return SizedBox(
      width: buttonWidth,
      child: FlatButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: Icon(
          icon,
          color: InputBorderColors.btn,
        ),
      ),
    );
  }

  Widget createInput() {
    return Expanded(
        child: Container(
      height: widget.height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.symmetric(
          vertical: BorderSide(color: BoxBorderColors.vertical, width: 1),
        ),
      ),
      child: Text("$_number"),
    ));
  }
}
