import 'package:flutter/material.dart';

abstract class SintiaShadows {
  static const List<BoxShadow> s1 = [
    BoxShadow(color: Color(0x0A000000), blurRadius: 10, offset: Offset(0, 2)),
  ];

  static const List<BoxShadow> s2 = [
    BoxShadow(color: Color(0x19000000), blurRadius: 10, offset: Offset(0, 4)),
  ];

  static const List<BoxShadow> s3 = [
    BoxShadow(color: Color(0x26000000), blurRadius: 20, offset: Offset(0, 8)),
  ];
}
