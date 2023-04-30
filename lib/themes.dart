import 'package:flutter/material.dart';

class Themes {
  static int defaultIndex = 12;
  static List<Color> colors = [
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.deepPurple,
    Colors.indigo,
    Colors.lightBlue,
    Colors.cyan,
    Colors.teal,
    Colors.green,
    Colors.lightGreen,
    Colors.lime,
    Colors.amber,
    Colors.orange,
    Colors.deepOrange,
    Colors.brown,
    Colors.blueGrey
  ];

  static ThemeData changeTheme(int index) {
    return ThemeData(
      colorSchemeSeed: colors[index],
      useMaterial3: true,
      brightness: Brightness.dark,
    );
  }
}
