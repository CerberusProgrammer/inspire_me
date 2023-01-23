import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:inspire_me/favorites.dart';
import 'package:inspire_me/history.dart';
import 'package:path_provider/path_provider.dart';

import 'data/fonts.dart';
import 'data/quotes.dart';

import 'package:showcaseview/showcaseview.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  int index = 0;
  int randomQuote = 0;
  double randomFontSize = 20;
  List<int> randoms = [255, 110, 220, 100, 155, 10, 20, 50, 0];

  bool visible = true;
  bool fav = false;
  bool anotherTab = false;

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      home(true),
      const Favorites(),
      const History(),
    ];

    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: AppBar(
              elevation: 0,
              title: const Text('Inspire Me'),
            )),
        body: tabs[index],
        floatingActionButton: Visibility(
            visible: visible && !anotherTab,
            child: FloatingActionButton(
              onPressed: (() {
                setState(() {
                  fav = false;

                  History.historyQuotes.add(home(false));

                  var rng = Random();
                  randomQuote = rng.nextInt(500);
                  randomFontSize = 20 + rng.nextDouble() * 20;

                  randoms = [
                    rng.nextInt(255),
                    rng.nextInt(255),
                    rng.nextInt(255),
                    rng.nextInt(255),
                    rng.nextInt(255),
                    rng.nextInt(255),
                    rng.nextInt(255),
                    rng.nextInt(255),
                    rng.nextInt(styleList.length),
                  ];
                });
                writeCounter(19);
                print(readCounter());
              }),
              child: const Icon(Icons.refresh),
            )),
        bottomNavigationBar: Visibility(
          visible: visible,
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 8,
            haptic: true,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: const Duration(milliseconds: 400),
            activeColor: Colors.amber,
            iconSize: 24,
            tabBackgroundColor: Colors.grey[100]!,
            color: const Color.fromARGB(255, 160, 160, 160),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.favorite,
                text: 'Favorites',
              ),
              GButton(
                icon: Icons.history,
                text: 'History',
              ),
            ],
            selectedIndex: index,
            onTabChange: (i) {
              setState(() {
                index = i;
                if (index != 0) {
                  anotherTab = true;
                } else {
                  anotherTab = false;
                }
              });
            },
          ),
        ));
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    print('path: ' + directory.path);
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      print(contents);
      return int.parse(contents);
    } catch (e) {
      return 0;
    }
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$counter');
  }

  Widget home(bool functional) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Card(
        elevation: 15,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Color.fromARGB(30, randoms[0], randoms[1], randoms[2])),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                        visible: visible && functional,
                        child: Row(
                          children: tags(),
                        )),
                    Card(
                      elevation: 15,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(randoms[3], randoms[0], randoms[1],
                                  randoms[2]),
                              Color.fromARGB(randoms[7], randoms[4], randoms[5],
                                  randoms[6]),
                            ],
                          ),
                        ),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          onTap: () {
                            if (functional) {
                              setState(() {
                                if (fav) {
                                  Favorites.favoriteQuotesCards.removeLast();
                                  fav = false;
                                } else {
                                  List<int> rnds = randoms;
                                  int r = randomQuote;
                                  double rf = randomFontSize;
                                  Widget w = Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Center(
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                              color: Color.fromARGB(30, rnds[0],
                                                  rnds[1], rnds[2])),
                                          child: Center(
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Card(
                                                    elevation: 15,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                          Radius.circular(10),
                                                        ),
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            Color.fromARGB(
                                                                rnds[3],
                                                                rnds[0],
                                                                rnds[1],
                                                                rnds[2]),
                                                            Color.fromARGB(
                                                                rnds[7],
                                                                rnds[4],
                                                                rnds[5],
                                                                rnds[6]),
                                                          ],
                                                        ),
                                                      ),
                                                      child: ListTile(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (builder) {
                                                            return Scaffold(
                                                              body: Center(
                                                                child:
                                                                    Container(
                                                                        decoration: BoxDecoration(
                                                                            borderRadius: const BorderRadius.all(Radius.circular(
                                                                                10)),
                                                                            color: Color.fromARGB(
                                                                                30,
                                                                                rnds[0],
                                                                                rnds[1],
                                                                                rnds[2])),
                                                                        child: Center(
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(10),
                                                                            child:
                                                                                Column(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Card(
                                                                                  elevation: 15,
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(
                                                                                      borderRadius: const BorderRadius.all(
                                                                                        Radius.circular(10),
                                                                                      ),
                                                                                      gradient: LinearGradient(
                                                                                        colors: [
                                                                                          Color.fromARGB(rnds[3], rnds[0], rnds[1], rnds[2]),
                                                                                          Color.fromARGB(rnds[7], rnds[4], rnds[5], rnds[6]),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    child: ListTile(
                                                                                      shape: RoundedRectangleBorder(
                                                                                        borderRadius: BorderRadius.circular(10),
                                                                                      ),
                                                                                      onTap: () {
                                                                                        Navigator.pop(context);
                                                                                      },
                                                                                      title: Text(
                                                                                        allquotes[r]['content'],
                                                                                        style: TextStyle(
                                                                                          fontFamily: styleList[rnds[8]],
                                                                                          letterSpacing: 1,
                                                                                          fontStyle: FontStyle.normal,
                                                                                          fontSize: rf,
                                                                                        ),
                                                                                        textAlign: TextAlign.center,
                                                                                      ),
                                                                                      subtitle: Text(
                                                                                        '- ${allquotes[r]['author']}',
                                                                                        style: TextStyle(
                                                                                          letterSpacing: 1,
                                                                                          fontStyle: FontStyle.italic,
                                                                                          fontSize: randomFontSize - 10,
                                                                                        ),
                                                                                        textAlign: TextAlign.center,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        )),
                                                              ),
                                                            );
                                                          }));
                                                        },
                                                        title: Text(
                                                          allquotes[r]
                                                              ['content'],
                                                          style: TextStyle(
                                                            fontFamily:
                                                                styleList[
                                                                    rnds[8]],
                                                            letterSpacing: 1,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: rf,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        subtitle: Text(
                                                          '- ${allquotes[r]['author']}',
                                                          style: TextStyle(
                                                            letterSpacing: 1,
                                                            fontStyle: FontStyle
                                                                .italic,
                                                            fontSize:
                                                                randomFontSize -
                                                                    10,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )),
                                    ),
                                  );
                                  Favorites.favoriteQuotesCards.add(w);
                                  fav = true;
                                }
                              });
                            }
                          },
                          onLongPress: () {
                            if (functional) {
                              setState(() {
                                if (visible) {
                                  visible = false;
                                } else {
                                  visible = true;
                                }
                              });
                            }
                          },
                          title: Text(
                            allquotes[randomQuote]['content'],
                            style: TextStyle(
                              fontFamily: styleList[randoms[8]],
                              letterSpacing: 1,
                              fontStyle: FontStyle.normal,
                              fontSize: randomFontSize,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          subtitle: Text(
                            '- ${allquotes[randomQuote]['author']}',
                            style: TextStyle(
                              letterSpacing: 1,
                              fontStyle: FontStyle.italic,
                              fontSize: randomFontSize - 10,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }

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

    buttons.add(const Spacer());
    buttons.add(
      IconButton(
        onPressed: () {
          setState(() {
            if (fav) {
              fav = false;
            } else {
              fav = true;
            }
          });
        },
        icon: Icon(
          fav ? Icons.favorite : Icons.favorite_outline,
          color: Colors.amber,
        ),
      ),
    );

    return buttons;
  }
}
