import 'package:flutter/material.dart';
import 'package:inspire_me/presentation.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inspire Me',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.amber,
        useMaterial3: true,
      ),
      home: const Presentation(),
    ),
  );
}
