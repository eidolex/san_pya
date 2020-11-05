import 'package:flutter/material.dart';

Widget appBar(String title) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(fontWeight: FontWeight.w600),
    ),
    centerTitle: true,
    elevation: 0,
  );
}
