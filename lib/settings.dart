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
              child: SingleChildScrollView(
                child: Column(
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
                                      fontSize: 24),
                                ),
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
                            onTap: () {},
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
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            leading: const Icon(Icons.restart_alt),
                            title: const Text(
                              'Default',
                            ),
                            subtitle: const Text('Set the default theme.'),
                            onTap: () {},
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
        );
      },
    );
  }
}
