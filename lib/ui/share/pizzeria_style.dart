import 'package:flutter/material.dart';

class PizzeriaStyle {
  static final baseTextStyle = const TextStyle(fontWeight: FontWeight.bold);

  static final pageTitleTextStyle = baseTextStyle.copyWith(
    fontSize: 26.0,
  );

  static final headerTextStyle = baseTextStyle.copyWith(
    fontSize: 20.0,
  );

  static final regularTextStyle = baseTextStyle.copyWith(
    fontSize: 18.0,
  );

  static final subHeaderTextStyle = baseTextStyle.copyWith(fontSize: 26.0);

  static final itemPriceTextStyle = const TextStyle(color: Colors.blueGrey);

  static final subPriceTextStyle = baseTextStyle.copyWith(
    color: Colors.indigo,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
  );

  static final priceTotalTextStyle = baseTextStyle.copyWith(
    color: Colors.indigo,
    fontSize: 22.0,
  );

  static final errorTextStyle = baseTextStyle.copyWith(
    color: Colors.red,
    fontSize: 22.0,
  );
}
