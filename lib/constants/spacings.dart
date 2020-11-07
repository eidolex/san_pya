import 'package:flutter/material.dart';

class Spacing {
  Spacing._();

  static const s1 = 2.0;
  static const s2 = 4.0;
  static const s3 = 8.0;
  static const s4 = 16.0;
  static const s5 = 22.0;
}

class Edge {
  Edge._();

  static const e1 = EdgeInsets.all(Spacing.s1);
  static const e2 = EdgeInsets.all(Spacing.s2);
  static const e3 = EdgeInsets.all(Spacing.s3);
  static const e4 = EdgeInsets.all(Spacing.s4);
  static const e5 = EdgeInsets.all(Spacing.s5);

  static const et1 = EdgeInsets.only(top: Spacing.s1);
  static const et2 = EdgeInsets.only(top: Spacing.s2);
  static const et3 = EdgeInsets.only(top: Spacing.s3);
  static const et4 = EdgeInsets.only(top: Spacing.s4);
  static const et5 = EdgeInsets.only(top: Spacing.s5);

  static const eb1 = EdgeInsets.only(bottom: Spacing.s1);
  static const eb2 = EdgeInsets.only(bottom: Spacing.s2);
  static const eb3 = EdgeInsets.only(bottom: Spacing.s3);
  static const eb4 = EdgeInsets.only(bottom: Spacing.s4);
  static const eb5 = EdgeInsets.only(bottom: Spacing.s5);

  static const el1 = EdgeInsets.only(left: Spacing.s1);
  static const el2 = EdgeInsets.only(left: Spacing.s2);
  static const el3 = EdgeInsets.only(left: Spacing.s3);
  static const el4 = EdgeInsets.only(left: Spacing.s4);
  static const el5 = EdgeInsets.only(left: Spacing.s5);

  static const er1 = EdgeInsets.only(right: Spacing.s1);
  static const er2 = EdgeInsets.only(right: Spacing.s2);
  static const er3 = EdgeInsets.only(right: Spacing.s3);
  static const er4 = EdgeInsets.only(right: Spacing.s4);
  static const er5 = EdgeInsets.only(right: Spacing.s5);

  static const ex1 = EdgeInsets.symmetric(horizontal: Spacing.s1);
  static const ex2 = EdgeInsets.symmetric(horizontal: Spacing.s2);
  static const ex3 = EdgeInsets.symmetric(horizontal: Spacing.s3);
  static const ex4 = EdgeInsets.symmetric(horizontal: Spacing.s4);
  static const ex5 = EdgeInsets.symmetric(horizontal: Spacing.s5);

  static const ey1 = EdgeInsets.symmetric(vertical: Spacing.s1);
  static const ey2 = EdgeInsets.symmetric(vertical: Spacing.s2);
  static const ey3 = EdgeInsets.symmetric(vertical: Spacing.s3);
  static const ey4 = EdgeInsets.symmetric(vertical: Spacing.s4);
  static const ey5 = EdgeInsets.symmetric(vertical: Spacing.s5);
}
