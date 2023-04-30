import 'dart:math';

import 'package:flutter/material.dart';
import 'package:inspire_me/data/fonts.dart';
import 'package:inspire_me/data/quotes.dart';
import 'package:inspire_me/quote_card.dart';
import 'package:inspire_me/themes.dart';

import 'data/data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int index;
  late Color color;
  late int fontStyle;
  late double fontSize;

  @override
  void initState() {
    super.initState();

    index = Random().nextInt(allquotes.length) + 1;
    color = Colors.white;
    fontStyle = Random().nextInt(styleList.length) + 1;
    fontSize = Random().nextInt(30) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 10,
            child: QuoteCard(
              index: index,
              color: color,
              fontIndexRandom: fontStyle,
              fontSizeRandom: fontSize,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            index = Random().nextInt(allquotes.length);
            color = Themes.colors[Random().nextInt(Themes.colors.length)];
            fontStyle = Random().nextInt(styleList.length);
            fontSize = Random().nextInt(20) + 10;

            Data.historyQuotes.add({
              'index': index,
              'color': color,
              'fontStyle': fontStyle,
              'fontSize': fontSize,
            });
          });
        },
        child: const Icon(Icons.update),
      ),
    );
  }
}
