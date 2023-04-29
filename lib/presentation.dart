import 'package:inspire_me/dashboard.dart';
import 'package:inspire_me/home.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter/material.dart';

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
                shadows: const [
                  Shadow(
                    offset: Offset(2, 2.5),
                    blurRadius: 0,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  Shadow(
                    offset: Offset(3.0, 2.0),
                    blurRadius: 0.1,
                    color: Color.fromARGB(124, 0, 0, 0),
                  ),
                ],
              ),
              bodyAlignment: Alignment.center,
            )),
        PageViewModel(
          title: 'Page Two',
          body: 'Intro text',
        ),
        PageViewModel(
          reverse: true,
          title: 'Page Three',
          body: 'Intro text for three page',
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 54,
              fontWeight: FontWeight.bold,
            ),
            bodyAlignment: Alignment.center,
          ),
        ),
      ],
      onDone: (() {
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
