import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:inspire_me/data/data.dart';
import 'package:inspire_me/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (contexts, constraints) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: constraints.maxWidth,
                        height: 110,
                        child: Card(
                          elevation: 8,
                          color: Theme.of(context).colorScheme.primary,
                          child: Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: CircleAvatar(
                                    child: Icon(
                                      Icons.person,
                                      size: 40,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Username',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 24,
                                      color: Color.fromARGB(120, 0, 0, 0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 6),
                        child: Text(
                          'Data',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        child: Column(
                          children: [
                            ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              leading: const Icon(
                                Icons.favorite,
                              ),
                              title: const Text('Favorites'),
                              subtitle: const Text(
                                'Clear all the data from Favorites.',
                              ),
                              onTap: () async {
                                Data.favoriteQuotes.clear();
                                await Data.deleteAllFavorites();
                              },
                            ),
                            ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              leading: const Icon(
                                Icons.history,
                              ),
                              title: const Text('History'),
                              subtitle: const Text(
                                'Clear all the data from the History.',
                              ),
                              onTap: () async {
                                Data.historyQuotes.clear();
                                await Data.deleteAllHistories();
                              },
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 6),
                        child: Text(
                          'Theme',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        child: Column(
                          children: [
                            ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              leading: const Icon(Icons.restart_alt),
                              title: const Text(
                                'Default',
                              ),
                              subtitle: const Text('Set the default theme.'),
                              onTap: () async {
                                AdaptiveTheme.of(context).setTheme(
                                  light: Themes.changeTheme(0),
                                  dark: Themes.changeTheme(0),
                                );
                                final prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setInt('defaultIndex', 0);
                              },
                            ),
                            ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              leading: const Icon(Icons.edit),
                              title: const Text(
                                'Change',
                              ),
                              subtitle: const Text('Select a new theme.'),
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (builder) {
                                      return AlertDialog(
                                        title: const Text('Change theme'),
                                        content: SizedBox(
                                          width: 300,
                                          height: 300,
                                          child: GridView.count(
                                            shrinkWrap: true,
                                            crossAxisCount: 4,
                                            children: List.generate(
                                                Themes.colors.length, (index) {
                                              return OutlinedButton(
                                                style: OutlinedButton.styleFrom(
                                                  backgroundColor:
                                                      Themes.colors[index],
                                                  side: const BorderSide(
                                                      color: Color.fromARGB(
                                                          70, 35, 35, 35),
                                                      width: 8),
                                                ),
                                                onPressed: () async {
                                                  Navigator.pop(context);

                                                  AdaptiveTheme.of(context)
                                                      .setTheme(
                                                    light: Themes.changeTheme(
                                                        index),
                                                    dark: Themes.changeTheme(
                                                        index),
                                                  );
                                                  final prefs =
                                                      await SharedPreferences
                                                          .getInstance();
                                                  prefs.setInt(
                                                      'defaultIndex', index);
                                                },
                                                child: null,
                                              );
                                            }),
                                          ),
                                        ),
                                      );
                                    });
                              },
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 6),
                        child: Text(
                          'Profile',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        child: Column(
                          children: [
                            ListTile(
                              leading: const Icon(Icons.person),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              title: const Text(
                                'Username',
                              ),
                              subtitle: const Text('Change your username'),
                              onTap: () {},
                            ),
                            ListTile(
                              leading: const Icon(Icons.present_to_all),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              title: const Text(
                                'Presentation',
                              ),
                              subtitle: const Text(
                                  'View the presentation of the app again.'),
                              onTap: () {},
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
