import 'package:flutter/material.dart';
import 'package:san_pya/utils/device_utils.dart';

double fullScreenHeight(BuildContext context) {
  var query = MediaQuery.of(context);
  var height = query.size.height;
  var padding = query.padding;

  if (isIOS()) {
    // height without SafeArea
    return height - padding.top - padding.bottom;
  }

  return height - padding.top - kToolbarHeight;
}
