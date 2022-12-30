import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  static List<Widget> historyQuotes = [];

  const History({super.key});

  @override
  State<StatefulWidget> createState() => _History();
}

class _History extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: History.historyQuotes.length,
        itemBuilder: (c, i) {
          return History.historyQuotes[i];
        },
      ),
    );
  }
}
