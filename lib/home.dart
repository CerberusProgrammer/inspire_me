import 'package:flutter/material.dart';
import 'package:quotes/quotes.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    String quoteContent = 'uwu';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inspire Me'),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          quoteContent,
          style: const TextStyle(
            fontFamily: 'Roboto',
            backgroundColor: Color.fromARGB(255, 244, 157, 6),
            letterSpacing: 1,
            fontStyle: FontStyle.italic,
            fontSize: 20,
          ),
          textAlign: TextAlign.justify,
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {}),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
