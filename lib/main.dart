import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:inspire_me/presentation.dart';
import 'package:inspire_me/themes.dart';

import 'dashboard.dart';

void main() {
  runApp(
    const Main(
      savedThemeMode: null,
    ),
  );
}

class Main extends StatefulWidget {
  final AdaptiveThemeMode? savedThemeMode;
  const Main({super.key, required this.savedThemeMode});

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
        title: 'What To Do?',
        theme: theme,
        darkTheme: darkTheme,
        home: const Dashboard(),
      ),
    );
  }
}
