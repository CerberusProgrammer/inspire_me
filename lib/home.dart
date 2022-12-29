import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:inspire_me/favorites.dart';

import 'data/fonts.dart';
import 'data/quotes.dart';

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
      home(),
      Favorites(),
    ];

    return Scaffold(
        body: tabs[index],
        floatingActionButton: Visibility(
            visible: visible && !anotherTab,
            child: FloatingActionButton(
              onPressed: (() {
                setState(() {
                  Favorites.favoriteQuotesCards.add(Center(
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: Color.fromARGB(
                                30, randoms[0], randoms[1], randoms[2])),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
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
                                          Color.fromARGB(randoms[3], randoms[0],
                                              randoms[1], randoms[2]),
                                          Color.fromARGB(randoms[7], randoms[4],
                                              randoms[5], randoms[6]),
                                        ],
                                      ),
                                    ),
                                    child: ListTile(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      onTap: () {},
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
                  ));
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
                icon: Icons.tag,
                text: 'Tags',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              )
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

  Widget home() {
    return Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(30, randoms[0], randoms[1], randoms[2])),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                    visible: visible,
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
                          Color.fromARGB(
                              randoms[3], randoms[0], randoms[1], randoms[2]),
                          Color.fromARGB(
                              randoms[7], randoms[4], randoms[5], randoms[6]),
                        ],
                      ),
                    ),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onTap: () {
                        setState(() {
                          if (fav) {
                            fav = false;
                          } else {
                            fav = true;
                          }
                        });
                      },
                      onLongPress: () {
                        setState(() {
                          if (visible) {
                            visible = false;
                          } else {
                            visible = true;
                          }
                        });
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
        ));
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
