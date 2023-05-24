import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:inspire_me/dashboard.dart';
import 'package:inspire_me/data/data.dart';
import 'package:inspire_me/themes.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Presentation extends StatefulWidget {
  const Presentation({super.key});

  @override
  State<StatefulWidget> createState() => _Presentation();
}

class _Presentation extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
            title: 'Inspire Me',
            body: 'Do you feel like nothing inspirate you to work?',
            decoration: PageDecoration(
              titleTextStyle: TextStyle(
                fontSize: 54,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
              bodyAlignment: Alignment.center,
            )),
        PageViewModel(
            title: 'Learn and feel',
            body:
                'With Inspire Me, you will learn and feel all words of the most famous authors in the history of the world.',
            decoration: PageDecoration(
              titleTextStyle: TextStyle(
                fontSize: 54,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
              bodyAlignment: Alignment.center,
            )),
        PageViewModel(
          title: 'Choose a color that puts you in a good mood',
          bodyWidget: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 4,
            children: List.generate(Themes.colors.length, (index) {
              return OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Themes.colors[index],
                  side: const BorderSide(
                      color: Color.fromARGB(70, 35, 35, 35), width: 8),
                ),
                onPressed: () async {
                  AdaptiveTheme.of(context).setTheme(
                    light: Themes.changeTheme(index),
                    dark: Themes.changeTheme(index),
                  );
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setInt('defaultIndex', index);
                },
                child: null,
              );
            }),
          ),
          decoration: const PageDecoration(
            bodyAlignment: Alignment.center,
          ),
        ),
        PageViewModel(
          titleWidget: const Column(
            children: [
              Text(
                'Tell us your name',
                style: TextStyle(fontSize: 28),
              ),
              Text(
                'Enter to accept',
              ),
            ],
          ),
          bodyWidget: Column(
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: CircleAvatar(
                  child: RandomAvatar(
                    Data.username.isEmpty ? 'Lol' : Data.username,
                    height: 100,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 40, right: 40),
                child: TextField(
                  onSubmitted: (value) {
                    setState(() {
                      Data.username = value;
                    });
                  },
                  decoration:
                      const InputDecoration(hintText: 'Albert Einstein'),
                ),
              ),
            ],
          ),
          decoration: const PageDecoration(
            bodyAlignment: Alignment.center,
          ),
        ),
        PageViewModel(
          reverse: true,
          title: 'Share!',
          body:
              'In every moment you can share quotes. So enjoy and feel inspired.',
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 54,
              fontWeight: FontWeight.bold,
            ),
            bodyAlignment: Alignment.center,
          ),
        ),
      ],
      onDone: (() async {
        final prefs = await SharedPreferences.getInstance();
        prefs.setBool('presentation', true);

        // ignore: use_build_context_synchronously
        Navigator.push(context, MaterialPageRoute(builder: (builder) {
          return const Dashboard();
        }));
      }),
      done: const Icon(Icons.done),
      next: const Icon(Icons.arrow_forward),
      skip: const Text('Skip'),
      showDoneButton: true,
      showNextButton: true,
      showSkipButton: true,
    );
  }
}
