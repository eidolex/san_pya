import 'package:flutter/material.dart';
import 'package:san_pya/constants/colors.dart';

class CustomCheckbox extends StatefulWidget {
  final String label;

  final double size;

  final double spacing;

  final TextStyle labelStyle;

  final Color color;

  final Color inactiveColor;

  CustomCheckbox({
    Key key,
    this.label,
    this.size = 18,
    this.spacing = 8,
    this.labelStyle,
    this.color,
    this.inactiveColor,
  }) : super(key: key);

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    var color = widget.color ?? Theme.of(context).primaryColor;
    var size = widget.size;
    var label = widget.label;
    var hasLabel = widget.label != null;
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (hasLabel) ceateLabel(label),
          Container(
            margin: EdgeInsets.only(left: hasLabel ? widget.spacing : 0),
            decoration: BoxDecoration(
                color: _isSelected ? color : widget.inactiveColor,
                borderRadius: BorderRadius.circular(3),
                border: Border.all(
                    width: 1.3,
                    color: _isSelected ? color : InputBorderColors.textInput)),
            width: size,
            height: size,
            child: _isSelected
                ? Icon(
                    Icons.check,
                    color: Colors.white,
                    size: size - 2,
                  )
                : null,
          ),
        ],
      ),
    );
  }

  Text ceateLabel(String text) {
    return Text(
      text,
      style: widget.labelStyle ??
          TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 12,
          ),
    );
  }
}
