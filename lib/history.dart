import 'package:flutter/material.dart';
import 'package:inspire_me/data/data.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<StatefulWidget> createState() => _History();
}

class _History extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: Data.historyQuotes.length,
        itemBuilder: (c, i) {
          return Data.historyQuotes[i];
        },
      ),
    );
  }
}
