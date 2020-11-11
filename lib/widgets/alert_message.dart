import 'package:flutter/material.dart';

class AlertMessage extends StatelessWidget {
  final double height;

  final Color color;

  final Color backgroundColor;

  final Widget child;

  const AlertMessage(
      {Key key,
      @required this.child,
      @required this.color,
      @required this.backgroundColor,
      this.height = 56})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var width = constraints.biggest.width;
        double circleWidth = 14;
        double bottomOffset = 0 - ((circleWidth / 2) + 2);
        return Container(
          height: height,
          color: color,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                child: child,
              ),
              Positioned(
                left: 0,
                bottom: bottomOffset,
                right: 0,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _buildCircle(width, circleWidth),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildCircle(double containerWidth, double circleWidth) {
    int count = (containerWidth / (circleWidth * 2)).floor();

    return List.generate(
        count,
        (index) => Container(
              width: circleWidth,
              height: circleWidth,
              decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(16)),
            ));
  }
}
