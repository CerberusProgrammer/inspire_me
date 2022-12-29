import 'dart:math';

import 'package:flutter/material.dart';
import 'package:inspire_me/quotes.dart';

import 'allquotes.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  int randomQuote = 0;
  double randomFontSize = 20;
  int randomR = 255;
  int randomG = 110;
  int randomB = 220;
  int randomA = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inspire Me'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.copy_outlined))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                  color: Color.fromARGB(randomA, randomR, randomG, randomB),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      allquotes[randomQuote]['content'],
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        // backgroundColor:
                        //     Color.fromARGB(255, randomR, randomG, randomB),
                        letterSpacing: 1,
                        fontStyle: FontStyle.italic,
                        fontSize: randomFontSize,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )),
              Text(
                allquotes[randomQuote]['author'],
                style: TextStyle(
                  fontFamily: 'Roboto',
                  //backgroundColor: Color.fromARGB(255, 244, 157, 6),
                  letterSpacing: 1,
                  fontStyle: FontStyle.italic,
                  fontSize: randomFontSize - 10,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          setState(() {
            var rng = Random();
            randomQuote = rng.nextInt(500);
            randomFontSize = 20 + rng.nextDouble() * 40;
            randomR = rng.nextInt(255);
            randomG = rng.nextInt(255);
            randomB = rng.nextInt(255);
            randomA = rng.nextInt(255);
          });
        }),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
