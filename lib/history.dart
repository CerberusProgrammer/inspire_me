import 'package:flutter/material.dart';
import 'package:inspire_me/data/data.dart';
import 'package:inspire_me/quote_card.dart';

import 'data/fonts.dart';

class History extends StatelessWidget {
  const History({super.key});

  static int i = 0;

  @override
  Widget build(BuildContext context) {
    i = 1;
    return Scaffold(
      body: Data.historyQuotes.isEmpty
          ? Padding(
              padding: const EdgeInsets.all(5),
              child: Card(
                elevation: 15,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).colorScheme.primary.withAlpha(120),
                        Theme.of(context).colorScheme.primary.withAlpha(10),
                      ],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Start feeling motivated viewing quotes.',
                      style: TextStyle(
                        fontFamily: styleList[1],
                        letterSpacing: 1,
                        fontStyle: FontStyle.normal,
                        fontSize: 34,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            )
          : ListView.builder(
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
