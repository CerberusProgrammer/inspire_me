import 'package:flutter/material.dart';
import 'package:inspire_me/data/quotes.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 10,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Center(
                child: Column(
                  children: [
                    Row(
                      children: List.generate(
                        (allquotes[index]['tags'] as List<String>).length,
                        (i) {
                          return FilledButton(
                            onPressed: () {},
                            child: Text(
                              (allquotes[index]['tags'] as List<String>)[i],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            index += 1;
          });
        },
        child: const Icon(Icons.update),
      ),
    );
  }
}

/*
  Widget home(bool functional) {
    return Card(
      elevation: 15,
      child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Center(
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
                            Theme.of(context).colorScheme.primary,
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
                                setState(() {
                                  Data.favoriteQuotesCards.removeLast();
                                });
                                fav = false;
                              } else {
                                Widget w = Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Center(
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                            color: Color.fromARGB(
                                                30, rnds[0], rnds[1], rnds[2])),
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
                                                      gradient: LinearGradient(
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
                                                        Navigator.push(context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (builder) {
                                                          return Scaffold(
                                                            body: Center(
                                                              child: Container(
                                                                  decoration: BoxDecoration(
                                                                      borderRadius: const BorderRadius
                                                                              .all(
                                                                          Radius.circular(
                                                                              10)),
                                                                      color: Color.fromARGB(
                                                                          30,
                                                                          rnds[
                                                                              0],
                                                                          rnds[
                                                                              1],
                                                                          rnds[
                                                                              2])),
                                                                  child: Center(
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              10),
                                                                      child:
                                                                          Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        children: [
                                                                          Card(
                                                                            elevation:
                                                                                15,
                                                                            child:
                                                                                Container(
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
                                                                          IconButton(
                                                                              onPressed: () {},
                                                                              icon: const Icon(Icons.share))
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  )),
                                                            ),
                                                          );
                                                        }));
                                                      },
                                                      title: Text(
                                                        allquotes[r]['content'],
                                                        style: TextStyle(
                                                          fontFamily: styleList[
                                                              rnds[8]],
                                                          letterSpacing: 1,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: rf,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      subtitle: Text(
                                                        '- ${allquotes[r]['author']}',
                                                        style: TextStyle(
                                                          letterSpacing: 1,
                                                          fontStyle:
                                                              FontStyle.italic,
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
                                setState(() {
                                  Data.favoriteQuotesCards.add(w);
                                });
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
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );

    return buttons;
  }
}
*/