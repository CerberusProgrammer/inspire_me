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
        itemCount: Data.favoriteQuotes.length,
        itemBuilder: (c, i) {
          return QuoteCard(
            index: Data.favoriteQuotes[i]['index'],
            fontIndexRandom: Data.favoriteQuotes[i]['fontStyle'],
            fontSizeRandom: Data.favoriteQuotes[i]['fontSize'],
            color: Data.favoriteQuotes[i]['color'],
            isHistory: true,
          );
        },
      ),
    );
  }
}
