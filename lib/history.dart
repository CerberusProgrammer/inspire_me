import 'package:flutter/material.dart';
import 'package:inspire_me/data/data.dart';
import 'package:inspire_me/quote_card.dart';

class History extends StatelessWidget {
  const History({super.key});

  static int i = 0;

  @override
  Widget build(BuildContext context) {
    i = 1;
    return Scaffold(
      body: ListView.builder(
        itemCount: Data.historyQuotes.length,
        itemBuilder: (c, i) {
          int alpha = Data.historyQuotes[i]['alpha'];
          int red = Data.historyQuotes[i]['red'];
          int green = Data.historyQuotes[i]['green'];
          int blue = Data.historyQuotes[i]['blue'];
          Color color = Color.fromARGB(alpha, red, green, blue);

          return QuoteCard(
            index: Data.historyQuotes[i]['quote'],
            fontIndexRandom: Data.historyQuotes[i]['fontStyle'],
            fontSizeRandom: Data.historyQuotes[i]['fontSize'],
            color: color,
            isHistory: true,
          );
        },
      ),
    );
  }
}
