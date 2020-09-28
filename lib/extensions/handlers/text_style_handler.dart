import 'package:flutter/material.dart';

import 'color.dart';

// https://fonts.google.com/specimen/Kanit
class TextStyleHandler {
  static final TextStyle titleLoginTitle = TextStyle(
      color: kPrimaryTextColor, fontWeight: FontWeight.w800, fontSize: 25);
  static final TextStyle labelText = TextStyle(color: kPrimaryLabelTextColor);
  static final categoryLabelHome = TextStyle(
      color: kPrimaryTextColor, fontWeight: FontWeight.w900, fontSize: 25);
  static final TextStyle titleItem =
      TextStyle(fontSize: 15, fontWeight: FontWeight.w400);
  static final TextStyle priceItem =
      TextStyle(fontSize: 15, fontWeight: FontWeight.w700);
}
