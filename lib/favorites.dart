import 'package:flutter/material.dart';

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
          child: Data.favoriteQuotesCards.isNotEmpty
              ? ListView.builder(
                  itemCount: Data.favoriteQuotesCards.length,
                  itemBuilder: (c, i) {
                    return Data.favoriteQuotesCards[i];
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
