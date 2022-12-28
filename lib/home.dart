import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inspire Me'),
      ),
      body: const Center(),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {}),
        child: const Icon(Icons.person),
      ),
    );
  }
}
