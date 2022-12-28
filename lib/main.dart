import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Inspire Me',
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      home: const Home(),
    ),
  );
}
