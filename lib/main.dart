import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inspire Me',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.amber,
        useMaterial3: true,
      ),
      home: const Home(),
    ),
  );
}
