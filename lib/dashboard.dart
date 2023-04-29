import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:inspire_me/history.dart';
import 'package:inspire_me/settings.dart';

import 'favorites.dart';
import 'home.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late List<Widget> tabs;

  int tab = 0;

  @override
  void initState() {
    super.initState();
    tabs = [
      const Home(),
      const Favorites(),
      const History(),
      const Settings(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          title: const Text('Inspire Me'),
        ),
        body: tabs[tab],
        bottomNavigationBar: GNav(
          rippleColor: Colors.grey[300]!,
          hoverColor: Colors.grey[100]!,
          gap: 8,
          haptic: true,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          duration: const Duration(milliseconds: 400),
          activeColor: Theme.of(context).colorScheme.primary,
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
            GButton(
              icon: Icons.settings,
              text: 'Settings',
            )
          ],
          selectedIndex: tab,
          onTabChange: (i) {
            setState(() {
              tab = i;
            });
          },
        ),
      ),
    );
  }
}
