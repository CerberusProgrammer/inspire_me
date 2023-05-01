import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:inspire_me/presentation.dart';
import 'package:inspire_me/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import 'dashboard.dart';
import 'data/data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  final prefs = await SharedPreferences.getInstance();
  Data.username = prefs.getString('username') ?? 'username';
  Themes.defaultIndex = prefs.getInt('defaultIndex') ?? 0;
  bool presentation = prefs.getBool('presentation') ?? false;

  runApp(
    Main(
      savedThemeMode: savedThemeMode,
      presentation: presentation,
    ),
  );

  openDatabase(
    'inspire.db',
    onCreate: (db, version) async {
      await db.execute(
        '''
        CREATE TABLE favorites (
          quote INTEGER,
          red INTEGER,
          green INTEGER,
          blue INTEGER,
          alpha INTEGER,
          fontStyle INTEGER,
          fontSize INTEGER
        );
        ''',
      );

      await db.execute(
        '''
        CREATE TABLE history (
          quote INTEGER,
          red INTEGER,
          green INTEGER,
          blue INTEGER,
          alpha INTEGER,
          fontStyle INTEGER,
          fontSize INTEGER
        );
        ''',
      );
    },
    version: 1,
  ).then((database) async {
    List<Map<String, dynamic>> favorites = await database.query('favorites');
    List<Map<String, dynamic>> history = await database.query('history');

    Data.favoriteQuotes.addAll(favorites);
    Data.historyQuotes.addAll(history);
  });
}

class Main extends StatefulWidget {
  final AdaptiveThemeMode? savedThemeMode;
  final bool presentation;

  const Main({
    super.key,
    required this.savedThemeMode,
    required this.presentation,
  });

  @override
  State<StatefulWidget> createState() => _Main();
}

class _Main extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: Themes.colors[Themes.defaultIndex],
        useMaterial3: true,
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: Themes.colors[Themes.defaultIndex],
        useMaterial3: true,
      ),
      initial: widget.savedThemeMode ?? AdaptiveThemeMode.dark,
      builder: (theme, darkTheme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Inspire Me',
        theme: theme,
        darkTheme: darkTheme,
        home: widget.presentation ? const Dashboard() : const Presentation(),
      ),
    );
  }
}
