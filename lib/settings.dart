import 'package:flutter/material.dart';

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
              child: Column(
                children: [
                  SizedBox(
                    width: constraints.maxWidth,
                    height: 200,
                    child: Card(
                      elevation: 8,
                      color: Theme.of(context).colorScheme.primary,
                      child: Row(
                        children: const [
                          CircleAvatar(
                            child: Icon(
                              Icons.person,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Text('Data'),
                  Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        ListTile(
                          trailing: const Icon(
                            Icons.favorite,
                          ),
                          title: const Text('Favorites'),
                          subtitle: const Text(
                            'Clear all the data from Favorites Quotes.',
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          trailing: const Icon(
                            Icons.history,
                          ),
                          title: const Text('History'),
                          subtitle: const Text(
                            'Clear all the data from the History Quotes.',
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  const Text('Theme'),
                  Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        ListTile(
                          title: const Text(
                            'Default',
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          title: const Text(
                            'Change',
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  const Text('Profile'),
                  Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        ListTile(
                          title: const Text(
                            'Username',
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          title: const Text(
                            'Presentation',
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
