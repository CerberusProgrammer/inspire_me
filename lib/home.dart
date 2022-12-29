import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  int randomR1 = 155;
  int randomG1 = 10;
  int randomB1 = 20;
  int randomA1 = 50;
  int randomFont = 0;

  List<String?> styleList = [
    GoogleFonts.roboto().fontFamily,
    GoogleFonts.abel().fontFamily,
    GoogleFonts.chauPhilomeneOne().fontFamily,
    GoogleFonts.acme().fontFamily,
    GoogleFonts.lacquer().fontFamily,
    GoogleFonts.openSans().fontFamily,
    GoogleFonts.montserrat().fontFamily,
    GoogleFonts.lato().fontFamily,
    GoogleFonts.andika().fontFamily,
    GoogleFonts.oswald().fontFamily,
    GoogleFonts.raleway().fontFamily,
    GoogleFonts.ubuntu().fontFamily,
    GoogleFonts.nunito().fontFamily,
    GoogleFonts.mukta().fontFamily,
    GoogleFonts.mulish().fontFamily,
    GoogleFonts.caramel().fontFamily,
    GoogleFonts.sourceCodePro().fontFamily,
    GoogleFonts.azeretMono().fontFamily,
    GoogleFonts.tradeWinds().fontFamily,
    GoogleFonts.rocknRollOne().fontFamily,
    GoogleFonts.romanesco().fontFamily,
  ];

  List<Widget> tags() {
    List<Widget> buttons = [];

    for (var i in allquotes[randomQuote]['tags']) {
      buttons.add(ElevatedButton(onPressed: () {}, child: Text(i)));
      buttons.add(
        const SizedBox(
          width: 5,
        ),
      );
    }

    return buttons;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: tags(),
              ),
              Card(
                elevation: 15,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(randomA, randomR, randomG, randomB),
                        Color.fromARGB(randomA1, randomR1, randomG1, randomB1),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      allquotes[randomQuote]['content'],
                      style: TextStyle(
                        fontFamily: styleList[randomFont],
                        letterSpacing: 1,
                        fontStyle: FontStyle.normal,
                        fontSize: randomFontSize,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    allquotes[randomQuote]['author'],
                    style: TextStyle(
                      letterSpacing: 1,
                      fontStyle: FontStyle.italic,
                      fontSize: randomFontSize - 10,
                    ),
                    textAlign: TextAlign.center,
                  )),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          setState(() {
            var rng = Random();
            randomQuote = rng.nextInt(500);
            randomFontSize = 20 + rng.nextDouble() * 20;
            randomR = rng.nextInt(255);
            randomG = rng.nextInt(255);
            randomB = rng.nextInt(255);
            randomA = rng.nextInt(255);
            randomR1 = rng.nextInt(255);
            randomG1 = rng.nextInt(255);
            randomB1 = rng.nextInt(255);
            randomA1 = rng.nextInt(255);
            randomFont = rng.nextInt(styleList.length);
          });
        }),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
