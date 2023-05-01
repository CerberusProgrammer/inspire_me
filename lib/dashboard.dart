import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:inspire_me/history.dart';
import 'package:inspire_me/settings.dart';

import 'favorites.dart';
import 'home.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  late List<Widget> tabs;

  static int tab = 0;

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
          gap: 8,
          haptic: true,
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),
          duration: const Duration(milliseconds: 400),
          activeColor: Colors.white,
          iconSize: 24,
          tabBackgroundColor: Theme.of(context).colorScheme.primary,
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
