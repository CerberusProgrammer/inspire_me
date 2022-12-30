import 'package:flutter/material.dart';

import 'data/fonts.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});
  static List<Widget> favoriteQuotesCards = [];
  @override
  State<StatefulWidget> createState() => _Favorites();
}

class _Favorites extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Favorites.favoriteQuotesCards.isNotEmpty
              ? ListView.builder(
                  itemCount: Favorites.favoriteQuotesCards.length,
                  itemBuilder: (c, i) {
                    return Favorites.favoriteQuotesCards[i];
                  },
                )
              : Center(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Card(
                        elevation: 15,
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(12, 12, 12, 12),
                                Color.fromARGB(100, 121, 123, 12),
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
