import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: Favorites.favoriteQuotesCards.length,
          itemBuilder: (c, i) {
            return Favorites.favoriteQuotesCards[i];
          },
        ),
      )),
    );
  }
}
