import 'package:flutter/material.dart';
import 'package:san_pya/utils/device_utils.dart';

double fullScreenHeight(BuildContext context) {
  var query = MediaQuery.of(context);
  var height = query.size.height;
  var padding = query.padding;
  var bottom = query.viewInsets.bottom;

  if (isIOS()) {
    // height without SafeArea
    return height - bottom - padding.top - padding.bottom;
  }

  return height - bottom - padding.top - kToolbarHeight;
}
