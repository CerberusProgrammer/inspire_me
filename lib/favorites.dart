import 'package:flutter/material.dart';
import 'package:inspire_me/quote_card.dart';

import 'data/data.dart';
import 'data/fonts.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Data.favoriteQuotes.isNotEmpty
              ? ListView.builder(
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
                )
              : Center(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Card(
                        elevation: 15,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            gradient: LinearGradient(
                              colors: [
                                Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withAlpha(120),
                                Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withAlpha(10),
                              ],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Add some favorites quotes here',
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
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
