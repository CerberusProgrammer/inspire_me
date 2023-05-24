import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:inspire_me/data/fonts.dart';
import 'package:inspire_me/data/quotes.dart';
import 'package:inspire_me/quote_card.dart';
import 'package:inspire_me/secret.dart';
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
  late int fontSize;
  bool love = false;
  int ad = 0;

  InterstitialAd? _interstitialAd;

  @override
  void initState() {
    super.initState();

    index = Random().nextInt(allquotes.length) + 1;
    color = Colors.white;
    fontStyle = Random().nextInt(styleList.length);
    fontSize = Random().nextInt(30) + 1;

    _createInterstitialAd();
  }

  void _createInterstitialAd() {
    InterstitialAd.load(
      adUnitId: admob_id,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) => _interstitialAd = ad,
        onAdFailedToLoad: (error) =>
            print('Failed to load interstitial ad: $error'),
      ),
    );
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    super.dispose();
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
        onPressed: () async {
          ad += 1;

          if (ad == 10) {
            ad = 0;

            if (_interstitialAd == null) {
              return;
            }
            _interstitialAd!.fullScreenContentCallback =
                FullScreenContentCallback(
              onAdShowedFullScreenContent: (ad) =>
                  print('$ad onAdShowedFullScreenContent.'),
              onAdDismissedFullScreenContent: (ad) {
                ad.dispose();
                _createInterstitialAd();
              },
              onAdFailedToShowFullScreenContent: (ad, error) {
                ad.dispose();
                _createInterstitialAd();
              },
            );
            _interstitialAd!.show();
          }

          setState(() {
            index = Random().nextInt(allquotes.length);
            color = Themes.colors[Random().nextInt(Themes.colors.length)];
            fontStyle = Random().nextInt(styleList.length);
            fontSize = Random().nextInt(20) + 10;

            Map<String, dynamic> map = {
              'quote': index,
              'red': color.red,
              'green': color.blue,
              'blue': color.green,
              'alpha': color.alpha,
              'fontStyle': fontStyle,
              'fontSize': fontSize,
            };

            Data.historyQuotes.add(map);
            Data.insertHistory(map);
          });
        },
        child: const Icon(Icons.update),
      ),
    );
  }
}
