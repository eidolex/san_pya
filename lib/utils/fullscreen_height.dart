import 'package:flutter/material.dart';

double fullscreenHeight(BuildContext context) {
  var query = MediaQuery.of(context);
  var height = query.size.height;
  var bottom = query.viewInsets.bottom;
  var paddingVertical = query.viewPadding.vertical;
  return height - bottom - paddingVertical - 57;
}
