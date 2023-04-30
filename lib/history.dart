import 'package:flutter/material.dart';
import 'package:inspire_me/data/data.dart';
import 'package:inspire_me/quote_card.dart';

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
          return QuoteCard(
            index: Data.historyQuotes[i]['index'],
            fontIndexRandom: Data.historyQuotes[i]['fontStyle'],
            fontSizeRandom: Data.historyQuotes[i]['fontSize'],
            color: Data.historyQuotes[i]['color'],
            isHistory: true,
          );
        },
      ),
    );
  }
}
